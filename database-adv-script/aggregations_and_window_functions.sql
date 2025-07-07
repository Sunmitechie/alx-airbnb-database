-- 1. Aggregation: Total number of bookings made by each user
SELECT user_id, COUNT(*) AS total_bookings
FROM bookings
GROUP BY user_id
ORDER BY total_bookings DESC;


-- 2a. Rank properties by total bookings using ROW_NUMBER()
SELECT property_id, COUNT(*) AS total_bookings,
       ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS row_num
FROM bookings
GROUP BY property_id
ORDER BY row_num;


-- 2b. Rank properties by total bookings using RANK()
SELECT property_id, COUNT(*) AS total_bookings,
       RANK() OVER (ORDER BY COUNT(*) DESC) AS rank
FROM bookings
GROUP BY property_id
ORDER BY rank;

