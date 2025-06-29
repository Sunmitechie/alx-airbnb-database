# Airbnb Clone – Sample Data Seeder

This script populates the database with sample data for testing and development.

## Entities Seeded

- `users`: Sample host and guest accounts
- `properties`: Listings created by a host
- `bookings`: Guest bookings for properties
- `payments`: Linked to bookings
- `reviews`: Left by guests
- `messages`: Between users

## Usage

Run the script after the schema is created:

```sql
\i schema.sql
\i seed.sql
