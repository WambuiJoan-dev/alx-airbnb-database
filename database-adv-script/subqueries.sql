--this is a non-corelated subquery.A non-correlated subquery runs independently of the outer query. Inner query(SELECT property_id, property_name)  calculates the av rating for each property, outer query pulls all properties whos property_id is in that list
SELECT property_id, property_name
FROM properties
WHERE property_id IN (
    SELECT property_id
    FROM Ratings
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);

-- Correlated subquery-  depends on outer query for each row evaluation
SELECT user_id, user_name 
FROM Users u 
WHERE (SELECT COUNT(*) 
       FROM Orders o 
       WHERE o.user_id = u.user_id) > 3;    