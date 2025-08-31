Airbnb Clone Database Schema
This repository contains the SQL schema for the backend of an Airbnb clone application. The schema is designed to be robust, scalable, and secure, defining the core entities, their attributes, and the relationships between them.

Overview
The database is structured to support the main functionalities of the application, including user management, property listings, bookings, payments, and reviews. The design follows normalization principles (specifically, it is in Third Normal Form) to minimize data redundancy and ensure data integrity.

Key Features
UUID Primary Keys: All primary keys use UUIDs to ensure global uniqueness and facilitate scaling in a distributed environment.

Referential Integrity: Foreign keys are established between tables to enforce relationships and prevent orphaned records.

Data Validation: ENUM types and CHECK constraints are used to restrict values and maintain data quality.

Performance Optimization: Indexes are defined on frequently queried columns to improve lookup and join performance.

Table Specifications
The schema consists of the following tables, with detailed descriptions of their purpose and key attributes.

1. User
Manages user accounts, including both guests and hosts.

user_id (PK, UUID): Unique identifier for the user.

email (UNIQUE): The user's email address, used for login and notifications.

role (ENUM): Specifies the user's role (guest, host, admin).

2. Property
Stores information about properties available for booking.

property_id (PK, UUID): Unique identifier for the property.

host_id (FK): Links the property to the hosting user.

name, description: Details about the property.

price_per_night: The cost to book the property for one night.

3. Booking
Records reservations made by users for properties.

booking_id (PK, UUID): Unique identifier for the booking.

property_id (FK): The property being booked.

user_id (FK): The user making the booking.

status (ENUM): The current state of the booking (pending, confirmed, canceled).

4. Payment
Tracks payment records for each booking.

payment_id (PK, UUID): Unique identifier for the payment.

booking_id (UNIQUE FK): Links the payment to a specific booking, ensuring a one-to-one relationship.

amount: The total price of the payment.

5. Review
Stores user ratings and comments for properties.

review_id (PK, UUID): Unique identifier for the review.

property_id (FK): The property being reviewed.

user_id (FK): The user who wrote the review.

rating (CHECK): An integer rating from 1 to 5.

6. Message
Handles direct messages between users.

message_id (PK, UUID): Unique identifier for the message.

sender_id (FK), recipient_id (FK): Links the message to the sending and receiving users.

Relationships
The schema defines the following key relationships:

User ↔ Property: A host user has many properties.

User ↔ Booking: A guest user has many bookings.

Property ↔ Booking: A property can be booked many times.

Booking ↔ Payment: A booking has exactly one payment.

Property ↔ Review: A property can have many reviews.

User ↔ Review: A user can write many reviews.

User ↔ Message: A user can send and receive many messages.

SQL Queries
The schema.sql file contains a series of CREATE TABLE statements. These statements are designed to be executed sequentially to set up the database. The script also includes CREATE INDEX commands to ensure database operations are fast and efficient.