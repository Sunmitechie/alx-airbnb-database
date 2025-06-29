# Airbnb Clone – Entity Relationship Diagram

This document defines the entities, attributes, and relationships for the Airbnb Clone database.

---

## Entities

**User**
- `user_id` (PK)
- `first_name`, `last_name`, `email (UNIQUE)`
- `password_hash`, `phone_number`
- `role`: ENUM (guest, host, admin)
- `created_at`

**Property**
- `property_id` (PK)
- `host_id`: FK to `User(user_id)`
- `name`, `description`, `location`
- `pricepernight`, `created_at`, `updated_at`

**Booking**
- `booking_id` (PK)
- `property_id`: FK to `Property(property_id)`
- `user_id`: FK to `User(user_id)`
- `start_date`, `end_date`, `total_price`
- `status`: ENUM (pending, confirmed, canceled)
- `created_at`

**Payment**
- `payment_id` (PK)
- `booking_id`: FK to `Booking(booking_id)`
- `amount`, `payment_date`, `payment_method`

**Review**
- `review_id` (PK)
- `property_id`: FK to `Property(property_id)`
- `user_id`: FK to `User(user_id)`
- `rating`: Integer (1-5), `comment`, `created_at`

**Message**
- `message_id` (PK)
- `sender_id`: FK to `User(user_id)`
- `recipient_id`: FK to `User(user_id)`
- `message_body`, `sent_at`

---

## 🔗 Relationships

- **User - Property**: One user (host) → many properties
- **User - Booking**: One user (guest) → many bookings
- **Property - Booking**: One property → many bookings
- **Booking - Payment**: One booking → one payment
- **User - Review**: One user → many reviews
- **Property - Review**: One property → many reviews
- **User - Message**: Users can message each other (sender → recipient)

---

*See the ER Diagram in erd.png for full visual representation.*
