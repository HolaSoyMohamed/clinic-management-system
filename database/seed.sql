-- ============================================================
--  clinic_db  —  Seed File
--  Run after schema is created:  SOURCE seed.sql;
-- ============================================================

USE clinic_db;

-- Disable FK checks for clean insertion order
SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE notifications;
TRUNCATE TABLE reviews;
TRUNCATE TABLE medical_records;
TRUNCATE TABLE appointments;
TRUNCATE TABLE doctor_schedules;
TRUNCATE TABLE doctor_profiles;
TRUNCATE TABLE users;
TRUNCATE TABLE specialties;

SET FOREIGN_KEY_CHECKS = 1;

-- ─────────────────────────────────────────────
--  1. SPECIALTIES
-- ─────────────────────────────────────────────
INSERT INTO specialties (id, name, description) VALUES
(1, 'General Practice',    'Primary care for common illnesses and preventive medicine.'),
(2, 'Cardiology',          'Diagnosis and treatment of heart and cardiovascular diseases.'),
(3, 'Dermatology',         'Skin, hair, and nail disorders.'),
(4, 'Pediatrics',          'Medical care for infants, children, and adolescents.'),
(5, 'Orthopedics',         'Musculoskeletal system: bones, joints, ligaments, and muscles.'),
(6, 'Neurology',           'Disorders of the brain, spinal cord, and nervous system.'),
(7, 'Psychiatry',          'Mental health disorders and behavioral conditions.');

-- ─────────────────────────────────────────────
--  2. USERS
--  Passwords are bcrypt hashes of "Password123!"
-- ─────────────────────────────────────────────
INSERT INTO users (id, name, email, password, role, phone_number, profile_image, created_at) VALUES

-- Admins
(1,  'Sara Admin',        'sara.admin@clinic.com',      '$2b$10$eImiTXuWVxfM37uY4JANjQ==.hashed', 'admin',   '+201000000001', 'default.png', '2024-01-01 08:00:00'),

-- Doctors
(2,  'Dr. Ahmed Nasser',  'ahmed.nasser@clinic.com',    '$2b$10$eImiTXuWVxfM37uY4JANjQ==.hashed', 'doctor',  '+201000000002', 'ahmed.png',   '2024-01-05 09:00:00'),
(3,  'Dr. Mona Khalil',   'mona.khalil@clinic.com',     '$2b$10$eImiTXuWVxfM37uY4JANjQ==.hashed', 'doctor',  '+201000000003', 'mona.png',    '2024-01-06 09:00:00'),
(4,  'Dr. Tarek Samir',   'tarek.samir@clinic.com',     '$2b$10$eImiTXuWVxfM37uY4JANjQ==.hashed', 'doctor',  '+201000000004', 'tarek.png',   '2024-01-07 09:00:00'),
(5,  'Dr. Layla Farouk',  'layla.farouk@clinic.com',    '$2b$10$eImiTXuWVxfM37uY4JANjQ==.hashed', 'doctor',  '+201000000005', 'layla.png',   '2024-01-08 09:00:00'),
(6,  'Dr. Omar Zaki',     'omar.zaki@clinic.com',       '$2b$10$eImiTXuWVxfM37uY4JANjQ==.hashed', 'doctor',  '+201000000006', 'omar.png',    '2024-01-09 09:00:00'),

-- Patients
(7,  'Youssef Hassan',    'youssef.hassan@gmail.com',   '$2b$10$eImiTXuWVxfM37uY4JANjQ==.hashed', 'patient', '+201111111001', 'default.png', '2024-02-01 10:00:00'),
(8,  'Nadia Mostafa',     'nadia.mostafa@gmail.com',    '$2b$10$eImiTXuWVxfM37uY4JANjQ==.hashed', 'patient', '+201111111002', 'default.png', '2024-02-03 10:00:00'),
(9,  'Kareem Adel',       'kareem.adel@gmail.com',      '$2b$10$eImiTXuWVxfM37uY4JANjQ==.hashed', 'patient', '+201111111003', 'default.png', '2024-02-05 10:00:00'),
(10, 'Hana Ibrahim',      'hana.ibrahim@gmail.com',     '$2b$10$eImiTXuWVxfM37uY4JANjQ==.hashed', 'patient', '+201111111004', 'default.png', '2024-02-07 10:00:00'),
(11, 'Sami Lotfy',        'sami.lotfy@gmail.com',       '$2b$10$eImiTXuWVxfM37uY4JANjQ==.hashed', 'patient', '+201111111005', 'default.png', '2024-02-09 10:00:00'),
(12, 'Rania Gamal',       'rania.gamal@gmail.com',      '$2b$10$eImiTXuWVxfM37uY4JANjQ==.hashed', 'patient', '+201111111006', 'default.png', '2024-02-11 10:00:00'),
(13, 'Mahmoud Fathy',     'mahmoud.fathy@gmail.com',    '$2b$10$eImiTXuWVxfM37uY4JANjQ==.hashed', 'patient', '+201111111007', 'default.png', '2024-02-13 10:00:00'),
(14, 'Dina Sherif',       'dina.sherif@gmail.com',      '$2b$10$eImiTXuWVxfM37uY4JANjQ==.hashed', 'patient', '+201111111008', 'default.png', '2024-02-15 10:00:00');

-- ─────────────────────────────────────────────
--  3. DOCTOR PROFILES
-- ─────────────────────────────────────────────
INSERT INTO doctor_profiles (id, user_id, specialty_id, bio, consultation_fee, slot_duration_mins) VALUES
(1, 2, 1, 'General practitioner with 10 years of experience in family medicine and preventive care.', 150.00, 20),
(2, 3, 2, 'Cardiologist specialising in interventional procedures and heart failure management.', 300.00, 30),
(3, 4, 3, 'Dermatologist focused on acne, eczema, and cosmetic dermatology.', 200.00, 20),
(4, 5, 4, 'Pediatrician with a gentle approach to child healthcare and developmental screening.', 180.00, 25),
(5, 6, 5, 'Orthopedic surgeon experienced in sports injuries and joint replacement.', 350.00, 30);

-- ─────────────────────────────────────────────
--  4. DOCTOR SCHEDULES
-- ─────────────────────────────────────────────
INSERT INTO doctor_schedules (doctor_profile_id, day_of_week, start_time, end_time) VALUES
-- Dr. Ahmed (GP) — Sun/Tue/Thu
(1, 'Sunday',    '09:00:00', '14:00:00'),
(1, 'Tuesday',   '09:00:00', '14:00:00'),
(1, 'Thursday',  '09:00:00', '13:00:00'),

-- Dr. Mona (Cardiology) — Mon/Wed
(2, 'Monday',    '10:00:00', '16:00:00'),
(2, 'Wednesday', '10:00:00', '16:00:00'),

-- Dr. Tarek (Dermatology) — Sun/Mon/Wed/Thu
(3, 'Sunday',    '12:00:00', '18:00:00'),
(3, 'Monday',    '12:00:00', '18:00:00'),
(3, 'Wednesday', '12:00:00', '18:00:00'),
(3, 'Thursday',  '12:00:00', '17:00:00'),

-- Dr. Layla (Pediatrics) — Tue/Thu/Sat
(4, 'Tuesday',   '08:00:00', '13:00:00'),
(4, 'Thursday',  '08:00:00', '13:00:00'),
(4, 'Saturday',  '09:00:00', '12:00:00'),

-- Dr. Omar (Orthopedics) — Mon/Wed/Sat
(5, 'Monday',    '14:00:00', '19:00:00'),
(5, 'Wednesday', '14:00:00', '19:00:00'),
(5, 'Saturday',  '10:00:00', '15:00:00');

-- ─────────────────────────────────────────────
--  5. APPOINTMENTS
--  Mix of statuses: pending, accepted, completed, canceled, rejected
-- ─────────────────────────────────────────────
INSERT INTO appointments (id, doctor_id, patient_id, appointment_date, appointment_time, duration_mins, status, notes, created_at) VALUES

-- Completed appointments (will have medical records + reviews)
(1,  1, 7,  '2024-03-10', '09:00:00', 20, 'completed', 'Routine checkup.',                             '2024-03-08 10:00:00'),
(2,  1, 8,  '2024-03-12', '09:20:00', 20, 'completed', 'Follow-up for hypertension.',                  '2024-03-09 11:00:00'),
(3,  2, 9,  '2024-03-11', '10:00:00', 30, 'completed', 'Chest pain evaluation.',                       '2024-03-08 12:00:00'),
(4,  2, 10, '2024-03-13', '10:30:00', 30, 'completed', 'Annual cardiac screening.',                     '2024-03-10 09:00:00'),
(5,  3, 11, '2024-03-14', '12:00:00', 20, 'completed', 'Acne treatment consultation.',                  '2024-03-11 08:00:00'),
(6,  4, 12, '2024-03-15', '08:00:00', 25, 'completed', 'Child vaccination and growth check.',           '2024-03-12 07:30:00'),
(7,  5, 13, '2024-03-18', '14:00:00', 30, 'completed', 'Knee pain from sports injury.',                '2024-03-15 10:00:00'),

-- Accepted (upcoming)
(8,  1, 9,  '2024-04-20', '09:00:00', 20, 'accepted',  'General wellness visit.',                      '2024-04-15 08:00:00'),
(9,  2, 7,  '2024-04-22', '10:00:00', 30, 'accepted',  'Palpitations review.',                         '2024-04-16 09:00:00'),
(10, 3, 14, '2024-04-23', '12:00:00', 20, 'accepted',  'Skin rash evaluation.',                        '2024-04-17 10:00:00'),
(11, 4, 7,  '2024-04-25', '08:00:00', 25, 'accepted',  'Child brought by guardian for fever follow-up.','2024-04-18 11:00:00'),

-- Pending
(12, 1, 10, '2024-04-28', '09:40:00', 20, 'pending',   'Fatigue and headaches.',                       '2024-04-20 10:00:00'),
(13, 5, 8,  '2024-04-29', '14:00:00', 30, 'pending',   'Shoulder pain after gym accident.',            '2024-04-21 11:00:00'),

-- Canceled
(14, 3, 9,  '2024-03-20', '12:20:00', 20, 'canceled',  'Patient canceled due to travel.',              '2024-03-17 09:00:00'),

-- Rejected
(15, 2, 11, '2024-03-25', '11:00:00', 30, 'rejected',  'Outside doctor\'s availability window.',       '2024-03-22 14:00:00');

-- ─────────────────────────────────────────────
--  6. MEDICAL RECORDS  (completed appointments only)
-- ─────────────────────────────────────────────
INSERT INTO medical_records (appointment_id, doctor_id, diagnosis, treatment_plan, prescription, created_at) VALUES
(1, 2, 'Patient in good health. Slightly elevated BMI.',
        'Dietary changes and 30 min daily exercise.',
        'None.',
        '2024-03-10 09:25:00'),

(2, 2, 'Stage 1 hypertension confirmed.',
        'Low-sodium diet, reduce stress, monthly BP monitoring.',
        'Amlodipine 5mg once daily.',
        '2024-03-12 09:45:00'),

(3, 3, 'Non-cardiac chest pain, likely musculoskeletal.',
        'Rest, anti-inflammatory medication for 5 days, follow up if pain persists.',
        'Ibuprofen 400mg three times daily after meals.',
        '2024-03-11 10:35:00'),

(4, 3, 'Mild mitral valve regurgitation detected on echo.',
        'Annual echocardiogram follow-up, moderate aerobic exercise only.',
        'None at this stage.',
        '2024-03-13 11:05:00'),

(5, 4, 'Moderate comedonal acne on forehead and chin.',
        'Topical retinoid therapy for 3 months, gentle cleanser twice daily.',
        'Tretinoin 0.025% cream, apply at night. Clindamycin gel 1%, apply in morning.',
        '2024-03-14 12:25:00'),

(6, 5, 'Child is on track developmentally. Up to date on vaccinations.',
        'Continue balanced diet and outdoor play. Next checkup in 6 months.',
        'Vitamin D drops 400 IU daily.',
        '2024-03-15 08:30:00'),

(7, 6, 'Grade II medial collateral ligament sprain, right knee.',
        'RICE protocol for 2 weeks, physiotherapy sessions twice weekly for 4 weeks.',
        'Diclofenac gel 1% applied to the knee twice daily. Naproxen 500mg as needed for pain.',
        '2024-03-18 14:35:00');

-- ─────────────────────────────────────────────
--  7. REVIEWS  (one per completed appointment)
-- ─────────────────────────────────────────────
INSERT INTO reviews (doctor_id, patient_id, appointment_id, rating, comment, created_at) VALUES
(1, 7,  1, 5, 'Dr. Ahmed was thorough and very easy to talk to. Highly recommend.',          '2024-03-11 10:00:00'),
(1, 8,  2, 4, 'Good follow-up, explained everything clearly. Waiting area was a bit crowded.','2024-03-13 09:00:00'),
(2, 9,  3, 5, 'Dr. Mona was reassuring and professional. Relieved it was not serious.',      '2024-03-12 11:00:00'),
(2, 10, 4, 4, 'Very knowledgeable. The appointment felt a little rushed.',                    '2024-03-14 10:00:00'),
(3, 11, 5, 5, 'Dr. Tarek listened carefully and gave a clear treatment plan.',               '2024-03-15 09:00:00'),
(4, 12, 6, 5, 'Wonderful with children. My daughter loved the visit!',                        '2024-03-16 08:00:00'),
(5, 13, 7, 4, 'Great diagnosis. Physio program is working well already.',                    '2024-03-20 10:00:00');

-- ─────────────────────────────────────────────
--  8. NOTIFICATIONS
-- ─────────────────────────────────────────────
INSERT INTO notifications (user_id, title, message, type, is_read, created_at) VALUES
-- Patient notifications
(7,  'Appointment Confirmed',    'Your appointment with Dr. Ahmed on Apr 22 at 10:00 is confirmed.', 'appointment', TRUE,  '2024-04-16 09:05:00'),
(7,  'Appointment Reminder',     'Reminder: You have an appointment tomorrow at 10:00 AM.',          'reminder',    FALSE, '2024-04-21 08:00:00'),
(8,  'Appointment Pending',      'Your request with Dr. Omar on Apr 29 is awaiting confirmation.',   'appointment', FALSE, '2024-04-21 11:05:00'),
(9,  'Appointment Confirmed',    'Your appointment with Dr. Ahmed on Apr 20 at 09:00 is confirmed.', 'appointment', TRUE,  '2024-04-15 08:10:00'),
(9,  'Appointment Canceled',     'Your appointment with Dr. Tarek on Mar 20 has been canceled.',     'appointment', TRUE,  '2024-03-17 09:10:00'),
(10, 'Appointment Confirmed',    'Your appointment with Dr. Tarek on Apr 23 at 12:00 is confirmed.', 'appointment', FALSE, '2024-04-17 10:05:00'),
(11, 'Appointment Rejected',     'Unfortunately your request with Dr. Mona could not be accepted.',  'appointment', TRUE,  '2024-03-22 14:10:00'),
(12, 'Review Request',           'How was your visit with Dr. Layla? Leave a review.',               'review',      TRUE,  '2024-03-16 09:00:00'),
(13, 'Review Request',           'Please share your feedback on your visit with Dr. Omar.',          'review',      FALSE, '2024-03-19 10:00:00'),
(14, 'Appointment Confirmed',    'Your appointment with Dr. Tarek on Apr 23 is now confirmed.',      'appointment', FALSE, '2024-04-17 10:06:00'),

-- Doctor notifications
(2,  'New Appointment Request',  'Nadia Mostafa has booked an appointment for Apr 28 at 09:40.',     'appointment', FALSE, '2024-04-20 10:05:00'),
(3,  'New Appointment Request',  'Dina Sherif has requested an appointment on Apr 23 at 12:00.',     'appointment', TRUE,  '2024-04-17 10:02:00'),
(5,  'New Appointment Request',  'Sami Lotfy has requested an appointment on Apr 29 at 14:00.',      'appointment', FALSE, '2024-04-21 11:02:00'),

-- System notifications
(1,  'New Doctor Registered',    'Dr. Omar Zaki has been added to the platform.',                    'system',      TRUE,  '2024-01-09 09:15:00'),
(1,  'Weekly Report Ready',      'The weekly appointments summary for Mar 10–17 is ready.',          'system',      FALSE, '2024-03-18 07:00:00');

-- ─────────────────────────────────────────────
--  Done!
-- ─────────────────────────────────────────────
SELECT 'Seed complete!' AS status;
SELECT 'specialties'    AS tbl, COUNT(*) AS rows FROM specialties    UNION ALL
SELECT 'users',                 COUNT(*)          FROM users          UNION ALL
SELECT 'doctor_profiles',       COUNT(*)          FROM doctor_profiles UNION ALL
SELECT 'doctor_schedules',      COUNT(*)          FROM doctor_schedules UNION ALL
SELECT 'appointments',          COUNT(*)          FROM appointments   UNION ALL
SELECT 'medical_records',       COUNT(*)          FROM medical_records UNION ALL
SELECT 'reviews',               COUNT(*)          FROM reviews        UNION ALL
SELECT 'notifications',         COUNT(*)          FROM notifications;
