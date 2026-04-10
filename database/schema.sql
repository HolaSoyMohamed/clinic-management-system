CREATE DATABASE IF NOT EXISTS clinic_db;
USE clinic_db;

CREATE TABLE specialties (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('doctor', 'patient', 'admin') NOT NULL,
    phone_number VARCHAR(20) UNIQUE,
    profile_image VARCHAR(255) DEFAULT 'default.png',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE doctor_profiles (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL UNIQUE,
    specialty_id INT,
    bio TEXT,
    consultation_fee DECIMAL(10, 2),
    slot_duration_mins INT DEFAULT 30, 
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (specialty_id) REFERENCES specialties(id) ON DELETE SET NULL
);

CREATE TABLE doctor_schedules (
    id INT PRIMARY KEY AUTO_INCREMENT,
    doctor_profile_id INT NOT NULL, 
    day_of_week ENUM('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday') NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    FOREIGN KEY (doctor_profile_id) REFERENCES doctor_profiles(id) ON DELETE CASCADE
);

CREATE TABLE appointments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    doctor_id INT NOT NULL,
    patient_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    duration_mins INT DEFAULT 30, 
    status ENUM('pending','accepted','rejected','completed','canceled') DEFAULT 'pending',
    notes TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (doctor_id) REFERENCES doctor_profiles(id),
    FOREIGN KEY (patient_id) REFERENCES users(id)
);

CREATE TABLE medical_records (
    id INT PRIMARY KEY AUTO_INCREMENT,
    appointment_id INT NOT NULL UNIQUE,
    doctor_id INT NOT NULL, 
    diagnosis TEXT NOT NULL,
    treatment_plan TEXT,
    prescription TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (appointment_id) REFERENCES appointments(id) ON DELETE CASCADE,
    FOREIGN KEY (doctor_id) REFERENCES users(id)
);

CREATE TABLE reviews (
    id INT PRIMARY KEY AUTO_INCREMENT,
    doctor_id INT NOT NULL,
    patient_id INT NOT NULL,
    appointment_id INT NOT NULL UNIQUE, 
    rating TINYINT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (doctor_id) REFERENCES doctor_profiles(id),
    FOREIGN KEY (patient_id) REFERENCES users(id),
    FOREIGN KEY (appointment_id) REFERENCES appointments(id) ON DELETE CASCADE
);

CREATE TABLE notifications (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    message TEXT NOT NULL,
    type ENUM('appointment','reminder','system','review') DEFAULT 'system', 
    is_read BOOLEAN DEFAULT FALSE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);
