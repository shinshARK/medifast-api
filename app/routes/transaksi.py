from fastapi import APIRouter, Depends, HTTPException, File, UploadFile, Form
from sqlalchemy.orm import Session
from datetime import datetime
from fastapi.responses import FileResponse
import os
# App
from app.database import get_db
from app.dependencies import *
from typing import List
from app.models import RiwayatTransaksi

transaksi = APIRouter(prefix='/transaksi', tags=['transaksi'])

# CREATE a new transaksi
@transaksi.post('/', response_model=RiwayatTransaksi, dependencies=[Depends(JWTBearer())])
async def create_transaksi(
    transaksi: RiwayatTransaksi,
    db: Session = Depends(get_db)
):
    db.add(transaksi)
    db.commit()
    db.refresh(transaksi)
    
    return transaksi

# READ all transaksi
@transaksi.get('/', dependencies=[Depends(JWTBearer())])
async def get_all_doctor(db: Session = Depends(get_db)):
    transaksi = db.query(RiwayatTransaksi).all()
    return transaksi
    
# READ a specific transaksi by ID
@transaksi.get('/{transaksi_id}', response_model=RiwayatTransaksi, dependencies=[Depends(JWTBearer())])
async def get_transaksi(transaksi_id: int, db: Session = Depends(get_db)):
    transaksi = db.query(RiwayatTransaksi).filter(RiwayatTransaksi.id_riwayat_transaksi == transaksi_id).first()
    if not transaksi:
        raise HTTPException(status_code=404, detail="Transaksi not found")
    return transaksi

# UPDATE a transaksi by ID
@transaksi.put('/{transaksi_id}', response_model=RiwayatTransaksi, dependencies=[Depends(JWTBearer())])
async def update_transaksi(
    transaksi_id: int,
    transaksi: RiwayatTransaksi,
    db: Session = Depends(get_db)
):
    existing_transaksi = db.query(RiwayatTransaksi).filter(RiwayatTransaksi.id_riwayat_transaksi == transaksi_id).first()
    if not existing_transaksi:
        raise HTTPException(status_code=404, detail="Transaksi not found")
    
    # Update the existing transaksi with new data
    existing_transaksi.status = transaksi.status
    existing_transaksi.jam = transaksi.jam
    existing_transaksi.doctor_id = transaksi.doctor_id
    existing_transaksi.pasien_id = transaksi.pasien_id
    existing_transaksi.antrian_id = transaksi.antrian_id
    existing_transaksi.tipe_pembayaran = transaksi.tipe_pembayaran
    existing_transaksi.jumlah_pembayaran = transaksi.jumlah_pembayaran
    existing_transaksi.user_id = transaksi.user_id
    existing_transaksi.resep_digital_id = transaksi.resep_digital_id
    existing_transaksi.catatan_doctor_id = transaksi.catatan_doctor_id
    
    db.commit()
    db.refresh(existing_transaksi)
    
    return existing_transaksi

# DELETE a transaksi by ID
@transaksi.delete('/{transaksi_id}', response_model=dict, dependencies=[Depends(JWTBearer())])
async def delete_transaksi(transaksi_id: int, db: Session = Depends(get_db)):
    transaksi = db.query(RiwayatTransaksi).filter(RiwayatTransaksi.id_riwayat_transaksi == transaksi_id).first()
    if not transaksi:
        raise HTTPException(status_code=404, detail="Transaksi not found")
    
    db.delete(transaksi)
    db.commit()
    
    return {"message": "Transaksi deleted successfully"}
