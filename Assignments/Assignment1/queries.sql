-- query 1
SELECT customer_id
from Customers
where registration_year = 2026
    AND city = 'Montreal';
--query 2
SELECT category,
    COUNT(*) as product_counts
from Products
where category = 'Electronics';
--query 3
SELECT min(list_price)
from products
where category = 'Sports';
-- query 4
SELECT COUNT(DISTINCT o.customer_id) AS distinct_customers
from Orders o
    JOIN OrderItems oi ON o.order_id = oi.order_id
    JOIN Products P ON oi.product_id = p.product_id
WHERE p.product_name = 'USB-C Hub'
    AND o.status = 'Completed';
-- query 5
SELECT COUNT(DISTINCT p.product_id) AS distinct_products
from Suppliers s
    JOIN Products p ON s.supplier_id = p.supplier_id
    JOIN OrderItems oi on p.product_id = oi.product_id
    JOIN Orders o on oi.order_id = o.order_id
WHERE s.supplier_name = 'TechSource'
    AND o.status = 'Completed'
    AND o.order_date BETWEEN '2026-01-01' AND '2026-12-31';
-- query 6
SELECT COUNT(*) as Diana_Lee_Completed_Orders_2025
from Orders o
    JOIN Customers c ON o.customer_id = c.customer_id
WHERE c.first_name = 'Diana'
    AND c.last_name = 'Lee'
    AND o.status = 'Completed'
    AND o.order_date BETWEEN '2025-01-01' AND '2025-12-31' -- query 7
SELECT DISTINCT(o.order_date) as SQL_BOOK_DISTINCT_DATES
from Orders o
    JOIN OrderItems oi ON o.order_id = oi.order_id
    JOIN Products p ON oi.product_id = p.product_id -- JOIN Orders o ON oi.order_id = o.order_id
WHERE p.product_name = 'SQL Handbook'
    AND o.status = 'Completed'
ORDER BY o.order_date ASC -- query 8 
SELECT ROUND(AVG(oi.rating), 2) AS avg_yoga_mat_ratings
FROM Orders o
    JOIN OrderItems oi ON o.order_id = oi.order_id
    JOIN Products p ON oi.product_id = p.product_id
WHERE p.product_name = 'Yoga Mat'
    AND o.status = 'Completed';
-- query 9
SELECT AVG(oi.rating) as avg_Homeplus_Completed_Orders
FROM Suppliers s
    JOIN Products p ON s.supplier_id = p.supplier_id
    JOIN OrderItems oi ON p.product_id = oi.product_id
    JOIN Orders o ON oi.order_id = o.order_id
WHERE s.supplier_name = 'HomePlus'
    AND o.status = 'Completed';
-- query 10