joins_queries.sql demonstrates the use of INNER JOIN, LEFT JOIN, and RIGHT JOIN in SQL. Each join retrieves data by combining rows from two related tables based on a common column.

1. INNER JOIN

Definition: Returns only the rows that have matching values in both tables.

Use Case: When you want to see records that exist in both tables.

Example:

SELECT Customers.customer_id, Customers.name, Orders.order_id  
FROM Customers  
INNER JOIN Orders  
ON Customers.customer_id = Orders.customer_id;


✅ Output: Customers who have placed at least one order.

2. LEFT JOIN

Definition: Returns all rows from the left table (first table), and the matching rows from the right table. If there’s no match, NULL values are returned for the right table’s columns.

Use Case: When you want to include all records from the left table, regardless of whether they have related records in the right table.

Example:

SELECT Customers.customer_id, Customers.name, Orders.order_id  
FROM Customers  
LEFT JOIN Orders  
ON Customers.customer_id = Orders.customer_id;


✅ Output: All customers, including those who have never placed an order (orders will show as NULL).

3. RIGHT JOIN

Definition: Returns all rows from the right table, and the matching rows from the left table. If there’s no match, NULL values are returned for the left table’s columns.

Use Case: When you want to include all records from the right table, even if they don’t have related records in the left table.

Example:

SELECT Customers.customer_id, Customers.name, Orders.order_id  
FROM Customers  
RIGHT JOIN Orders  
ON Customers.customer_id = Orders.customer_id;


✅ Output: All orders, including those that don’t have a matching customer (customer info will show as NULL).

Summary Table
Join Type	Includes Non-Matching Rows From	Best For
INNER JOIN	None	Only rows with matches in both tables
LEFT JOIN	Left Table	Keeping all left table rows (even no matches)
RIGHT JOIN	Right Table	Keeping all right table rows (even no matches)