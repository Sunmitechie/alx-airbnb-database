-- Drop original table (only for testing!)
DROP TABLE IF EXISTS bookings;

-- Create bookings table with partitioning on start_date
CREATE TABLE bookings (
  id INT NOT NULL,
  user_id INT NOT NULL,
  property_id INT NOT NULL,
  payment_id INT,
  start_date DATE NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id, start_date)
)
PARTITION BY RANGE (YEAR(start_date)) (
  PARTITION p2022 VALUES LESS THAN (2023),
  PARTITION p2023 VALUES LESS THAN (2024),
  PARTITION p2024 VALUES LESS THAN (2025),
  PARTITION p2025 VALUES LESS THAN (2026),
  PARTITION pmax VALUES LESS THAN MAXVALUE
);

-- Sample EXPLAIN ANALYZE query before/after partitioning
EXPLAIN
SELECT * FROM bookings
WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';
