# Airbnb Clone – Database Schema

This directory contains the SQL DDL script (`schema.sql`) that defines the relational database schema for the backend of the Airbnb Clone project.

## Tables Defined

- `users`: Stores all platform users (guests, hosts, admins).
- `properties`: Listings created by hosts.
- `bookings`: Reservations made by guests for properties.
- `payments`: Linked to bookings for handling payment transactions.
- `reviews`: Feedback from users on properties.
- `messages`: Internal messaging between users.

## Features

- All entities use UUID primary keys.
- Proper indexing on frequently queried columns.
- Enforced referential integrity via foreign keys.
- ENUM-like constraints using `CHECK`.

## How to Use

To create the database schema:
```sql
-- In your SQL console:
\i schema.sql
