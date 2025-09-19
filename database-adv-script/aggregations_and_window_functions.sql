--Aggregation with COUNT + GROUP BY
SELECT u.user_id, u.user_name, COUNT(b.booking_id) AS total_bookings
FROM Users u
JOIN Bookings b ON u.user_id = b.user_id
GROUP BY u.user_id, u.user_name
ORDER BY total_bookings DESC;
-- COUNT(b.bookings_id) counts bookings for each user
-- GROUP BY ensures we get totals per user
-- Ordered do teh most active users appera first

--Rank properties based on total bookings(Window function)
SELECT p.property_id, p.propery_name, 
       COUNT(b.booking_id) AS total_bookings,
       RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM Properties p
LEFT JOIN Bookings b ON p.property_id = b.property_id
GROUP BY p.property_id, p.property_name
ORDER BY booking_rank;
 -- RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) assigns rank, handling ties
 -- LEFT JOIN ensures properties with no bookings are included
 --COUNT(b.booking_id) counts total bookings per property