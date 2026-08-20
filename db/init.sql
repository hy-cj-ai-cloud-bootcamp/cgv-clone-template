-- CGV 클론 데이터베이스 스키마

CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    hashed_password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS movies (
    id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    genre VARCHAR(100),
    synopsis TEXT,
    director VARCHAR(100),
    "cast" TEXT,
    duration INTEGER,
    rating VARCHAR(20),
    poster_url VARCHAR(500),
    release_date VARCHAR(20),
    status VARCHAR(20) DEFAULT 'showing',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS theaters (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(200)
);

CREATE TABLE IF NOT EXISTS screens (
    id SERIAL PRIMARY KEY,
    theater_id INTEGER REFERENCES theaters(id),
    name VARCHAR(50) NOT NULL,
    total_seats INTEGER DEFAULT 80
);

CREATE TABLE IF NOT EXISTS schedules (
    id SERIAL PRIMARY KEY,
    movie_id INTEGER REFERENCES movies(id),
    screen_id INTEGER REFERENCES screens(id),
    date VARCHAR(20) NOT NULL,
    start_time VARCHAR(10) NOT NULL,
    end_time VARCHAR(10) NOT NULL
);

CREATE TABLE IF NOT EXISTS bookings (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    schedule_id INTEGER REFERENCES schedules(id),
    seats TEXT NOT NULL,
    total_amount INTEGER NOT NULL,
    status VARCHAR(20) DEFAULT '예매완료',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_movies_status ON movies(status);
CREATE INDEX IF NOT EXISTS idx_schedules_date ON schedules(date);
CREATE INDEX IF NOT EXISTS idx_bookings_user ON bookings(user_id);
