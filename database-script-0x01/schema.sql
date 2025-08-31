-- Create a new schema to logically group the Airbnb tables
-- CREATE SCHEMA IF NOT EXISTS airbnb;

-- Set the search path to the new schema
-- SET search_path TO airbnb;

-- Use the UUID extension for generating universally unique identifiers
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- -- Table structure for User
CREATE TABLE "User" (
user_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
first_name VARCHAR(255) NOT NULL,
last_name VARCHAR(255) NOT NULL,
email VARCHAR(255) UNIQUE NOT NULL,
password_hash VARCHAR(255) NOT NULL,
phone_number VARCHAR(50),
role ENUM('guest', 'host', 'admin') NOT NULL,
created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Index for the email column for faster lookups
CREATE INDEX idx_user_email ON "User"(email);

-- -- Table structure for Property
CREATE TABLE "Property" (
property_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
host_id UUID NOT NULL REFERENCES "User"(user_id) ON DELETE CASCADE,
name VARCHAR(255) NOT NULL,
description TEXT NOT NULL,
location VARCHAR(255) NOT NULL,
price_per_night DECIMAL(10, 2) NOT NULL,
created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Index for the host_id foreign key
CREATE INDEX idx_property_host_id ON "Property"(host_id);

-- -- Table structure for Booking
CREATE TABLE "Booking" (
booking_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
property_id UUID NOT NULL REFERENCES "Property"(property_id) ON DELETE CASCADE,
user_id UUID NOT NULL REFERENCES "User"(user_id) ON DELETE CASCADE,
start_date DATE NOT NULL,
end_date DATE NOT NULL,
total_price DECIMAL(10, 2) NOT NULL,
status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT chk_end_date_after_start_date CHECK (end_date > start_date)
);

-- Indexes for foreign keys
CREATE INDEX idx_booking_property_id ON "Booking"(property_id);
CREATE INDEX idx_booking_user_id ON "Booking"(user_id);

-- -- Table structure for Payment
CREATE TABLE "Payment" (
payment_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
booking_id UUID UNIQUE NOT NULL REFERENCES "Booking"(booking_id) ON DELETE CASCADE,
amount DECIMAL(10, 2) NOT NULL,
payment_date TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL
);

-- Index for the booking_id foreign key
CREATE INDEX idx_payment_booking_id ON "Payment"(booking_id);

-- -- Table structure for Review
CREATE TABLE "Review" (
review_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
property_id UUID NOT NULL REFERENCES "Property"(property_id) ON DELETE CASCADE,
user_id UUID NOT NULL REFERENCES "User"(user_id) ON DELETE CASCADE,
rating INTEGER NOT NULL,
comment TEXT,
created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT chk_rating_range CHECK (rating >= 1 AND rating <= 5)
);

-- Indexes for foreign keys
CREATE INDEX idx_review_property_id ON "Review"(property_id);
CREATE INDEX idx_review_user_id ON "Review"(user_id);

-- -- Table structure for Message
CREATE TABLE "Message" (
message_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
sender_id UUID NOT NULL REFERENCES "User"(user_id) ON DELETE CASCADE,
recipient_id UUID NOT NULL REFERENCES "User"(user_id) ON DELETE CASCADE,
message_body TEXT NOT NULL,
sent_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Indexes for foreign keys
CREATE INDEX idx_message_sender_id ON "Message"(sender_id);
CREATE INDEX idx_message_recipient_id ON "Message"(recipient_id);