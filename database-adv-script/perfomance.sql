-- Initial complex query with WHERE and AND (unoptimized)
SELECT *
FROM bookings
JOIN users ON bookings.user_id = users.id
JOIN properties ON bookings.property_id = properties.id
JOIN payments ON bookings.payment_id = payments.id
WHERE users.country = 'Nigeria' AND bookings.created_at >= '2024-01-01';

-- EXPLAIN analysis for unoptimized query
EXPLAIN
SELECT *
FROM bookings
JOIN users ON bookings.user_id = users.id
JOIN properties ON bookings.property_id = properties.id
JOIN payments ON bookings.payment_id = payments.id
WHERE users.country = 'Nigeria' AND bookings.created_at >= '2024-01-01';


-- Optimized version: select specific columns
SELECT
  bookings.id AS booking_id,
  users.name AS user_name,
  properties.name AS property_name,
  payments.amount AS payment_amount,
  bookings.created_at
FROM bookings
JOIN users ON bookings.user_id = users.id
JOIN properties ON bookings.property_id = properties.id
JOIN payments ON bookings.payment_id = payments.id
WHERE users.country = 'Nigeria' AND bookings.created_at >= '2024-01-01';

-- EXPLAIN analysis for optimized query
EXPLAIN
SELECT
  bookings.id AS booking_id,
  users.name AS user_name,
  properties.name AS property_name,
  payments.amount AS payment_amount,
  bookings.created_at
FROM bookings
JOIN users ON bookings.user_id = users.id
JOIN properties ON bookings.property_id = properties.id
JOIN payments ON bookings.payment_id = payments.id
WHERE users.country = 'Nigeria' AND bookings.created_at >= '2024-01-01';



