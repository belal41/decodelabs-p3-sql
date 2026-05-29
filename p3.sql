-- Project 3 - SQL Analysis
-- decodelabs internship 2026
-- table: orders

USE decodelabs;

-- first look
SELECT TOP 10 * FROM p3;

-- total orders
SELECT COUNT(*) AS total_orders FROM p3;

-- revenue overview
SELECT
    COUNT(*) AS total_orders,
    SUM(TotalPrice) AS total_revenue,
    AVG(TotalPrice) AS avg_order,
    MAX(TotalPrice) AS highest,
    MIN(TotalPrice) AS lowest
FROM p3;

-- orders and revenue per product
SELECT
    Product,
    COUNT(*) AS orders,
    SUM(TotalPrice) AS revenue,
    ROUND(AVG(TotalPrice), 2) AS avg_value
FROM p3
GROUP BY Product
ORDER BY revenue DESC;

-- payment methods
SELECT
    PaymentMethod,
    COUNT(*) AS total,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM p3), 1) AS pct
FROM p3
GROUP BY PaymentMethod
ORDER BY total DESC;

-- order status
SELECT
    OrderStatus,
    COUNT(*) AS total,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM p3), 1) AS pct
FROM p3
GROUP BY OrderStatus
ORDER BY total DESC;

-- cancelled orders - lost revenue
SELECT
    COUNT(*) AS cancelled,
    SUM(TotalPrice) AS lost_revenue,
    AVG(TotalPrice) AS avg_value
FROM p3
WHERE OrderStatus = 'Cancelled';

-- where customers come from
SELECT
    ReferralSource,
    COUNT(*) AS orders,
    ROUND(SUM(TotalPrice), 2) AS revenue
FROM p3
GROUP BY ReferralSource
ORDER BY orders DESC;

-- monthly revenue
SELECT
    FORMAT(CAST(Date AS DATE), 'yyyy-MM') AS month,
    COUNT(*) AS orders,
    ROUND(SUM(TotalPrice), 2) AS revenue
FROM p3
GROUP BY FORMAT(CAST(Date AS DATE), 'yyyy-MM')
ORDER BY month;

-- top 10 orders by value
SELECT TOP 10
    OrderID, CustomerID, Product,
    Quantity, UnitPrice, TotalPrice, OrderStatus
FROM p3
ORDER BY TotalPrice DESC;

-- orders above average price
SELECT OrderID, CustomerID, Product, TotalPrice, OrderStatus
FROM p3
WHERE TotalPrice > (SELECT AVG(TotalPrice) FROM p3)
ORDER BY TotalPrice DESC;

-- product + status breakdown
SELECT
    Product, OrderStatus,
    COUNT(*) AS orders,
    ROUND(SUM(TotalPrice), 2) AS revenue
FROM p3
GROUP BY Product, OrderStatus
ORDER BY Product, revenue DESC;

-- coupon usage
SELECT
    CouponCode,
    COUNT(*) AS used,
    ROUND(SUM(TotalPrice), 2) AS revenue
FROM p3
GROUP BY CouponCode
ORDER BY used DESC;

-- units sold per product
SELECT
    Product,
    SUM(Quantity) AS total_units,
    ROUND(AVG(CAST(Quantity AS FLOAT)), 2) AS avg_qty
FROM p3
GROUP BY Product
ORDER BY total_units DESC;

-- products with more than 200 orders
SELECT Product, COUNT(*) AS orders
FROM p3
GROUP BY Product
HAVING COUNT(*) > 200
ORDER BY orders DESC;