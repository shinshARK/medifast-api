from typing import Union, Annotated
from fastapi import FastAPI, HTTPException, Depends, status
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from database import engine, SessionLocal
from sqlalchemy.orm import Session
import models

app = FastAPI()
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# models.Base.metadata.create_all(bind=engine)

class ArticleBase(BaseModel):
    title: str
    content: str

class UserBase(BaseModel):
    firstname: str
    lastname: str

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

db_dependency = Annotated[Session, Depends(get_db)]

# def test_db_connection(db: Session = Depends(get_db)):
#     try:
#         # Attempt to execute a simple query
#         db.execute("SELECT 1")
#         print("Database connection successful!")
#     except Exception as e:
#         print("Error connecting to database:", e)
#     finally:
#         db.close()

# @app.get("/test-db-connection")
# def trigger_test_db_connection(db: Session = Depends(get_db)):
#     test_db_connection(db)
#     return {"message": "Database connection test triggered!"}

@app.get("/")
def read_root():
    return {"Hello": "World"}


@app.get("/articles/{id}")
async def read_article(id: int, db: Session = Depends(get_db)):
    article = db.query(models.Article).filter(models.Article.id == id).first()
    if article is None:
        raise HTTPException(status_code=404, detail="Article not found")
    return article
