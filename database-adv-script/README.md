# Advanced SQL - Join Queries

## INNER JOIN
Query retrieves all bookings along with the corresponding users who made those bookings.

## LEFT JOIN
Query retrieves all properties and their reviews. Properties with no reviews are still shown with NULL values for the review columns.

## FULL OUTER JOIN
Query retrieves all users and all bookings, even if a user has no booking or a booking is not linked to any user. Since MySQL doesn't support FULL OUTER JOIN directly, a UNION of LEFT JOIN and RIGHT JOIN is used.
