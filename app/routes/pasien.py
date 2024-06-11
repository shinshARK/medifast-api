# routes/pasien.py

# Libraries
from fastapi import APIRouter, Depends, HTTPException, File, UploadFile, Form
from sqlalchemy.orm import Session
from fastapi.responses import FileResponse, Response
from starlette import status

import os
# App
from app.database import get_db
from app.dependencies import JWTBearer, get_current_user
from app.models import Pasien, User

pasien_router = APIRouter(prefix='/pasien', tags=['pasien'])

@pasien_router.get('/', dependencies=[Depends(JWTBearer())])
async def get_all_pasien(db: Session = Depends(get_db)):
    pasien = db.query(Pasien).all()
    return {
        "message": "Patients retrieved successfully",
        "patients": pasien,
    }

@pasien_router.post('/', response_model=dict, dependencies=[Depends(JWTBearer())])
async def create_pasien(
    response: Response,
    nama_pasien: str = Form(...),
    umur: int = Form(...),
    jenis_kelamin: str = Form(...),
    # keluhan: str = Form(...),
    alamat: str = Form(...),
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user),
):
    
    existing_pasien = db.query(Pasien).filter(Pasien.nama_pasien == nama_pasien, Pasien.alamat == alamat).first()
    if existing_pasien is not None:
        response.status_code = status.HTTP_409_CONFLICT
        return {
            "message": "Patient already exists",
            "id_pasien": existing_pasien.id_pasien,
        }
    
    new_pasien = Pasien(
        nama_pasien=nama_pasien,
        umur=umur,
        jenis_kelamin=jenis_kelamin,
        # keluhan=keluhan,
        alamat=alamat
    )
    db.add(new_pasien)
    db.commit()
    db.refresh(new_pasien)
    
    return {
        "message": "Patient created successfully",
        "id_pasien": new_pasien.id_pasien,
        "nama_pasien": new_pasien.nama_pasien
    }

@pasien_router.get('/{id_pasien}', dependencies=[Depends(JWTBearer())])
async def get_pasien(id_pasien: int, db: Session = Depends(get_db)):
    pasien = db.query(Pasien).filter(Pasien.id_pasien == id_pasien).first()
    if pasien is None:
        raise HTTPException(status_code=404, detail="Patient not found")
    
    return {
        "patient": pasien,
    }

# TODO:
# Implement Update Endpoint (Put)
# Implement Delete Endpoint

