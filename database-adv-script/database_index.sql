-- Users Table
CREATE INDEX idx_users_user_name ON Users(user_name);

-- Bookings Table
CREATE INDEX idx_bookings_user_id ON Bookings(user_id);
CREATE INDEX idx_bookings_property_id ON Bookings(property_id);
CREATE INDEX idx_bookings_booking_date ON Bookings(booking_date);

-- Properties Table
CREATE INDEX idx_properties_property_name ON Properties(property_name);
---Note: Primary keys (user_id, booking_id, property_id) already have indexes by default

--Measuring performance with execution plan (SQL Server syntax)
-- before creating indexes;

SET STATISTICS PROFILE ON;
SELECT u.user_name, COUNT(b.booking_id)
FROM Users u
JOIN Bookings b ON u.user_id = b.user_id
GROUP BY u.user_name;
SET STATISTICS PROFILE OFF;

-- after creating indexes;

SET STATISTICS PROFILE ON;
SELECT u.user_name, COUNT(b.booking_id)
FROM Users u
JOIN Bookings b ON u.user_id = b.user_id
GROUP BY u.user_name;
SET STATISTICS PROFILE OFF;