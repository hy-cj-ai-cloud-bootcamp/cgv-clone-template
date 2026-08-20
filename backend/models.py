"""SQLAlchemy 모델 정의 - CGV 클론"""
from sqlalchemy import Column, Integer, String, Text, ForeignKey, DateTime, Date
from sqlalchemy.orm import relationship
from datetime import datetime
from database import Base


class User(Base):
    __tablename__ = "users"
    id = Column(Integer, primary_key=True, index=True)
    username = Column(String(50), unique=True, nullable=False)
    email = Column(String(100), unique=True, nullable=False)
    hashed_password = Column(String(255), nullable=False)
    created_at = Column(DateTime, default=datetime.utcnow)
    bookings = relationship("Booking", back_populates="user")


class Movie(Base):
    """영화 모델"""
    __tablename__ = "movies"
    id = Column(Integer, primary_key=True, index=True)
    title = Column(String(200), nullable=False)
    genre = Column(String(100))
    synopsis = Column(Text)
    director = Column(String(100))
    cast = Column(Text)  # 콤마 구분
    duration = Column(Integer)  # 상영시간(분)
    rating = Column(String(20))  # 관람등급
    poster_url = Column(String(500))
    release_date = Column(String(20))
    status = Column(String(20), default="showing")  # showing, upcoming
    created_at = Column(DateTime, default=datetime.utcnow)
    schedules = relationship("Schedule", back_populates="movie")


class Theater(Base):
    """극장 모델"""
    __tablename__ = "theaters"
    id = Column(Integer, primary_key=True, index=True)
    name = Column(String(100), nullable=False)
    location = Column(String(200))
    screens = relationship("Screen", back_populates="theater")


class Screen(Base):
    """상영관 모델"""
    __tablename__ = "screens"
    id = Column(Integer, primary_key=True, index=True)
    theater_id = Column(Integer, ForeignKey("theaters.id"))
    name = Column(String(50), nullable=False)
    total_seats = Column(Integer, default=80)
    theater = relationship("Theater", back_populates="screens")
    schedules = relationship("Schedule", back_populates="screen")


class Schedule(Base):
    """상영 스케줄 모델"""
    __tablename__ = "schedules"
    id = Column(Integer, primary_key=True, index=True)
    movie_id = Column(Integer, ForeignKey("movies.id"))
    screen_id = Column(Integer, ForeignKey("screens.id"))
    date = Column(String(20), nullable=False)
    start_time = Column(String(10), nullable=False)
    end_time = Column(String(10), nullable=False)
    movie = relationship("Movie", back_populates="schedules")
    screen = relationship("Screen", back_populates="schedules")
    bookings = relationship("Booking", back_populates="schedule")


class Booking(Base):
    """예매 모델"""
    __tablename__ = "bookings"
    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, ForeignKey("users.id"))
    schedule_id = Column(Integer, ForeignKey("schedules.id"))
    seats = Column(Text)  # 콤마 구분 좌석번호
    total_amount = Column(Integer, nullable=False)
    status = Column(String(20), default="예매완료")
    created_at = Column(DateTime, default=datetime.utcnow)
    user = relationship("User", back_populates="bookings")
    schedule = relationship("Schedule", back_populates="bookings")
