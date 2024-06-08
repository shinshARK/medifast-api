from fastapi import File, UploadFile, Form

from pydantic import BaseModel
from typing import List
from datetime import datetime

class ArticleBase(BaseModel):
    title: str
    author: str
    photo: str
    content: str


class ArticleCreateSchema(ArticleBase):
    title: str = Form(...),
    author: str = Form(...),
    content: str = Form(...),
    file: UploadFile = File(...),

    class Config:
        orm_mode = True
        
    