"""CRUD 함수 - CGV 클론"""
from sqlalchemy.orm import Session
import bcrypt
from models import User, Movie, Theater, Screen, Schedule, Booking



# ===== 사용자 =====
def get_user_by_email(db: Session, email: str):
    return db.query(User).filter(User.email == email).first()

def get_user_by_username(db: Session, username: str):
    return db.query(User).filter(User.username == username).first()

def create_user(db: Session, username: str, email: str, password: str):
    user = User(username=username, email=email, hashed_password=bcrypt.hashpw(password.encode("utf-8"), bcrypt.gensalt()).decode("utf-8"))
    db.add(user)
    db.commit()
    db.refresh(user)
    return user

def verify_password(plain: str, hashed: str) -> bool:
    return bcrypt.checkpw(plain.encode("utf-8"), hashed.encode("utf-8"))


# ===== 영화 =====
def get_movies(db: Session, status: str = None):
    query = db.query(Movie)
    if status:
        query = query.filter(Movie.status == status)
    return query.all()

def get_movie(db: Session, movie_id: int):
    return db.query(Movie).filter(Movie.id == movie_id).first()


# ===== 스케줄 =====
def get_schedules(db: Session, date: str = None, movie_id: int = None):
    query = db.query(Schedule)
    if date:
        query = query.filter(Schedule.date == date)
    if movie_id:
        query = query.filter(Schedule.movie_id == movie_id)
    return query.all()

def get_schedule(db: Session, schedule_id: int):
    return db.query(Schedule).filter(Schedule.id == schedule_id).first()


# ===== 예매 =====
def get_taken_seats(db: Session, schedule_id: int):
    """해당 스케줄의 이미 예매된 좌석 목록"""
    bookings = db.query(Booking).filter(
        Booking.schedule_id == schedule_id,
        Booking.status == "예매완료"
    ).all()
    taken = []
    for b in bookings:
        taken.extend(b.seats.split(","))
    return taken

def create_booking(db: Session, user_id: int, schedule_id: int, seats: list):
    """예매 생성"""
    total_amount = len(seats) * 14000  # 1석당 14,000원
    booking = Booking(
        user_id=user_id,
        schedule_id=schedule_id,
        seats=",".join(seats),
        total_amount=total_amount
    )
    db.add(booking)
    db.commit()
    db.refresh(booking)
    return booking

def get_user_bookings(db: Session, user_id: int):
    return db.query(Booking).filter(Booking.user_id == user_id).order_by(Booking.created_at.desc()).all()


# ===== 챗봇용 =====
def get_all_movies_for_chat(db: Session):
    return db.query(Movie).all()

def get_all_schedules_for_chat(db: Session):
    return db.query(Schedule).all()
