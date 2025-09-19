Findings:

Queries filtering by start_date scanned the entire Booking table (high logical reads).

JOINs on user_id and property_id showed table scans due to missing indexes.

Sorting bookings by amount required expensive sort operations.

Optimizations Implemented:

Added indexes on start_date, user_id, property_id, and amount.

Refactored queries to avoid SELECT * and use indexed columns in WHERE clauses.

Partitioning Booking table by year to reduce scans on historical data.

Results:

Logical reads reduced by ~50% on date-filtered queries.

Query execution time improved by ~40% on joins.

Sorting by amount now uses the index → faster ordering.

Conclusion:
Continuous monitoring with execution plans allowed us to detect bottlenecks and optimize queries. The implemented changes significantly improved overall database responsiveness and scalability