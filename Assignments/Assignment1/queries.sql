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
SELECT ROUND(SUM(oi.quantity * oi.unit_price), 2) AS Bob_Smith_Total_Expenditure
FROM Customers c
    JOIN Orders o ON c.customer_id = o.customer_id
    JOIN OrderItems oi ON o.order_id = oi.order_id
WHERE c.first_name = 'Bob'
    AND c.last_name = 'Smith' -- query 11
SELECT ROUND(AVG(customer_spending), 2) AS avg_books_customer_spending
FROM (
        SELECT o.customer_id,
            SUM(oi.quantity * oi.unit_price) AS customer_spending
        FROM Orders o
            JOIN OrderItems oi ON o.order_id = oi.order_id
        WHERE o.status = 'Completed'
            AND o.customer_id IN (
                -- Customers who purchased at least one Books product in a completed order
                SELECT o2.customer_id
                FROM Orders o2
                    JOIN OrderItems oi2 ON o2.order_id = oi2.order_id
                    JOIN Products p ON oi2.product_id = p.product_id
                WHERE p.category = 'Books'
                    AND o2.status = 'Completed'
            )
        GROUP BY o.customer_id
    ) -- query 12
SELECT ROUND(AVG(oi.rating), 2) AS avg_electronics_sept_rating
FROM Orders o
    JOIN OrderItems oi ON o.order_id = oi.order_id
    JOIN Products p ON oi.product_id = p.product_id
WHERE p.category = 'Electronics'
    AND o.status = 'Completed'
    AND o.order_date BETWEEN '2026-09-01' AND '2026-09-30';
-- query 13
SELECT ROUND(AVG(oi.rating), 2) AS avg_rating_2024_customers
FROM Customers c
    JOIN Orders o ON c.customer_id = o.customer_id
    JOIN OrderItems oi ON o.order_id = oi.order_id
WHERE c.registration_year = 2024
    AND o.status = 'Completed';
-- query 14
SELECT DISTINCT o.customer_id
FROM Orders o
    JOIN OrderItems oi ON o.order_id = oi.order_id
    JOIN Products p ON oi.product_id = p.product_id
WHERE p.product_name = 'Notebook Set'
    AND o.status = 'Completed'
ORDER BY o.customer_id ASC;
-- query 15
SELECT DISTINCT p.product_name
FROM Orders o
    JOIN OrderItems oi ON o.order_id = oi.order_id
    JOIN Products p ON oi.product_id = p.product_id
WHERE o.status = 'Completed'
    AND o.order_date BETWEEN '2026-09-01' AND '2026-11-30'
ORDER BY p.product_name ASC;
-- query 16
SELECT COUNT(DISTINCT o.customer_id) AS low_rating_customers
FROM Orders o
    JOIN OrderItems oi ON o.order_id = oi.order_id
    JOIN Products p ON oi.product_id = p.product_id
WHERE p.product_name = 'Wireless Mouse'
    AND oi.rating < 4
    AND o.status = 'Completed';
-- query 17
SELECT p.product_id,
    p.product_name
FROM Suppliers s
    JOIN Products p ON s.supplier_id = p.supplier_id
WHERE s.supplier_name = 'BookWorld'
ORDER BY p.product_id ASC;
-- query 18
SELECT DISTINCT p.product_name
FROM Customers c
    JOIN Orders o ON c.customer_id = o.customer_id
    JOIN OrderItems oi ON o.order_id = oi.order_id
    JOIN Products p ON oi.product_id = p.product_id
    JOIN Suppliers s ON p.supplier_id = s.supplier_id
WHERE c.first_name = 'George'
    AND c.last_name = 'White'
    AND s.supplier_name = 'TechSource'
ORDER BY p.product_name ASC;
-- query 19
SELECT ROUND(AVG(oi.rating), 2) AS avg_electronics_home_rating
FROM Orders o
    JOIN OrderItems oi ON o.order_id = oi.order_id
    JOIN Products p ON oi.product_id = p.product_id
WHERE p.category IN ('Electronics', 'Home')
    AND o.status = 'Completed';
-- query 20
SELECT SUM(oi.quantity) AS total_units_sold
FROM Orders o
    JOIN OrderItems oi ON o.order_id = oi.order_id
    JOIN Products p ON oi.product_id = p.product_id
WHERE p.category IN ('Books', 'Stationery')
    AND o.status = 'Completed';