-- create database sales;
use sales;

-- Retrieve all columns from a table
SELECT 
    *
FROM
    superstore limit 5;
    
-- 1.Total Revenue from All Orders
SELECT 
    SUM(Sales) AS total_revenue
FROM
    superstore;

-- 2.Average Order Amount
SELECT 
    AVG(Sales) AS average_order_value
FROM
    superstore;

-- 3.Total Number of Orders
SELECT 
    COUNT(DISTINCT OrderID) AS total_orders
FROM
    superstore;

-- 4.Maximum and Minimum Order Value
SELECT 
    MAX(Sales) AS max_order_value, MIN(Sales) AS min_order_value
FROM
    superstore;

-- 5.Revenue per Product
SELECT 
    ProductID, SUM(Sales) AS revenue_per_product
FROM
    superstore
GROUP BY ProductID
ORDER BY revenue_per_product DESC;

-- 6.Average Order Value by Month
SELECT 
    YEAR(STR_TO_DATE(OrderDate, '%c/%e/%Y')) AS order_year,
    MONTH(STR_TO_DATE(OrderDate, '%c/%e/%Y')) AS order_month,
    AVG(Sales) AS avg_order_value
FROM
    superstore
WHERE STR_TO_DATE(OrderDate, '%c/%e/%Y') IS NOT NULL
GROUP BY order_year, order_month
ORDER BY order_year, order_month;

-- 7.Products with More Than 10 Orders
SELECT 
    ProductID, 
    COUNT(DISTINCT OrderID) AS total_orders
FROM
    superstore
GROUP BY ProductID
HAVING COUNT(DISTINCT OrderID) > 10;

 -- 8.Total Orders and Total Revenue by Customer
SELECT 
    CustomerID,
    COUNT(OrderID) AS total_orders,
    SUM(Sales) AS total_spent
FROM
    superstore
GROUP BY CustomerID
ORDER BY total_spent DESC;

-- 9.Region-Wise Minimum, Maximum, and Average Sales
SELECT 
    Region,
    MIN(Sales) AS min_sale,
    MAX(Sales) AS max_sale,
    AVG(Sales) AS avg_sale
FROM
    superstore
GROUP BY Region;

-- 10.Top 3 Months by Total Revenue
SELECT 
    YEAR(STR_TO_DATE(OrderDate, '%c/%e/%Y')) AS year,
    MONTH(STR_TO_DATE(OrderDate, '%c/%e/%Y')) AS month,
    SUM(Sales) AS monthly_revenue
FROM superstore
WHERE STR_TO_DATE(OrderDate, '%c/%e/%Y') IS NOT NULL
GROUP BY year, month
ORDER BY monthly_revenue DESC
LIMIT 3;

    