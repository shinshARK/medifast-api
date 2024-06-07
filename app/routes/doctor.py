# routes/doctor.py

# Libraries
from fastapi import APIRouter, Depends, HTTPException, File, UploadFile, Form
from sqlalchemy.orm import Session
from datetime import datetime
from fastapi.responses import FileResponse
import os
# App
from app.database import get_db
from app.dependencies import *
from app.models import Doctor, User

doctor_router = APIRouter(prefix='/doctor', tags=['doctor'])

@doctor_router.get('/', dependencies=[Depends(JWTBearer())])
async def get_all_doctor(db: Session = Depends(get_db)):
    doctor = db.query(Doctor).all()
    return {
        "message": "Doctors retrieved successfully",
        "doctor": doctor,
    }
    
@doctor_router.post('/', response_model=dict, dependencies=[Depends(JWTBearer())])
async def create_doctor(
    name: str = Form(...),
    file: UploadFile = File(...),
    speciality: str = Form(...),
    rating: str = Form(...),
    experience: int = Form(...),
    about: str = Form(...),
    schedule: str = Form(...),  
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    existing_doctor = db.query(Doctor).filter(Doctor.name == name).first()
    if existing_doctor:
        raise HTTPException(status_code=stastus.HTTP_409_CONFLICT, detail="Title already exists")
    
    # UPLOAD FILE
    try:
        photo_file = await file.read()
        file_location = f"./app/photos/doctor_photos/{file.filename}"
        current_directory = os.getcwd()
        print("Current directory:", current_directory)
        with open(file_location, 'wb') as f:
            f.write(photo_file)
    except Exception:
        raise HTTPException(status_code=500, detail="Error uploading file")
    finally:
        await file.close()
        
    new_doctor = Doctor(
        name=name,
        speciality=speciality,
        rating=rating,
        experience=experience,
        about=about,
        schedule=schedule,
        created_at=datetime.now(),
        updated_at=datetime.now(),
        photo=file.filename
    )
    db.add(new_doctor)
    db.commit()
    db.refresh(new_doctor)
    
    return{
        "message" : "Photo created successfully",
        "data": {
            "id": new_doctor.id,
            "name": new_doctor.name,
            "path": new_doctor.photo
        },
    }
    
@doctor_router.get('/{id}', response_model=dict, dependencies=[Depends(JWTBearer())])
async def get_doctor(id: int, db:Session = Depends(get_db)):
    doctor = db.query(doctor).filter(doctor.id == id).first()
    if doctor is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="doctor not found")
    return {
        "message": "Doctor retrieved successfully",
        "doctor": doctor
    }

@doctor_router.get('/get_photo/{filename}', response_model=dict, dependencies=[Depends(JWTBearer())])
async def get_photo(filename: str):
    path = f"./app/photos/doctor_photos"
    if not os.path.exists(path):
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Photo not found")
    return FileResponse(path)
    
# TODO:
# Implement Update Endpoint (Put)
# Implement Delete Endpoint