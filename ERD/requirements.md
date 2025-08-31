ER Diagram
The diagram visually represents the six entities: User, Property, Booking, Payment, Review, and Message. It uses crow's foot notation to show the relationships and their cardinality. Primary keys are denoted with PK, and foreign keys with FK.

Entity and Attribute Identification
User: Represents both guests and hosts.

Attributes: user_id (PK), first_name, last_name, email, password_hash, phone_number, role, created_at.

Property: A listing managed by a host.

Attributes: property_id (PK), host_id (FK), name, description, location, pricepernight, created_at, updated_at.

Booking: A reservation made by a user for a property.

Attributes: booking_id (PK), property_id (FK), user_id (FK), start_date, end_date, total_price, status, created_at.

Payment: Tracks a payment for a specific booking.

Attributes: payment_id (PK), booking_id (FK), amount, payment_date, payment_method.

Review: Feedback from a user about a property.

Attributes: review_id (PK), property_id (FK), user_id (FK), rating, comment, created_at.

Message: Communication between two users.

Attributes: message_id (PK), sender_id (FK), recipient_id (FK), message_body, s