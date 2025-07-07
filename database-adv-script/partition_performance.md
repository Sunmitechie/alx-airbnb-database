# Partitioning Performance Report

## Why Partition?

The `bookings` table is assumed to be very large. By partitioning it by `start_date` (using YEAR), we reduce the number of rows scanned in queries involving date ranges.

---

## Implementation

```sql
PARTITION BY RANGE (YEAR(start_date)) (
  PARTITION p2022 VALUES LESS THAN (2023),
  PARTITION p2023 VALUES LESS THAN (2024),
  PARTITION p2024 VALUES LESS THAN (2025),
  PARTITION p2025 VALUES LESS THAN (2026),
  PARTITION pmax VALUES LESS THAN MAXVALUE
);
