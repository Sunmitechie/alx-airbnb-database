# Database Performance Monitoring and Refinement

## Tools Used
- `EXPLAIN ANALYZE`: Shows how SQL queries are executed and whether indexes are used.
- `SHOW PROFILE`: Used to measure where time is spent during query execution. (Optional)

---

## Query 1: Retrieve All Bookings by a User (Slow Join)

```sql
EXPLAIN ANALYZE
SELECT * FROM bookings
JOIN users ON bookings.user_id = users.id
WHERE users.email = 'sunmi@example.com';
