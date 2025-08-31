Sample Data Seeding Script
This script (seed.sql) is designed to populate the Airbnb database with sample data. Its primary purpose is to provide a functional dataset for development and testing, allowing developers to interact with the application and verify that the database schema and relationships are working as intended.

How it Works
The script contains a series of INSERT statements that add records to the User, Property, Booking, Payment, Review, and Message tables. It leverages SELECT subqueries to dynamically retrieve UUID primary keys, ensuring that all foreign key relationships are correctly established without needing to manually hardcode UUIDs.

Data Inserted
1. User
A host user (jane.doe@example.com)

A guest user (john.smith@example.com)

An admin user (admin@example.com)

2. Property
One property record, "Cozy Lakeside Cabin," is inserted and is linked to the host user.

3. Booking
Two bookings are created for the "Cozy Lakeside Cabin."

The first booking is confirmed, made by the guest user.

The second booking is pending, also made by the guest user.

4. Payment
A single payment record is inserted and linked to the confirmed booking.

5. Review
A 5-star review is added for the "Cozy Lakeside Cabin," written by the guest user.

6. Message
Two message records are inserted, representing a conversation between the guest and host users.

This script provides a clean and easy way to set up a small, realistic dataset for local testing and debugging purposes.