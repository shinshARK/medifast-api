from fastapi import APIRouter, Depends, HTTPException, File, UploadFile, Form
from sqlalchemy.orm import Session
from sqlalchemy.sql import select
from datetime import datetime
import pytz  # Import pytz for timezone handling
from fastapi.responses import FileResponse
import os
# App
from app.database import get_db
from app.dependencies import *
from app.models import RiwayatTransaksi, Doctor, Pasien, Antrian, ResepDigital, CatatanDokter, User, model_to_dict

transaction_router = APIRouter(prefix='/transaction', tags=['transaction'])

# def get_next_current_antrian(db: Session) -> int:
#     # Get the maximum current_antrian value
#     max_current_antrian = db.query(Antrian.current_antrian).order_by(Antrian.current_antrian.desc()).first()
#     if max_current_antrian:
#         max_current_antrian = max_current_antrian[0]
#     else:
#         max_current_antrian = 0
    
#     # Increment the value or set to 1 if already 10
#     return max_current_antrian + 1 if max_current_antrian < 10 else 1

@transaction_router.post('/', response_model=dict, dependencies=[Depends(JWTBearer())])
async def create_transaction(
    status: str = Form(...),
    # jam: str = Form(...),
    id_doctor: int = Form(...),
    id_pasien: int = Form(...),
    id_antrian: int = Form(...),
    tipe_pembayaran: str = Form(...),
    jumlah_pembayaran: str = Form(...),
    id_user: int = Form(...),
    # id_resep_digital: int = Form(...),
    # id_catatan_dokter: int = Form(...),
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    # print(f"Received data: status={status}, jam={jam}, id_doctor={id_doctor}, id_pasien={id_pasien}, id_antrian={id_antrian}, tipe_pembayaran={tipe_pembayaran}, jumlah_pembayaran={jumlah_pembayaran}, id_user={id_user}, id_resep_digital={id_resep_digital}, id_catatan_dokter={id_catatan_dokter}")
    try:
        # Get next current_antrian value
        # Update current_antrian for the specified id_antrian
        antrian = db.query(Antrian).filter(Antrian.id_antrian == id_antrian).first()
        if not antrian:
            raise HTTPException(status_code=404, detail="Antrian not found")

        antrian.current_antrian = antrian.current_antrian + 1
        
        if antrian.current_antrian > antrian.max_antrian:
            return {
                "message" : "antrian sudah penuh"
            }
        
        # Set jam to the current timestamp in Jakarta timezone
        jakarta_tz = pytz.timezone('Asia/Jakarta')
        current_time = datetime.now(jakarta_tz).strftime('%H:%M')
        
        new_transaction = RiwayatTransaksi(
            status=status,
            jam=current_time,
            id_doctor=id_doctor,
            id_pasien=id_pasien,
            id_antrian=id_antrian,
            tipe_pembayaran=tipe_pembayaran,
            jumlah_pembayaran=jumlah_pembayaran,
            id_user=id_user,
            # id_resep_digital=id_resep_digital,
            # id_catatan_dokter=id_catatan_dokter
        )
        db.add(new_transaction)
        db.commit()
        db.refresh(new_transaction)
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error creating transaction: {e}")

    return {
        "message": "Transaction created successfully",
        "data": {
            "id_transakasi": new_transaction.id_riwayat_transaksi,
            "id_user": new_transaction.id_user
        },
    }


# READ all transactions with join
# @transaction_router.get('/', dependencies=[Depends(JWTBearer())])
# async def get_all_transactions(db: Session = Depends(get_db)):
#     transactions = (
#         db.query(RiwayatTransaksi)
#         .join(RiwayatTransaksi.doctor)
#         .join(RiwayatTransaksi.pasien)
#         .join(RiwayatTransaksi.antrian)
#         .join(RiwayatTransaksi.resep_digital)
#         .join(RiwayatTransaksi.catatan_doctor)
#         .all()
#     )
#     return {"message": "Transactions retrieved successfully", "transactions": transactions}

@transaction_router.get('/', dependencies=[Depends(JWTBearer())])
async def get_all_transactions_by_user(user_id: int, db: Session = Depends(get_db)):

    # Execute the SQL statement to fetch all transactions for the user
    transactions = (
        db.query(RiwayatTransaksi)
        .filter(RiwayatTransaksi.id_user == user_id)
        .all()
    )

    # Initialize lists to store details related to each transaction
    formatted_transactions = []
    for transaction in transactions:
        # Fetch details related to each transaction
        user = db.query(User).filter(User.id == user_id).first()
        resep_digital = db.query(ResepDigital).filter(ResepDigital.id_resep_digital == transaction.id_resep_digital).first()
        catatan_dokter = db.query(CatatanDokter).filter(CatatanDokter.id_catatan_doctor == transaction.id_catatan_dokter).first()
        doctor = db.query(Doctor).filter(Doctor.id == transaction.id_doctor).first()
        pasien = db.query(Pasien).filter(Pasien.id_pasien == transaction.id_pasien).first()
        antrian = db.query(Antrian).filter(Antrian.id_antrian == transaction.id_antrian).first()

        # Construct a dictionary with details of the transaction and related entities
        formatted_transaction = {
            "transaction": model_to_dict(transaction),
            "transaction_details": {
                "user": model_to_dict(user),
                "resep_digital": model_to_dict(resep_digital) if resep_digital else None,
                "catatan_dokter": model_to_dict(catatan_dokter) if catatan_dokter else None,
                "doctor": model_to_dict(doctor),
                "pasien": model_to_dict(pasien),
                "antrian": model_to_dict(antrian),    
            }
        }

        # Append the formatted transaction to the list
        formatted_transactions.append(formatted_transaction)

    return {"message": "Transactions retrieved successfully", "transactions": formatted_transactions}

def model_to_dict(model):
    if model is None:
        return None
    return {column.name: getattr(model, column.name) for column in model.__table__.columns}


# READ a specific transaction by ID with join
# @transaction_router.get('/{transaction_id}', dependencies=[Depends(JWTBearer())])
# async def get_transaction(transaction_id: int, db: Session = Depends(get_db)):
#     transaction = (
#         db.query(RiwayatTransaksi)
#         .filter(RiwayatTransaksi.id == transaction_id)
#         .join(Doctor)
#         .join(Pasien)
#         .join(Antrian)
#         .join(ResepDigital)
#         .join(CatatanDokter)
#         .first()
#     )
#     if not transaction:
#         raise HTTPException(status_code=404, detail="Transaction not found")
#     return {"message": "Transaction retrieved successfully", "transaction": transaction}

# UPDATE a transaction by ID
# @transaction_router.put('/{transaction_id}', response_model=dict, dependencies=[Depends(JWTBearer())])
# async def update_transaction(
#     transaction_id: int,
#     status: str,
#     jam: str,
#     id_doctor: int,
#     id_pasien: int,
#     id_antrian: int,
#     tipe_pembayaran: str,
#     jumlah_pembayaran: str,
#     id_user: int,
#     id_resep_digital: int,
#     id_catatan_doctor: int,
#     db: Session = Depends(get_db)
# ):
#     transaction = db.query(RiwayatTransaksi).filter(RiwayatTransaksi.id == transaction_id).first()
#     if not transaction:
#         raise HTTPException(status_code=404, detail="Transaction not found")
    
#     transaction.status = status
#     transaction.jam = jam
#     transaction.doctor_id = id_doctor
#     transaction.pasien_id = id_pasien
#     transaction.antrian_id = id_antrian
#     transaction.tipe_pembayaran = tipe_pembayaran
#     transaction.jumlah_pembayaran = jumlah_pembayaran
#     transaction.user_id = id_user
#     transaction.resep_digital_id = id_resep_digital
#     transaction.catatan_doctor_id = id_catatan_doctor
    
#     db.commit()
#     db.refresh(transaction)
    
#     return {"message": "Transaction updated successfully", "data": transaction}

# # DELETE a transaction by ID
# @transaction_router.delete('/{transaction_id}', response_model=dict, dependencies=[Depends(JWTBearer())])
# async def delete_transaction(transaction_id: int, db: Session = Depends(get_db)):
#     transaction = db.query(RiwayatTransaksi).filter(RiwayatTransaksi.id == transaction_id).first()
#     if not transaction:
#         raise HTTPException(status_code=404, detail="Transaction not found")
    
#     db.delete(transaction)
#     db.commit()
    
#     return {"message": "Transaction deleted successfully"}

@transaction_router.put('/{transaction_id}', response_model=dict, dependencies=[Depends(JWTBearer())])
async def update_transaction(
    transaction_id: int,
    status: str = Form(...),
    jam: str = Form(...),
    id_doctor: int = Form(...),
    id_pasien: int = Form(...),
    id_antrian: int = Form(...),
    tipe_pembayaran: str = Form(...),
    jumlah_pembayaran: str = Form(...),
    id_user: int = Form(...),
    id_resep_digital: int = Form(...),
    id_catatan_dokter: int = Form(...),
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    try:
        transaction = db.query(RiwayatTransaksi).filter(RiwayatTransaksi.id_riwayat_transaksi == transaction_id).first()
        if not transaction:
            raise HTTPException(status_code=404, detail="Transaction not found")

        # Update transaction details
        transaction.status = status
        transaction.jam = jam
        transaction.id_doctor = id_doctor
        transaction.id_pasien = id_pasien
        transaction.id_antrian = id_antrian
        transaction.tipe_pembayaran = tipe_pembayaran
        transaction.jumlah_pembayaran = jumlah_pembayaran
        transaction.id_user = id_user
        transaction.id_resep_digital = id_resep_digital
        transaction.id_catatan_dokter = id_catatan_dokter

        db.commit()
        db.refresh(transaction)

        return {
            "message": "Transaction updated successfully",
            "data":{
            "id_transakasi": transaction.id_riwayat_transaksi,
            "id_user": transaction.id_user
        },
        }
    except HTTPException as http_error:
        raise http_error
    except Exception as e:
        db.rollback()  # Rollback in case of error
        raise HTTPException(status_code=500, detail=f"Error updating transaction: {e}")


@transaction_router.delete('/{transaction_id}', response_model=dict, dependencies=[Depends(JWTBearer())])
async def delete_transaction(transaction_id: int, db: Session = Depends(get_db)):
    try:
        transaction = db.query(RiwayatTransaksi).filter(RiwayatTransaksi.id_riwayat_transaksi == transaction_id).first()
        if not transaction:
            raise HTTPException(status_code=404, detail="Transaction not found")

        db.delete(transaction)
        db.commit()

        return {
            "message": "Transaction deleted successfully"
        }
    except HTTPException as http_error:
        raise http_error
    except Exception as e:
        db.rollback()  # Rollback in case of error
        raise HTTPException(status_code=500, detail=f"Error deleting transaction: {e}")