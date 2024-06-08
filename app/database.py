from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy.ext.declarative import declarative_base

# Define the SQLite database URL
SQLALCHEMY_DATABASE_URL = "sqlite:///db_medifast.db"  # Replace with the path to your SQLite database file

# Create a SQLAlchemy engine
engine = create_engine(SQLALCHEMY_DATABASE_URL, connect_args={"check_same_thread": False})

# Create a sessionmaker to create database sessions
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

# Define a base class for SQLAlchemy models
Base = declarative_base()

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
