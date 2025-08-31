Normalization Steps and Explanation
1. First Normal Form (1NF)
A table is in 1NF if it meets the following criteria:

All columns contain atomic values (single, indivisible pieces of data).

Each row is unique.

The schema provided for the Airbnb project already satisfies 1NF. For example, in the User table, first_name and last_name are separate columns, and a composite key isn't needed. In the Booking table, start_date and end_date are separate, atomic values. All primary keys (user_id, property_id, etc.) ensure that each row is unique.

2. Second Normal Form (2NF)
A table is in 2NF if it is in 1NF and all non-key attributes are fully dependent on the primary key. This applies primarily to tables with composite primary keys.

In this schema, none of the tables have composite primary keys. Every table's primary key is a single UUID column (user_id, property_id, booking_id, etc.). Therefore, any non-key attribute in these tables is by definition fully dependent on the entire primary key. For example, in the Property table, name, description, and pricepernight are all fully dependent on the property_id. The schema already meets 2NF.

3. Third Normal Form (3NF)
A table is in 3NF if it is in 2NF and all non-key attributes are not transitively dependent on the primary key. A transitive dependency occurs when a non-key attribute is dependent on another non-key attribute, which is in turn dependent on the primary key.

Upon reviewing the provided schema, there are no clear instances of transitive dependencies. Let's examine a few tables:

User Table: All attributes (first_name, last_name, email, etc.) directly describe a user and depend only on the user_id. There are no attributes that depend on another non-key attribute.

Property Table: Attributes like name, location, and pricepernight are directly tied to the property_id. The host_id is a foreign key, which is a key part of the relationship structure, not a transitive dependency.

Booking Table: Attributes like start_date, end_date, and total_price are directly related to the specific booking_id. There are no attributes whose values are determined by another non-key column within this table.

Message Table: The sender_id and recipient_id are both foreign keys, not transitively dependent attributes. They link the message directly to the users involved.

