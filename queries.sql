--creating the table sales_data in the database

CREATE TABLE sales_data (
    TransactionID SERIAL PRIMARY KEY,
    CustomerID INT,
    TransactionDate TIMESTAMP,
    TransactionAmount NUMERIC,
    PaymentMethod VARCHAR(50),
    Quantity INT,
    DiscountPercent NUMERIC,
    City VARCHAR(100),
    StoreType VARCHAR(50),
    CustomerAge INT,
    CustomerGender VARCHAR(10),
    LoyaltyPoints INT,
    ProductName VARCHAR(100),
    Region VARCHAR(50),
    Returned VARCHAR(5),
    FeedbackScore INT,
    ShippingCost NUMERIC,
    DeliveryTimeDays INT,
    IsPromotional VARCHAR(5)
);

select * from sales_data;

--1. What is the total sales revenue?

SELECT SUM(TransactionAmount) as Total_Sales
from sales_data;

--2. What is the total quantity of items sold?

SELECT SUM(Quantity) AS Totalitems_sold
FROM sales_data;


--3. Which city has the highest sales?

SELECT City, SUM(TransactionAmount) AS Total_Sales
FROM sales_data
GROUP BY City
ORDER BY Total_Sales DESC
LIMIT 1;

--4. What are the top 5 products by sales revenue?

SELECT ProductName, SUM(TransactionAmount) AS Product_Sales
FROM sales_data
GROUP BY ProductName
ORDER BY Product_Sales desc
LIMIT 5;


--5. Which payment method is most commonly used?

SELECT PaymentMethod,COUNT(TransactionID) AS Usage_Count 
FROM sales_data 
GROUP BY PaymentMethod 
ORDER BY Usage_Count DESC;

--6.What is the average discount percentage for each product?

SELECT ProductName, AVG(DiscountPercent) AS Average_Discount 
FROM sales_data 
GROUP BY ProductName 
ORDER BY Average_Discount DESC;

--7.What is the distribution of sales by customer age group?

SELECT 
    CASE 
        WHEN CustomerAge < 20 THEN 'Under 20'
        WHEN CustomerAge BETWEEN 20 AND 40 THEN '20-40'
        WHEN CustomerAge BETWEEN 41 AND 60 THEN '41-60'
        ELSE 'Above 60'
    END AS AgeGroup,
SUM(TransactionAmount) AS TotalSales
FROM sales_data
GROUP BY AgeGroup
ORDER BY TotalSales DESC;

---8. What is the total revenue and transaction count for each store type?

SELECT StoreType, SUM(TransactionAmount) AS Total_Revenue, 
COUNT(TransactionID) AS Total_Transactions 
FROM sales_data 
GROUP BY StoreType 
ORDER BY Total_Revenue DESC;

--9. Which products are most frequently returned?

SELECT ProductName, COUNT(TransactionID) AS Returned_Count
FROM sales_data
WHERE Returned = 'Yes'
GROUP BY ProductName
ORDER BY Returned_Count DESC
LIMIT 5;


----10.Which city has the fastest average delivery time?

SELECT City, AVG(DeliveryTimeDays) AS Avg_delivery_time
FROM sales_data
GROUP BY City
ORDER BY Avg_delivery_time ASC
LIMIT 1;
