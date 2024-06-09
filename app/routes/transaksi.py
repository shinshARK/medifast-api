from fastapi import APIRouter, Depends, HTTPException, File, UploadFile, Form
from sqlalchemy.orm import Session
from datetime import datetime
from fastapi.responses import FileResponse
import os
# App
from app.database import get_db
from app.dependencies import *
from app.models import RiwayatTransaksi, Doctor, Pasien, Antrian, ResepDigital, CatatanDokter

transaction_router = APIRouter(prefix='/transaction', tags=['transaction'])

# CREATE a new transaction
@transaction_router.post('/', response_model=dict, dependencies=[Depends(JWTBearer())])
async def create_transaction(
    status: str,
    jam: str,
    id_doctor: int,
    id_pasien: int,
    id_antrian: int,
    tipe_pembayaran: str,
    jumlah_pembayaran: str,
    id_user: int,
    id_resep_digital: int,
    id_catatan_dokter: int,
    db: Session = Depends(get_db)
):
    new_transaction = RiwayatTransaksi(
        status=status,
        jam=jam,
        doctor_id=id_doctor,
        pasien_id=id_pasien,
        antrian_id=id_antrian,
        tipe_pembayaran=tipe_pembayaran,
        jumlah_pembayaran=jumlah_pembayaran,
        user_id=id_user,
        resep_digital_id=id_resep_digital,
        catatan_doctor_id=id_catatan_dokter
    )
    db.add(new_transaction)
    db.commit()
    db.refresh(new_transaction)
    
    return {
        "message": "Transaction created successfully",
        "data": new_transaction
    }

# READ all transactions with join
@transaction_router.get('/', dependencies=[Depends(JWTBearer())])
async def get_all_transactions(db: Session = Depends(get_db)):
    transactions = (
        db.query(RiwayatTransaksi)
        .join(Doctor)
        .join(Pasien)
        .join(Antrian)
        .join(ResepDigital)
        .join(CatatanDokter)
        .all()
    )
    return {"message": "Transactions retrieved successfully", "transactions": transactions}

# READ a specific transaction by ID with join
@transaction_router.get('/{transaction_id}', dependencies=[Depends(JWTBearer())])
async def get_transaction(transaction_id: int, db: Session = Depends(get_db)):
    transaction = (
        db.query(RiwayatTransaksi)
        .filter(RiwayatTransaksi.id == transaction_id)
        .join(Doctor)
        .join(Pasien)
        .join(Antrian)
        .join(ResepDigital)
        .join(CatatanDokter)
        .first()
    )
    if not transaction:
        raise HTTPException(status_code=404, detail="Transaction not found")
    return {"message": "Transaction retrieved successfully", "transaction": transaction}

# UPDATE a transaction by ID
@transaction_router.put('/{transaction_id}', response_model=dict, dependencies=[Depends(JWTBearer())])
async def update_transaction(
    transaction_id: int,
    status: str,
    jam: str,
    id_doctor: int,
    id_pasien: int,
    id_antrian: int,
    tipe_pembayaran: str,
    jumlah_pembayaran: str,
    id_user: int,
    id_resep_digital: int,
    id_catatan_dokter: int,
    db: Session = Depends(get_db)
):
    transaction = db.query(RiwayatTransaksi).filter(RiwayatTransaksi.id == transaction_id).first()
    if not transaction:
        raise HTTPException(status_code=404, detail="Transaction not found")
    
    transaction.status = status
    transaction.jam = jam
    transaction.doctor_id = id_doctor
    transaction.pasien_id = id_pasien
    transaction.antrian_id = id_antrian
    transaction.tipe_pembayaran = tipe_pembayaran
    transaction.jumlah_pembayaran = jumlah_pembayaran
    transaction.user_id = id_user
    transaction.resep_digital_id = id_resep_digital
    transaction.catatan_doctor_id = id_catatan_dokter
    
    db.commit()
    db.refresh(transaction)
    
    return {"message": "Transaction updated successfully", "data": transaction}

# DELETE a transaction by ID
@transaction_router.delete('/{transaction_id}', response_model=dict, dependencies=[Depends(JWTBearer())])
async def delete_transaction(transaction_id: int, db: Session = Depends(get_db)):
    transaction = db.query(RiwayatTransaksi).filter(RiwayatTransaksi.id == transaction_id).first()
    if not transaction:
        raise HTTPException(status_code=404, detail="Transaction not found")
    
    db.delete(transaction)
    db.commit()
    
    return {"message": "Transaction deleted successfully"}
