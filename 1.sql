-- users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL
);

-- classes table
CREATE TABLE classes (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    date DATE NOT NULL,
    capacity INT NOT NULL CHECK (capacity > 0)
);

-- attendance table
CREATE TABLE attendance (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    class_id INT NOT NULL,
    status VARCHAR(20) NOT NULL CHECK (status IN ('present','absent','late')),
    UNIQUE(user_id, class_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (class_id) REFERENCES classes(id)
);