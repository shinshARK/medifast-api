from sqlalchemy import Boolean, Column, Integer, String, Text, Date
from database import Base

class Article(Base):
    __tablename__ = 'article'

    id = Column(Integer, primary_key=True)
    title = Column(String(255))
    photo = Column(String(255))
    content = Column(Text)
    createdat = Column(Date)
    updatedat = Column(Date)

# Define the Dokter model
class Doctor(Base):
    __tablename__ = 'doctor'

    id = Column(Integer, primary_key=True)
    name = Column(String(255))
    photo = Column(String(255))
    specialty = Column(String(255))
    rating = Column(String(255))
    favorited = Column(Integer)
    experience = Column(Integer)
    about = Column(String(255))
    schedule = Column(String(255))

# Define the User model
class User(Base):
    __tablename__ = 'user'

    id = Column(Integer, primary_key=True)
    firstname = Column(String(255))
    lastname = Column(String(255))
    email = Column(String(255))
    telephone = Column(String(255))
    hashed_password = Column()