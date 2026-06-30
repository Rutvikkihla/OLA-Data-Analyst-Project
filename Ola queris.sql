CREATE DATABASE OLA;

-- Use database 
USE OLA;

--   Find Insights
-- Q.1 - Retrive all successfull bookings
CREATE VIEW successfull_bookings as
SELECT * FROM ola_bookings
WHERE Booking_Status = 'Success';

-- Retrive all successfull_bookings 
select * from successfull_bookings;

-- Q.2 - Find the average ride distance for each vehicle type
CREATE VIEW avg_ride_distance_for_each_vehicles as
SELECT Vehicle_Type, AVG(Ride_Distance) as Average_distance 
FROM ola_bookings
group by Vehicle_Type ;

select * from avg_ride_distance_for_each_vehicles;

-- Q.3 - Get the total number of rides canceled by Customers    
CREATE VIEW ride_canceled_by_Customers as 
SELECT count(Booking_Status) as canceled_ride_by_customer
FROM ola_bookings
WHERE Booking_Status = 'Canceled by Customer';

select * from ride_canceled_by_Customers;

-- Q.4 - List The Top 5 Customers Who Booked Higest Numbers Of Rides
CREATE VIEW TOP_5_Customers AS
select Customer_ID , count(Booking_ID) as No_of_Rides
from ola_bookings
group by Customer_ID 
order by No_of_Rides desc limit 5;

SELECT * FROM TOP_5_Customers;

-- Q.5 - Get The Number Of Rides Canceled by drivers due to personal and car-related issue
CREATE VIEW Canceled_by_driver AS
select count(*) as canceled_ride_by_drivers
from ola_bookings
where Canceled_Rides_by_Driver = 'Personal & Car related issue';

SELECT * FROM Canceled_by_driver;

-- Q.6 - Find The Maximum and minimum driver rating for Prime Sedan booking
CREATE VIEW min_max_driver_rating AS
SELECT max(Driver_Ratings) as max_rating, min(Driver_Ratings) as min_rating
FROM ola_bookings
where Vehicle_Type = 'Prime SUV';

SELECT * FROM min_max_driver_rating;

-- Q.7 - Retrieve all riders where payment was made using UPI
CREATE VIEW Drivers_payment_in_upi AS
SELECT *
FROM ola_bookings
WHERE Payment_Method = 'UPI';

SELECT * FROM Drivers_payment_in_upi;

-- Q.8 - Find the average customer rating per vehicle types
CREATE VIEW avg_customer_rating_per_vehicle AS
SELECT Vehicle_Type, avg(Customer_Rating) as avg_customer_rating
FROM ola_bookings
group by Vehicle_Type;

SELECT * FROM avg_customer_rating_per_vehicle;

-- Q.9 - Calculate the total booking value of rides completed successfully
CREATE VIEW Total_sucessfull_booking_Ride_value AS
SELECT SUM(Booking_Value) as Total_sucessfull_booking_value
FROM ola_bookings
WHERE Booking_Status = 'Success';

SELECT * FROM Total_sucessfull_booking_Ride_value;


-- Q.10 - List all incomplete rides along with the reasons 

CREATE VIEW all_incomplete_rides_with_the_reasons AS
SELECT Incomplete_Rides, Incomplete_Rides_Reason
FROM ola_bookings
WHERE Incomplete_Rides = 'Yes';

SELECT * FROM all_incomplete_rides_with_the_reasons;

