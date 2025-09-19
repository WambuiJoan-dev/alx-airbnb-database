Step 2: Analyze Performance

In SQL Server, you can analyze with:

SET STATISTICS PROFILE ON;
-- run the query
SET STATISTICS PROFILE OFF;


Or visually in SSMS:

Go to Query → Include Actual Execution Plan (Ctrl+M).

Run the query.

Look for Table Scan or Index Scan → indicates inefficiencies.

Common bottlenecks:

Large Table Scans on Bookings, Users, Properties, or Payments.

Too many unnecessary JOINs.

Missing indexes on user_id, property_id, booking_id.

📌 Step 3: Refactored Query

To improve performance:

Use SELECT only required columns.

Ensure indexes exist on foreign keys (Bookings.user_id, Bookings.property_id, Payments.booking_id).

Reduce unnecessary joins (only join what’s needed).

Refactored query:

-- perfomance.sql (optimized version)
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    u.username,
    p.property_name,
    pay.amount
FROM Bookings b
JOIN Users u ON b.user_id = u.user_id
JOIN Properties p ON b.property_id = p.property_id
LEFT JOIN Payments pay ON b.booking_id = pay.booking_id;