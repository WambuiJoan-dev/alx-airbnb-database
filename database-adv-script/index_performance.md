These columns appear frequently in WHERE, JOIN, and ORDER BY clauses:

** Users table

user_id (used in joins with Bookings)

user_name (sometimes in search or filters)

** Bookings table

booking_id (primary key, already indexed by default)

user_id (foreign key, used in joins)

property_id (foreign key, used in joins)

booking_date (likely used in filters or sorting)

** Properties table

property_id (primary key, already indexed by default)

property_name (used in search)