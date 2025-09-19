SELECT 
    bookings.id AS booking_id,
    users.username,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date
FROM bookings
INNER JOIN users ON bookings.user_id = users.id;