# Sales Data Analysis - Key Insights

## Overview
This document highlights key insights derived from the analysis of the `sales_data` table using SQL queries. The table contains information about transactions, customer demographics, product details, and more.

---

## Key Insights

### **1. Total Sales and Quantity**
- **Total Sales Revenue**: The total revenue generated from all transactions is calculated using the `SUM` function on the `TransactionAmount` column.
  - **SQL Query**: `SELECT SUM(TransactionAmount) AS Total_Sales FROM sales_data;`
  - **Insight**: Total sales revenue provides a high-level view of business performance.

- **Total Items Sold**: The total number of items sold is derived using the `SUM` function on the `Quantity` column.
  - **SQL Query**: `SELECT SUM(Quantity) AS Totalitems_sold FROM sales_data;`

---

### **2. City-wise Analysis**
- **Highest Sales City**: The city with the highest sales is determined using the `GROUP BY` clause with `SUM` and ordered in descending order.
  - **SQL Query**: `SELECT City, SUM(TransactionAmount) AS Total_Sales FROM sales_data GROUP BY City ORDER BY Total_Sales DESC LIMIT 1;`
  - **Insight**: Identifies the city contributing the most to overall sales.

---

### **3. Product Performance**
- **Top 5 Products by Sales Revenue**: Products are ranked by revenue using the `GROUP BY` clause and `SUM` function.
  - **SQL Query**: `SELECT ProductName, SUM(TransactionAmount) AS Product_Sales FROM sales_data GROUP BY ProductName ORDER BY Product_Sales DESC LIMIT 5;`
  - **Insight**: Highlights the best-performing products by revenue.

- **Most Frequently Returned Products**: The most returned products are identified using a filter on `Returned = 'Yes'`.
  - **SQL Query**: `SELECT ProductName, COUNT(TransactionID) AS Returned_Count FROM sales_data WHERE Returned = 'Yes' GROUP BY ProductName ORDER BY Returned_Count DESC LIMIT 5;`

---

### **4. Payment Method Analysis**
- **Most Common Payment Method**: The payment method used most frequently is identified using the `COUNT` function and `GROUP BY`.
  - **SQL Query**: `SELECT PaymentMethod, COUNT(TransactionID) AS Usage_Count FROM sales_data GROUP BY PaymentMethod ORDER BY Usage_Count DESC;`

---

### **5. Discounts**
- **Average Discount Percentage per Product**: The average discount offered on each product is calculated.
  - **SQL Query**: `SELECT ProductName, AVG(DiscountPercent) AS Average_Discount FROM sales_data GROUP BY ProductName ORDER BY Average_Discount DESC;`
  - **Insight**: Determines how discounts vary by product.

---

### **6. Demographics**
- **Sales Distribution by Age Group**: Age groups are segmented, and their contribution to sales is calculated.
  - **SQL Query**: 
    ```sql
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
    ```
  - **Insight**: Provides an understanding of the most profitable age groups.

---

### **7. Store Performance**
- **Total Revenue and Transaction Count by Store Type**: Revenue and transaction counts are aggregated for each store type.
  - **SQL Query**: `SELECT StoreType, SUM(TransactionAmount) AS Total_Revenue, COUNT(TransactionID) AS Total_Transactions FROM sales_data GROUP BY StoreType ORDER BY Total_Revenue DESC;`

---

### **8. Delivery Analysis**
- **Fastest Average Delivery Time by City**: Cities with the quickest delivery times are identified using the `AVG` function.
  - **SQL Query**: `SELECT City, AVG(DeliveryTimeDays) AS Avg_delivery_time FROM sales_data GROUP BY City ORDER BY Avg_delivery_time ASC LIMIT 1;`
  - **Insight**: Highlights regions with the best logistical efficiency.

---
