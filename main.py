from typing import Union, Annotated
from fastapi import FastAPI, HTTPException, Depends, status
from pydantic import BaseModel
import models
from database import engine, SessionLocal
from sqlalchemy.orm import Session

app = FastAPI()
models.Base.metadata.create_all(bind=engine)

class ArtikelBase(BaseModel):
    judul: str
    isi: str

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

def test_db_connection(db: Session = Depends(get_db)):
    try:
        # Attempt to execute a simple query
        db.execute("SELECT 1")
        print("Database connection successful!")
    except Exception as e:
        print("Error connecting to database:", e)
    finally:
        db.close()

@app.get("/test-db-connection")
def trigger_test_db_connection(db: Session = Depends(get_db)):
    test_db_connection(db)
    return {"message": "Database connection test triggered!"}

@app.get("/")
def read_root():
    return {"Hello": "World"}


@app.get("/artikel/{id_artikel}", status_code=status.HTTP_200_OK)
async def read_artikel(id_artikel: int, db: db_dependency):
    artikel = db.query(models.Artikel).filter(models.Artikel.id_artikel == id_artikel).first()
    if artikel is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail='Article not found')
    return artikel

