-- This script populates the Airbnb database with sample data.
-- It is designed to be run after the schema has been created.

-- -- Inserts sample data into the User table
-- Note: UUIDs are generated automatically by the database. We will use
-- subqueries to retrieve the IDs for foreign key relationships.
-- We create one host, one guest, and one admin.
INSERT INTO "User" (first_name, last_name, email, password_hash, role) VALUES
('Jane', 'Doe', 'jane.doe@example.com', 'hashed_password_host_123', 'host'),
('John', 'Smith', 'john.smith@example.com', 'hashed_password_guest_456', 'guest'),
('Admin', 'User', 'admin@example.com', 'hashed_password_admin_789', 'admin');

-- -- Inserts a sample property, linked to the host user
INSERT INTO "Property" (host_id, name, description, location, price_per_night) VALUES
((SELECT user_id FROM "User" WHERE email = 'jane.doe@example.com'), 'Cozy Lakeside Cabin', 'A small, cozy cabin with a beautiful view of the lake.', 'Lakeview, USA', 150.00);

-- -- Inserts a sample booking for the property, linked to the guest user
-- We create one confirmed and one pending booking.
INSERT INTO "Booking" (property_id, user_id, start_date, end_date, total_price, status) VALUES
((SELECT property_id FROM "Property" WHERE name = 'Cozy Lakeside Cabin'), (SELECT user_id FROM "User" WHERE email = 'john.smith@example.com'), '2025-10-15', '2025-10-20', 750.00, 'confirmed'),
((SELECT property_id FROM "Property" WHERE name = 'Cozy Lakeside Cabin'), (SELECT user_id FROM "User" WHERE email = 'john.smith@example.com'), '2025-11-05', '2025-11-08', 450.00, 'pending');

-- -- Inserts a sample payment, linked to the confirmed booking
INSERT INTO "Payment" (booking_id, amount, payment_method) VALUES
((SELECT booking_id FROM "Booking" WHERE status = 'confirmed' AND user_id = (SELECT user_id FROM "User" WHERE email = 'john.smith@example.com')), 750.00, 'stripe');

-- -- Inserts a sample review, linked to the property and guest user
INSERT INTO "Review" (property_id, user_id, rating, comment) VALUES
((SELECT property_id FROM "Property" WHERE name = 'Cozy Lakeside Cabin'), (SELECT user_id FROM "User" WHERE email = 'john.smith@example.com'), 5, 'Absolutely loved the place! The view was incredible and the cabin was very clean.');

-- -- Inserts sample messages between users
INSERT INTO "Message" (sender_id, recipient_id, message_body) VALUES
((SELECT user_id FROM "User" WHERE email = 'john.smith@example.com'), (SELECT user_id FROM "User" WHERE email = 'jane.doe@example.com'), 'Hi Jane, I am looking forward to my stay!'),
((SELECT user_id FROM "User" WHERE email = 'jane.doe@example.com'), (SELECT user_id FROM "User" WHERE email = 'john.smith@example.com'), 'You too, John! Let me know if you need anything.');