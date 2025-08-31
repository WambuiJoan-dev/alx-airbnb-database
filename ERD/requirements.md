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

Attributes: message_id (PK), sender_id (FK), recipient_id (FK), message_body, 

Relationships and Cardinality
User to Property: A one-to-many relationship. A User with the host role can list many Properties, but each Property is owned by one User.

Relationship: "hosts"

User to Booking: A one-to-many relationship. A User can create many Bookings, but each Booking is made by only one User.

Relationship: "makes"

Property to Booking: A one-to-many relationship. A Property can have many Bookings, but each Booking is for only one Property.

Relationship: "is booked as"

Booking to Payment: A one-to-one relationship. Each Booking has exactly one corresponding Payment, and each Payment belongs to only one Booking.

Relationship: "has"

User to Review: A one-to-many relationship. A User can write many Reviews, but each Review is written by only one User.

Relationship: "writes"

Property to Review: A one-to-many relationship. A Property can receive many Reviews, but each Review is for only one Property.

Relationship: "is reviewed by"

User to Message: A one-to-many relationship with itself, or a many-to-many relationship represented by two one-to-many relationships. A User can be the sender of many Messages and the recipient of many Messages. The sender_id and recipient_id foreign keys in the Message table link back to the user_id in the User table to define this relationship.

Relationship: "sends/receives"