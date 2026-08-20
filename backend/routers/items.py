"""영화/스케줄/예매 라우터 - CGV"""
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from typing import Optional

from database import get_db
from schemas import BookingCreate
from crud import (
    get_movies, get_movie, get_schedules, get_schedule,
    get_taken_seats, create_booking, get_user_bookings
)
from .auth import get_current_user

router = APIRouter()


# ===== 영화 API =====

@router.get("/movies")
def list_movies(status: Optional[str] = None, db: Session = Depends(get_db)):
    """영화 목록 조회 (status: showing/upcoming)"""
    movies = get_movies(db, status)
    return {"movies": [
        {
            "id": m.id, "title": m.title, "genre": m.genre,
            "director": m.director, "duration": m.duration,
            "rating": m.rating, "poster_url": m.poster_url,
            "release_date": m.release_date, "status": m.status
        } for m in movies
    ]}


@router.get("/movies/{movie_id}")
def get_movie_detail(movie_id: int, db: Session = Depends(get_db)):
    """영화 상세 조회"""
    movie = get_movie(db, movie_id)
    if not movie:
        raise HTTPException(status_code=404, detail="영화를 찾을 수 없습니다.")
    return {
        "id": movie.id, "title": movie.title, "genre": movie.genre,
        "synopsis": movie.synopsis, "director": movie.director,
        "cast": movie.cast, "duration": movie.duration,
        "rating": movie.rating, "poster_url": movie.poster_url,
        "release_date": movie.release_date, "status": movie.status
    }


# ===== 상영 스케줄 API =====

@router.get("/schedules")
def list_schedules(
    date: Optional[str] = None,
    movie_id: Optional[int] = None,
    db: Session = Depends(get_db)
):
    """상영 스케줄 조회"""
    schedules = get_schedules(db, date, movie_id)
    return [
        {
            "id": s.id,
            "movie_title": s.movie.title,
            "theater_name": s.screen.theater.name,
            "screen_name": s.screen.name,
            "date": s.date,
            "start_time": s.start_time,
            "end_time": s.end_time
        } for s in schedules
    ]


@router.get("/schedules/{schedule_id}")
def get_schedule_detail(schedule_id: int, db: Session = Depends(get_db)):
    """스케줄 상세 (좌석 정보 포함)"""
    schedule = get_schedule(db, schedule_id)
    if not schedule:
        raise HTTPException(status_code=404, detail="스케줄을 찾을 수 없습니다.")
    taken = get_taken_seats(db, schedule_id)
    return {
        "id": schedule.id,
        "movie_title": schedule.movie.title,
        "theater_name": schedule.screen.theater.name,
        "screen_name": schedule.screen.name,
        "date": schedule.date,
        "start_time": schedule.start_time,
        "end_time": schedule.end_time,
        "total_seats": schedule.screen.total_seats,
        "taken_seats": taken
    }


# ===== 예매 API =====

@router.post("/bookings")
def book(
    data: BookingCreate,
    user_id: int = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """예매하기"""
    schedule = get_schedule(db, data.schedule_id)
    if not schedule:
        raise HTTPException(status_code=404, detail="스케줄을 찾을 수 없습니다.")
    
    # 이미 예매된 좌석 확인
    taken = get_taken_seats(db, data.schedule_id)
    for seat in data.seats:
        if seat in taken:
            raise HTTPException(status_code=400, detail=f"좌석 {seat}은(는) 이미 예매되었습니다.")
    
    booking = create_booking(db, user_id, data.schedule_id, data.seats)
    return {"message": "예매가 완료되었습니다!", "booking_id": booking.id}


@router.get("/bookings")
def list_bookings(user_id: int = Depends(get_current_user), db: Session = Depends(get_db)):
    """예매 내역 조회"""
    bookings = get_user_bookings(db, user_id)
    return [
        {
            "id": b.id,
            "movie_title": b.schedule.movie.title,
            "theater_name": b.schedule.screen.theater.name,
            "screen_name": b.schedule.screen.name,
            "date": b.schedule.date,
            "start_time": b.schedule.start_time,
            "seats": b.seats.split(","),
            "total_amount": b.total_amount,
            "status": b.status
        } for b in bookings
    ]
