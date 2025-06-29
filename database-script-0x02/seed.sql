-- Airbnb Clone Sample Data Seed Script
-- File: seed.sql

-- Insert sample users
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  (uuid_generate_v4(), 'Daniel', 'Ojo', 'daniel@example.com', 'hashed_pass_1', '08012345678', 'host'),
  (uuid_generate_v4(), 'Sunmibare', 'Idowu', 'sunmi@example.com', 'hashed_pass_2', '08023456789', 'guest'),
  (uuid_generate_v4(), 'Adesewa', 'Kola', 'sewa@example.com', 'hashed_pass_3', '08034567890', 'guest');

-- Insert properties
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight)
SELECT uuid_generate_v4(), u.user_id, 'Cozy Studio in Lekki', 'A peaceful studio apartment with fast WiFi.', 'Lekki, Lagos', 35000.00
FROM users u WHERE u.email = 'daniel@example.com'
UNION
SELECT uuid_generate_v4(), u.user_id, 'Ocean View Room', 'Room with balcony facing the sea.', 'Victoria Island', 45000.00
FROM users u WHERE u.email = 'daniel@example.com';

-- Insert bookings
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
SELECT uuid_generate_v4(), p.property_id, u.user_id, '2025-07-05', '2025-07-10', 175000.00, 'confirmed'
FROM properties p, users u
WHERE p.name = 'Cozy Studio in Lekki' AND u.email = 'sunmi@example.com'
UNION
SELECT uuid_generate_v4(), p.property_id, u.user_id, '2025-08-01', '2025-08-04', 135000.00, 'pending'
FROM properties p, users u
WHERE p.name = 'Ocean View Room' AND u.email = 'sewa@example.com';

-- Insert payments
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
SELECT uuid_generate_v4(), b.booking_id, b.total_price, 'credit_card'
FROM bookings b
WHERE b.status = 'confirmed';

-- Insert reviews
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
SELECT uuid_generate_v4(), p.property_id, u.user_id, 5, 'Great space, very quiet and clean!'
FROM properties p, users u
WHERE p.name = 'Cozy Studio in Lekki' AND u.email = 'sunmi@example.com';

-- Insert messages
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
SELECT uuid_generate_v4(), sender.user_id, recipient.user_id, 'Hi Daniel, I just booked your property. Can you confirm check-in time?'
FROM users sender, users recipient
WHERE sender.email = 'sunmi@example.com' AND recipient.email = 'daniel@example.com';
