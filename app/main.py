from typing import Union, Annotated
from fastapi import FastAPI, HTTPException, Depends, status
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from app.database import engine, SessionLocal
from sqlalchemy.orm import Session
import app.models as models
from app.routes import auth, article

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

models.Base.metadata.create_all(bind=engine)
app.include_router(auth.auth_router)
app.include_router(article.article_router)

@app.get("/")
def read_root():
    return {"Hello": "World"}

