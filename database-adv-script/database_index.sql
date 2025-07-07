-- Index on users.id (usually primary key, may already exist)
CREATE INDEX idx_users_id ON users(id);

-- Index on bookings.user_id
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Index on bookings.property_id
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Index on bookings.created_at
CREATE INDEX idx_bookings_created_at ON bookings(created_at);

-- Index on properties.id (usually primary key, but safe to include)
CREATE INDEX idx_properties_id ON properties(id);

-- Index on reviews.property_id
CREATE INDEX idx_reviews_property_id ON reviews(property_id);

-- Create indexes
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_created_at ON bookings(created_at);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_reviews_property_id ON reviews(property_id);
CREATE INDEX idx_users_id ON users(id);
CREATE INDEX idx_properties_id ON properties(id);

-- EXPLAIN ANALYZE query: Test performance before/after indexing
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE user_id = 1
ORDER BY created_at DESC;

