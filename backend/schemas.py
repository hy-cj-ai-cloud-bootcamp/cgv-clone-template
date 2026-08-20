"""Pydantic 스키마 - CGV 클론"""
from pydantic import BaseModel
from typing import Optional, List


class UserRegister(BaseModel):
    username: str
    email: str
    password: str

class UserLogin(BaseModel):
    email: str
    password: str

class Token(BaseModel):
    access_token: str
    token_type: str = "bearer"
    username: str

class MovieResponse(BaseModel):
    id: int
    title: str
    genre: Optional[str] = None
    synopsis: Optional[str] = None
    director: Optional[str] = None
    cast: Optional[str] = None
    duration: Optional[int] = None
    rating: Optional[str] = None
    poster_url: Optional[str] = None
    release_date: Optional[str] = None
    status: Optional[str] = None
    class Config:
        from_attributes = True

class ScheduleResponse(BaseModel):
    id: int
    movie_title: str
    theater_name: str
    screen_name: str
    date: str
    start_time: str
    end_time: str

class BookingCreate(BaseModel):
    schedule_id: int
    seats: List[str]

class BookingResponse(BaseModel):
    id: int
    movie_title: str
    theater_name: str
    screen_name: str
    date: str
    start_time: str
    seats: List[str]
    total_amount: int
    status: str

class ChatRequest(BaseModel):
    message: str

class ChatResponse(BaseModel):
    reply: str
