-- Optimized query selecting only needed columns
SELECT
  bookings.id AS booking_id,
  users.name AS user_name,
  properties.name AS property_name,
  payments.amount AS payment_amount,
  bookings.created_at
FROM bookings
JOIN users ON bookings.user_id = users.id
JOIN properties ON bookings.property_id = properties.id
JOIN payments ON bookings.payment_id = payments.id;

-- Analyze the performance of the optimized query
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
JOIN payments ON bookings.payment_id = payments.id;
