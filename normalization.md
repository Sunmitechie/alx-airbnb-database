# 🔍 Database Normalization – Airbnb Clone

This document outlines the normalization process applied to the Airbnb Clone database to ensure that it meets the standards of **Third Normal Form (3NF)**.

---

## Step 1: First Normal Form (1NF)

### Rules:
- All attributes must contain **atomic (indivisible)** values.
- Each record must be **unique**.
- There should be **no repeating groups**.

### Applied:
- All fields like `amenities`, `payment_method`, etc., are modeled as **ENUMs or separate rows** — no lists or comma-separated strings.
- Primary keys (`user_id`, `property_id`, etc.) ensure record uniqueness.

**All tables are in 1NF.**

---

##  Step 2: Second Normal Form (2NF)

### Rules:
- Must be in 1NF.
- All **non-key attributes** must be **fully functionally dependent** on the **entire primary key**.

###  Applied:
- All tables have **single-column primary keys**, so partial dependency doesn’t apply.
- In composite scenarios (like a potential `property_amenities` join table), care is taken to separate out repeating relationships.

 **No partial dependencies exist → All tables are in 2NF.**

---

## Step 3: Third Normal Form (3NF)

### Rules:
- Must be in 2NF.
- No **transitive dependencies** (i.e., non-key attributes must not depend on other non-key attributes).

### 🛠 Verifications:

- **User Table**:
  - `role` is directly related to the user, not derived from any other field. ✅
  - `email` is unique and not derived from name or phone. ✅

- **Property Table**:
  - All fields describe the property directly (name, price, location). ✅
  - `host_id` (FK) is the only reference — no transitive dependencies. ✅

- **Booking Table**:
  - All attributes relate directly to the booking, not to the property or user details (those are fetched via FK). ✅

- **Payment Table**:
  - `amount`, `payment_method` → directly related to the payment, not indirectly through booking or user. ✅

- **Review Table**:
  - `rating`, `comment` → direct description of the review event between a user and a property. ✅

- **Message Table**:
  - `sender_id`, `recipient_id`, and `message_body` → describe a communication event. ✅

 **No transitive dependencies found → All tables are in 3NF.**

---

## Conclusion

All entities in the Airbnb Clone schema were reviewed and found to follow:
- **Atomicity of data**
- **No repeating groups**
- **Full functional dependency**
- **No transitive dependency**

The database design adheres to the principles of **Third Normal Form (3NF)** and is optimized for data integrity, minimal redundancy, and relational consistency.
