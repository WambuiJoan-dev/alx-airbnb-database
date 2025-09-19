SELECT 
    bookings.id AS booking_id,
    users.username,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date
FROM bookings
INNER JOIN users ON bookings.user_id = users.id;

-- This query retrieves all bookings along with the username of the user who made each booking.it ensures only bookings witha a valid user are returned, else it wont appear

SELECT
    properties.id AS property_id,
    properties.title,
    reviews.rating,
    reviews.comment 
FROM properties
LEFT JOIN reviews ON properties.id = reviews.property_id;
-- This query retrieves all properties along with their reviews, if any. Properties without reviews will still be included in the result set. with NULL in rating/comment.

SELECT 
    users.id AS user_id,
    users.username,
    bookings.id AS booking_id,
    bookings.start_date,
    bookings.end_date
FROM users
FULL OUTER JOIN bookings ON users.id = bookings.user_id;
 -- FULL OUTER JOIN combines both directions. Users without bookings will still appear, bookings without a valid user will also appear.
