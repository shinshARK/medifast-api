from sqlalchemy import Boolean, Column, Integer, String, Text, Date, DateTime, ForeignKey
from sqlalchemy.orm import relationship
from datetime import datetime
from app.database import Base


class User(Base):
    __tablename__ = 'user'

    id = Column(Integer, primary_key=True)
    firstname = Column(String(255))
    lastname = Column(String(255))
    email = Column(String(255))
    telephone = Column(String(255))
    hashed_password = Column()

    tokens = relationship("Token", back_populates="user")

class Token(Base):
    __tablename__ = "token"
    user_id = Column(Integer, ForeignKey("user.id"), nullable=False)
    access_token = Column(String(450), primary_key=True)
    refresh_token = Column(String(450), nullable=False)
    status = Column(Boolean)
    created_date = Column(DateTime, default=datetime.now())

    user = relationship("User", back_populates="tokens")

class Article(Base):
    __tablename__ = 'article'

    id = Column(Integer, primary_key=True)
    title = Column(String(255))
    author = Column(String(255))
    photo = Column(String(255))
    content = Column(Text)
    created_at = Column(DateTime, nullable=False, default=datetime.now())
    updated_at = Column(DateTime, nullable=False, default=datetime.now(), onupdate=datetime.now())

# Define the Dokter model
class Doctor(Base):
    __tablename__ = 'doctor'

    id = Column(Integer, primary_key=True)
    name = Column(String(255))
    photo = Column(String(255))
    specialty = Column(String(255))
    rating = Column(String(255))
    experience = Column(Integer)
    about = Column(String(255))
    schedule = Column(String(255))

# Define the User model
