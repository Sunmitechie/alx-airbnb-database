# Optimization Report

## Initial Query
The original query retrieved all columns using `SELECT *` and joined 4 tables: `bookings`, `users`, `properties`, and `payments`.

```sql
SELECT *
FROM bookings
JOIN users ON bookings.user_id = users.id
JOIN properties ON bookings.property_id = properties.id
JOIN payments ON bookings.payment_id = payments.id;
