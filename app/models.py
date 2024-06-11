from sqlalchemy import Boolean, Column, Integer, String, Text, Date, DateTime, ForeignKey
from sqlalchemy.orm import relationship
from datetime import datetime
from app.database import Base

# Define the User model
class User(Base):
    __tablename__ = 'user'
    id = Column(Integer, primary_key=True)
    firstname = Column(String(255))
    lastname = Column(String(255))
    email = Column(String(255))
    telephone = Column(String(255))
    hashed_password = Column(String(255))
    tokens = relationship("Token", back_populates="user")
    # riwayat_transaksi = relationship("RiwayatTransaksi", back_populates="user")
    # user_doctor_favorite = relationship("UserDoctorFavorite", back_populates="user")  # Add this line


# Define the Token model
class Token(Base):
    __tablename__ = "token"
    user_id = Column(Integer, ForeignKey("user.id"), nullable=False)
    access_token = Column(String(450), primary_key=True)
    refresh_token = Column(String(450), nullable=False)
    status = Column(Boolean)
    created_date = Column(DateTime, default=datetime.now())
    user = relationship("User", back_populates="tokens")


# Define the Article model
class Article(Base):
    __tablename__ = 'article'
    id = Column(Integer, primary_key=True)
    title = Column(String(255))
    author = Column(String(255))
    photo = Column(String(255))
    content = Column(Text)
    created_at = Column(DateTime, nullable=False, default=datetime.now())
    updated_at = Column(DateTime, nullable=False, default=datetime.now(), onupdate=datetime.now())


# Define the Doctor model
class Doctor(Base):
    __tablename__ = 'doctor'
    id = Column(Integer, primary_key=True)
    name = Column(String(255))
    photo = Column(String(255))
    specialty = Column(String(255))
    rating = Column(String(255))
    experience = Column(Integer)
    about = Column(String(255))
    # schedule = Column(String(255))
    id_spesialis = Column(Integer, ForeignKey('spesialis.id_spesialis'), nullable=False)
    # spesialis = relationship("Specialty", back_populates="doctors")
    # user_doctor_favorite = relationship("UserDoctorFavorite", back_populates="doctor")
    # doctor_shift = relationship("DoctorShift", back_populates="doctor")
    # resep_digital = relationship("ResepDigital", back_populates="doctor")
    # riwayat_transaksi = relationship("RiwayatTransaksi", back_populates="doctor")


# Define the Specialty model
class Specialty(Base):
    __tablename__ = 'spesialis'
    id_spesialis = Column(Integer, primary_key=True)
    nama_spesialis = Column(String(255))
    # doctors = relationship("Doctor", back_populates="spesialis")


# Define the UserDoctorFavorite model
class UserDoctorFavorite(Base):
    __tablename__ = 'user_doctor_favorite'
    id = Column(Integer, primary_key=True)
    id_user = Column(Integer, ForeignKey('user.id'), nullable=False)
    id_doctor = Column(Integer, ForeignKey('doctor.id'), nullable=False)
    # user = relationship("User", back_populates="user_doctor_favorite")
    # doctor = relationship("Doctor", back_populates="user_doctor_favorite")


# Define the Shift model
class Shift(Base):
    __tablename__ = 'shift'
    id_shift = Column(Integer, primary_key=True)
    hari = Column(String(255))
    tipe_shift = Column(String(255))
    # doctor_shift = relationship("DoctorShift", back_populates="shift")


# Define the DoctorShift model
class DoctorShift(Base):
    __tablename__ = 'doctor_shift'
    id_doctor_shift = Column(Integer, primary_key=True)
    id_doctor = Column(Integer, ForeignKey('doctor.id'))
    id_shift = Column(Integer, ForeignKey('shift.id_shift'))
    # doctor = relationship("Doctor", back_populates="doctor_shift")
    # shift = relationship("Shift", back_populates="doctor_shift")
    # antrian = relationship("Antrian", back_populates="doctor_shift")


# Define the Antrian model
class Antrian(Base):
    __tablename__ = 'antrian'
    id_antrian = Column(Integer, primary_key=True)
    tanggal = Column(Date)
    current_antrian = Column(Integer)
    max_antrian = Column(Integer)
    id_doctor_shift = Column(Integer, ForeignKey('doctor_shift.id_shift'))
    # doctor_shift = relationship("DoctorShift", back_populates="antrian")
    # riwayat_transaksi = relationship("RiwayatTransaksi", back_populates="antrian")


# Define the Pasien model
class Pasien(Base):
    __tablename__ = 'pasien'
    id_pasien = Column(Integer, primary_key=True)
    nama_pasien = Column(String(255))
    umur = Column(Integer)
    jenis_kelamin = Column(String(255))
    # keluhan = Column(String(255))
    alamat = Column(String(255))
    # riwayat_transaksi = relationship("RiwayatTransaksi", back_populates="pasien")
    # resep_digital = relationship("ResepDigital", back_populates="pasien")


# Define the CatatanDokter model
class CatatanDokter(Base):
    __tablename__ = 'catatan_doctor'
    id_catatan_doctor = Column(Integer, primary_key=True)
    gejala = Column(String(255))
    diagnosa = Column(String(255))
    # riwayat_transaksi = relationship("RiwayatTransaksi", back_populates="catatan_doctor")


# Define the ResepDigital model
class ResepDigital(Base):
    __tablename__ = 'resep_digital'
    id_resep_digital = Column(Integer, primary_key=True)
    id_doctor = Column(Integer, ForeignKey('doctor.id'))
    id_pasien = Column(Integer, ForeignKey('pasien.id_pasien'))
    id_obat = Column(Integer, ForeignKey('obat.id_obat'))
    # doctor = relationship("Doctor", back_populates="resep_digital")
    # pasien = relationship("Pasien", back_populates="resep_digital")
    # obat = relationship("Obat", back_populates="resep_digital")
    # riwayat_transaksi = relationship("RiwayatTransaksi", back_populates="resep_digital")


# Define the Obat model
class Obat(Base):
    __tablename__ = 'obat'
    id_obat = Column(Integer, primary_key=True)
    nama_obat = Column(String(255))
    tipe = Column(String(255))
    harga_satuan = Column(String(255))
    # resep_digital = relationship("ResepDigital", back_populates="obat")


# Define the RiwayatTransaksi model
class RiwayatTransaksi(Base):
    __tablename__ = 'riwayat_transaksi'
    id_riwayat_transaksi = Column(Integer, primary_key=True)
    status = Column(String(255))
    jam = Column(String(255))
    id_doctor = Column(Integer, ForeignKey('doctor.id'))
    id_pasien = Column(Integer, ForeignKey('pasien.id_pasien'))
    id_antrian = Column(Integer, ForeignKey('antrian.id_antrian'))
    tipe_pembayaran = Column(String(255))
    jumlah_pembayaran = Column(String(255))
    id_user = Column(Integer, ForeignKey('user.id'))
    id_resep_digital = Column(Integer, ForeignKey('resep_digital.id_resep_digital'))
    id_catatan_dokter = Column(Integer, ForeignKey('catatan_doctor.id_catatan_doctor'))
    # doctor = relationship("Doctor", back_populates="riwayat_transaksi")
    # pasien = relationship("Pasien", back_populates="riwayat_transaksi")
    # antrian = relationship("Antrian", back_populates="riwayat_transaksi")
    # user = relationship("User", back_populates="riwayat_transaksi")
    # resep_digital = relationship("ResepDigital", back_populates="riwayat_transaksi")
    # catatan_doctor = relationship("CatatanDokter", back_populates="riwayat_transaksi")

def model_to_dict(model):
    """Convert SQLAlchemy model instance to dictionary."""
    return {column.name: getattr(model, column.name) for column in model.__table__.columns}

# # def model_to_dict_with_relationships(model, visited=None):
#     # """Convert SQLAlchemy model instance to dictionary, including relationships."""
#     if visited is None:
#         visited = set()

#     if model in visited:
#         return None  # Return None to break the recursion if the object has already been visited
#     visited.add(model)

#     result = {column.name: getattr(model, column.name) for column in model.__table__.columns}
#     # for relation in model.__mapper__.relationships:
#         related_obj = getattr(model, relation.key)
#         if related_obj is not None:
#             if relation.uselist:  # Handle collections
#                 # result[relation.key] = [model_to_dict_with_relationships(child, visited) for child in related_obj]
#             # else:  # Handle single relationships
#                 # result[relation.key] = model_to_dict_with_relationships(related_obj, visited)
#         else:
#             result[relation.key] = None
#     return result
