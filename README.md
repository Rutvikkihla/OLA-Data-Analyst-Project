# OLA-Data-Analyst-Project

<h2> Power BI Dashboard Preview</h2>

<p align="center">
  <img src="./OLA%20Dashboard_page-0001.jpg" width="900">
</p>

<p align="center">
  <img src="./OLA%20Dashboard_page-0002.jpg" width="900">
</p>

<p align="center">
  <img src="./OLA%20Dashboard_page-0003.jpg" width="900">
</p>

<p align="center">
  <img src="./OLA%20Dashboard_page-0004.jpg" width="900">
</p>

<p align="center">
  <img src="./OLA%20Dashboard_page-0005.jpg" width="900">
</p>

## SQL Questions:
1. Retrieve all successful bookings:
2. Find the average ride distance for each vehicle type:
3. Get the total number of cancelled rides by customers:
4. List the top 5 customers who booked the highest number of rides:
5. Get the number of rides cancelled by drivers due to personal and car-related issues:
6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
7. Retrieve all rides where payment was made using UPI:
8. Find the average customer rating per vehicle type:
9. Calculate the total booking value of rides completed successfully:
10. List all incomplete rides along with the reason:

## Power BI Questions:
1. Ride Volume Over Time
2. Booking Status Breakdown
3. Top 5 Vehicle Types by Ride Distance
4. Average Customer Ratings by Vehicle Type
5. cancelled Rides Reasons
6. Revenue by Payment Method
7. Top 5 Customers by Total Booking Value
8. Ride Distance Distribution Per Day
9. Driver Ratings Distribution
10. Customer vs. Driver Ratings

## Data Columns
1. Date
2. Time
3. Booking_ID
4. Booking_Status
5. Customer_ID
6. Vehicle_Type
7. Pickup_Location
8. Drop_Location
9. V_TAT
10. C_TAT
11. cancelled_Rides_by_Customer
12. cancelled_Rides_by_Driver
13. Incomplete_Rides
14. Incomplete_Rides_Reason
15. Booking_Value
16. Payment_Method
17. Ride_Distance
18. Driver_Ratings
19. Customer_Rating


## 🗄️ SQL Analysis Queries

The following SQL queries were used to answer key business questions and generate insights from the OLA booking dataset.

### 1. Retrieve All Successful Bookings

```sql
SELECT *
FROM bookings
WHERE Booking_Status = 'Success';
```

### 2. Find the Average Ride Distance for Each Vehicle Type

```sql
SELECT
    Vehicle_Type,
    AVG(Ride_Distance) AS avg_distance
FROM bookings
GROUP BY Vehicle_Type;
```

### 3. Get the Total Number of Cancelled Rides by Customers

```sql
SELECT
    COUNT(*) AS total_customer_cancellations
FROM bookings
WHERE Booking_Status = 'cancelled by Customer';
```

### 4. List the Top 5 Customers Who Booked the Highest Number of Rides

```sql
SELECT
    Customer_ID,
    COUNT(Booking_ID) AS total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC
LIMIT 5;
```

### 5. Get the Number of Rides Cancelled by Drivers Due to Personal and Car-Related Issues

```sql
SELECT
    COUNT(*) AS driver_cancellations
FROM bookings
WHERE cancelled_Rides_by_Driver = 'Personal & Car related issue';
```

### 6. Find the Maximum and Minimum Driver Ratings for Prime Sedan Bookings

```sql
SELECT
    MAX(Driver_Ratings) AS max_rating,
    MIN(Driver_Ratings) AS min_rating
FROM bookings
WHERE Vehicle_Type = 'Prime Sedan';
```

### 7. Retrieve All Rides Where Payment Was Made Using UPI

```sql
SELECT *
FROM bookings
WHERE Payment_Method = 'UPI';
```

### 8. Find the Average Customer Rating Per Vehicle Type

```sql
SELECT
    Vehicle_Type,
    AVG(Customer_Rating) AS avg_customer_rating
FROM bookings
GROUP BY Vehicle_Type;
```

### 9. Calculate the Total Booking Value of Successfully Completed Rides

```sql
SELECT
    SUM(Booking_Value) AS total_successful_value
FROM bookings
WHERE Booking_Status = 'Success';
```

### 10. List All Incomplete Rides Along With Their Reasons

```sql
SELECT
    Booking_ID,
    Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides = 'Yes';
```

## Power BI Answers:
### Segregation of the views:
1. Overall
- Ride Volume Over Time
- Booking Status Breakdown
2. Vehicle Type
- Top 5 Vehicle Types by Ride Distance
3. Revenue
- Revenue by Payment Method
- Top 5 Customers by Total Booking Value
- Ride Distance Distribution Per Day
4. Cancellation
- Cancelled Rides Reasons (Customer)
- cancelled Rides Reasons(Drivers)
5. Ratings
- Driver Ratings
- Customer Ratings
  
### Answers:
1. **Ride Volume Over Time**: A time-series chart showing the number of rides per day/week.
2. **Booking Status Breakdown**: A pie or doughnut chart displaying the proportion of different
booking statuses (success, cancelled by the customer, cancelled by the driver, etc.).
3. **Top 5 Vehicle Types by Ride Distance**: A bar chart ranking vehicle types based on the total
distance covered.
4.** Average Customer Ratings by Vehicle Type**: A column chart showing the average
customer ratings for different vehicle types.
5. **cancelled Rides Reasons**: A bar chart that highlights the common reasons for ride
cancellations by customers and drivers.
6. **Revenue by Payment Method**: A stacked bar chart displaying total revenue based on
payment methods (Cash, UPI, Credit Card, etc.).
7. **Top 5 Customers by Total Booking Value**: A leaderboard visual listing customers who have
spent the most on bookings.
8. **Ride Distance Distribution Per Day**: A histogram or scatter plot showing the distribution of
ride distances for different Dates.
9. **Driver Rating Distribution**: A box plot visualizing the spread of driver ratings for different
vehicle types.
10.** Customer vs. Driver Ratings**: A scatter plot comparing customer and driver ratings for
each completed ride, analyzing correlations.


## 🗄️ SQL Questions & Answers

### Database Setup

```sql
CREATE DATABASE Ola;
USE Ola;
```

---

### 1. Retrieve All Successful Bookings

```sql
CREATE VIEW Successful_Bookings AS
SELECT *
FROM bookings
WHERE Booking_Status = 'Success';
```

---

### 2. Find the Average Ride Distance for Each Vehicle Type

```sql
CREATE VIEW Ride_Distance_For_Each_Vehicle AS
SELECT
    Vehicle_Type,
    AVG(Ride_Distance) AS avg_distance
FROM bookings
GROUP BY Vehicle_Type;
```

---

### 3. Get the Total Number of Cancelled Rides by Customers

```sql
CREATE VIEW Cancelled_Rides_By_Customers AS
SELECT
    COUNT(*) AS total_customer_cancellations
FROM bookings
WHERE Booking_Status = 'cancelled by Customer';
```

---

### 4. List the Top 5 Customers Who Booked the Highest Number of Rides

```sql
CREATE VIEW Top_5_Customers AS
SELECT
    Customer_ID,
    COUNT(Booking_ID) AS total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC
LIMIT 5;
```

---

### 5. Get the Number of Rides Cancelled by Drivers Due to Personal and Car-Related Issues

```sql
CREATE VIEW Rides_Cancelled_By_Drivers_P_C_Issues AS
SELECT
    COUNT(*) AS total_driver_cancellations
FROM bookings
WHERE cancelled_Rides_by_Driver = 'Personal & Car related issue';
```

---

### 6. Find the Maximum and Minimum Driver Ratings for Prime Sedan Bookings

```sql
CREATE VIEW Max_Min_Driver_Rating AS
SELECT
    MAX(Driver_Ratings) AS max_rating,
    MIN(Driver_Ratings) AS min_rating
FROM bookings
WHERE Vehicle_Type = 'Prime Sedan';
```

---

### 7. Retrieve All Rides Where Payment Was Made Using UPI

```sql
CREATE VIEW UPI_Payment AS
SELECT *
FROM bookings
WHERE Payment_Method = 'UPI';
```

---

### 8. Find the Average Customer Rating Per Vehicle Type

```sql
CREATE VIEW AVG_Cust_Rating AS
SELECT
    Vehicle_Type,
    AVG(Customer_Rating) AS avg_customer_rating
FROM bookings
GROUP BY Vehicle_Type;
```

---

### 9. Calculate the Total Booking Value of Successfully Completed Rides

```sql
CREATE VIEW Total_Successful_Ride_Value AS
SELECT
    SUM(Booking_Value) AS total_successful_ride_value
FROM bookings
WHERE Booking_Status = 'Success';
```

---

### 10. List All Incomplete Rides Along With Their Reasons

```sql
CREATE VIEW Incomplete_Rides_Reason AS
SELECT
    Booking_ID,
    Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides = 'Yes';
```

---

## 📊 Retrieve All View Results

```sql
SELECT * FROM Successful_Bookings;
SELECT * FROM Ride_Distance_For_Each_Vehicle;
SELECT * FROM Cancelled_Rides_By_Customers;
SELECT * FROM Top_5_Customers;
SELECT * FROM Rides_Cancelled_By_Drivers_P_C_Issues;
SELECT * FROM Max_Min_Driver_Rating;
SELECT * FROM UPI_Payment;
SELECT * FROM AVG_Cust_Rating;
SELECT * FROM Total_Successful_Ride_Value;
SELECT * FROM Incomplete_Rides_Reason;
```
