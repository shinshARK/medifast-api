from sqlalchemy import Boolean, Column, Integer, String, Text, Date
from database import Base

class Artikel(Base):
    __tablename__ = 'artikel'

    id_artikel = Column(Integer, primary_key=True)
    judul = Column(String(255))
    foto = Column(String(255))
    isi = Column(Text)
    createdat = Column(Date)
    updatedat = Column(Date)

# Define the Dokter model
class Dokter(Base):
    __tablename__ = 'dokter'

    id_dokter = Column(Integer, primary_key=True)
    nama_dokter = Column(String(255))
    image = Column(String(255))
    spesialis = Column(String(255))
    rating = Column(String(255))
    favorited = Column(Integer)
    pengalaman = Column(Integer)
    tentang = Column(String(255))
    jadwal = Column(String(255))

# Define the User model
class User(Base):
    __tablename__ = 'user'

    id_user = Column(Integer, primary_key=True)
    first_name = Column(String(255))
    lastname = Column(String(255))
    email = Column(String(255))
    telephone = Column(String(255))
    password = Column(String(255))