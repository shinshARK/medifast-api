# Libraries
from datetime import timedelta, datetime
from typing import Annotated
from fastapi import APIRouter, Depends, HTTPException
from pydantic import BaseModel
from sqlalchemy.orm import Session
from starlette import status
from passlib.context import CryptContext
from fastapi.security import OAuth2PasswordRequestForm, OAuth2PasswordBearer
from jose import jwt, JWTError
# App
from app.database import SessionLocal
from app.models import User, Token
from app.schema import user_schema
from app.dependencies import get_db, verify_password, create_access_token, create_refresh_token, get_hashed_password, JWTBearer

auth_router = APIRouter(
    prefix='/auth',
    tags=['auth']
)

SECRET_KEY = 'd2hvdGhlaGVsbGJyaW5nc2FmbGFndG9jb21iYXQ/IQ==' # elysium
ALGORITHM = 'HS256'

bcrypt_context = CryptContext(schemes=['bcrypt'], deprecated='auto')
oauth2_bearer = OAuth2PasswordBearer(tokenUrl='auth/token')

# db_dependency = Annotated[Session, Depends(get_db)]


@auth_router.post("/register", response_model=dict,status_code=status.HTTP_201_CREATED)
async def register(user: user_schema.CreateUserRequest,
                   db: Session = Depends(get_db)):
    existing_user = db.query(User).filter(User.email == user.email).first()
    if existing_user:
        raise HTTPException(status_code=status.HTTP_409_CONFLICT, detail="Email already used")

    new_user = User(
        firstname = user.firstname,
        lastname = user.lastname,
        email = user.email,
        telephone = user.telephone,
        hashed_password = get_hashed_password(user.password)
    )

    db.add(new_user)
    db.commit()
    db.refresh(new_user)

    return {
        "message": "User registered successfully",
        "user_id": new_user.id
    }

# it asks for username but actually use email
@auth_router.post("/login", response_model=dict)
async def login(request: user_schema.LoginUserRequest,
                db: Session = Depends(get_db)):
    user = db.query(User).filter(User.email == request.email).first()

    if user is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="User with that email does not exist")
    hashed_password = user.hashed_password # from database
    if not verify_password(password=request.password, hashed_password=hashed_password):
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED)

    access = create_access_token(user.id)
    refresh = create_refresh_token(user.id)

    new_token = Token(user_id=user.id, access_token=access, refresh_token=refresh, status=True) # status is 'isLoggedIn?'
    db.add(new_token)
    db.commit()
    db.refresh(new_token)

    return {
        "message": "Login Success",
        "user": {
            "id": user.id,
            "firstname": user.firstname,
            "lastname": user.lastname,
            "email": user.email
        },
        "tokens": {"access_token": access, "refresh_token": refresh},
    }

@auth_router.put("/update", response_model=dict, dependencies=[Depends(JWTBearer())])
async def update_user(
    user: user_schema.UpdateUserRequest,
    db: Session = Depends(get_db)
):
    existing_user = db.query(User).filter(User.id == user.id).first()
    if not existing_user:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="User not found")

    # Update user details
    existing_user.firstname = user.firstname
    existing_user.lastname = user.lastname
    existing_user.email = user.email
    existing_user.telephone = user.telephone

    # Update hashed_password if a new password is provided
    if user.password:
        existing_user.hashed_password = get_hashed_password(user.password)

    db.commit()
    db.refresh(existing_user)

    return {
        "message": "User updated successfully",
        "user": {
            "id": existing_user.id,
            "firstname": existing_user.firstname,
            "lastname": existing_user.lastname,
            "email": existing_user.email,
            "telephone": existing_user.telephone
        }
    }




@auth_router.post('/logout')
async def logout(token: str = Depends(JWTBearer()), db: Session = Depends(get_db)):
    payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])

    user_id = payload['sub']
    one_day_ago = datetime.utcnow() - timedelta(days=1)
    db.query(Token).filter(
        Token.user_id == user_id,
        Token.created_date < one_day_ago
    ).delete(synchronize_session=False)

    db.commit()

    existing_token = db.query(Token).filter(Token.access_token == token).first()

    if existing_token:
        existing_token.status = False
        db.commit()
        db.refresh(existing_token)

    return {"message": "Logged out Successfully"}









