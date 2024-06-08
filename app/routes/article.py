from fastapi import APIRouter, Depends, HTTPException, File, UploadFile, Form, status
from sqlalchemy.orm import Session
from fastapi.responses import FileResponse
import os
from datetime import datetime

from app.dependencies import JWTBearer, get_current_user
from app.database import get_db
from app.models import Article, User
from app.schema.article_schema import ArticleCreateSchema

article_router = APIRouter(prefix='/articles', tags=['articles'])

@article_router.get('/', dependencies=[Depends(JWTBearer())])
async def get_all_articles(db: Session = Depends(get_db)):
    articles = db.query(Article).all()
    return articles
# async def get_all_articles(db: Session = Depends(get_db)):
#     articles = db.query(Article).all()
#     return ArticlesListSchema(articles=articles)
@article_router.post('/', response_model=dict, dependencies=[Depends(JWTBearer())])
async def create_article(
    title: str = Form(...),
    author: str = Form(...),
    content: str = Form(...),
    file: UploadFile = File(...),
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    existing_article = db.query(Article).filter(Article.title == title).first()
    if existing_article:
        raise HTTPException(status_code=status.HTTP_409_CONFLICT, detail="Title already exists")

    # Upload file
    try:
        photo_file = await file.read()
        file_location = f"./app/photos/article_photos/{file.filename}"
        current_directory = os.getcwd()
        print("Current directory:", current_directory)
        with open(file_location, 'wb') as f:
            f.write(photo_file)
    except Exception:
        raise HTTPException(status_code=500, detail="Error uploading file")
    finally:
        await file.close()

    new_article = Article(
        title=title,
        content=content,
        author=author,
        created_at=datetime.now(),
        updated_at=datetime.now(),
        photo=file.filename
    )
    db.add(new_article)
    db.commit()
    db.refresh(new_article)

    return {
        "message": "Photo created successfully",
        "data": {
            "id": new_article.id,
            "title": new_article.title,
            "path": new_article.photo
        },
    }

@article_router.get('/{id}', dependencies=[Depends(JWTBearer())])
async def get_article(id: int, db: Session = Depends(get_db)):
    article = db.query(Article).filter(Article.id == id).first()
    if article is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Article not found")

    return article

@article_router.get('/get_photo/{filename}', response_model=dict, dependencies=[Depends(JWTBearer())])
async def get_photo(filename: str):
    path = f"./app/photos/article_photos/{filename}"
    if not os.path.exists(path):
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Photo not found")
    return FileResponse(path)
