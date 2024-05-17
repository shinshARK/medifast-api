# # schema/article_schema.py

# from pydantic import BaseModel
# from fastapi import Form, UploadFile, File

# class CreateArticleRequest(BaseModel):
#     title: str = Form(...),
#     author: str = Form(...),
#     content: str = Form(...),
#     file: UploadFile = File(...)

#     class Config:
#         from_attributes = True
