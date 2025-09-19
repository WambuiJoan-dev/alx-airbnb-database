-- Step 1: Create Partition Function (partition by year of start_date)
CREATE PARTITION FUNCTION pfBookingByYear (DATE)
AS RANGE LEFT FOR VALUES (
    ('2022-12-31'),  -- Partition 1: <= 2022
    ('2023-12-31'),  -- Partition 2: <= 2023
    ('2024-12-31')   -- Partition 3: <= 2024
    -- Partition 4: > 2024 (default)
);

-- Step 2: Create Partition Scheme (map partitions to filegroups)
-- Here, all partitions go to [PRIMARY], but in production you’d spread across multiple filegroups/disks
CREATE PARTITION SCHEME psBookingByYear
AS PARTITION pfBookingByYear TO ([PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY]);

-- Step 3: Create Partitioned Table (replacing Booking)
-- Drop or rename existing Booking table if needed
CREATE TABLE Booking_Partitioned (
    booking_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    amount DECIMAL(10,2),
    status VARCHAR(20)
) ON psBookingByYear(start_date);

-- Optional: Copy data from old Booking table
-- INSERT INTO Booking_Partitioned SELECT * FROM Booking;
