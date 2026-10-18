PRAGMA foreign_keys = ON;
-- Populate Customers
INSERT INTO Customers (
        customer_id,
        first_name,
        last_name,
        city,
        registration_year
    )
VALUES (1, 'Alice', 'Brown', 'Montreal', 2024),
    (2, 'Bob', 'Smith', 'Toronto', 2023),
    (3, 'Charlie', 'Johnson', 'Montreal', 2025),
    (4, 'Diana', 'Lee', 'Ottawa', 2024),
    (5, 'Ethan', 'Moore', 'Toronto', 2025),
    (6, 'Fiona', 'Davis', 'Montreal', 2026),
    (7, 'George', 'White', 'Quebec City', 2023),
    (8, 'Hannah', 'Kim', 'Ottawa', 2026);
-- Populate Suppliers
INSERT INTO Suppliers (supplier_id, supplier_name, city)
VALUES (1, 'TechSource', 'Toronto'),
    (2, 'HomePlus', 'Montreal'),
    (3, 'BookWorld', 'Ottawa'),
    (4, 'ActiveLife', 'Toronto'),
    (5, 'GreenGoods', 'Vancouver'),
    (6, 'OfficePro', 'Montreal');
-- Populate Products
INSERT INTO Products (
        product_id,
        product_name,
        category,
        supplier_id,
        list_price
    )
VALUES (101, 'Wireless Mouse', 'Electronics', 1, 30.00),
    (102, 'USB-C Hub', 'Electronics', 1, 60.00),
    (103, 'Desk Lamp', 'Home', 2, 45.00),
    (104, 'Coffee Maker', 'Home', 2, 120.00),
    (105, 'SQL Handbook', 'Books', 3, 50.00),
    (106, 'Yoga Mat', 'Sports', 4, 35.00),
    (107, 'Reusable Bottle', 'Sports', 5, 25.00),
    (108, 'Notebook Set', 'Stationery', 6, 15.00);
-- Populate Orders
INSERT INTO Orders (order_id, customer_id, order_date, status)
VALUES (1, 1, '2026-09-05', 'Completed'),
    (2, 2, '2026-09-08', 'Completed'),
    (3, 4, '2026-09-12', 'Completed'),
    (4, 5, '2026-10-01', 'Completed'),
    (5, 6, '2026-10-03', 'Pending'),
    (6, 2, '2026-10-07', 'Completed'),
    (7, 7, '2026-10-10', 'Cancelled'),
    (8, 8, '2026-10-12', 'Completed'),
    (9, 1, '2026-08-20', 'Completed'),
    (10, 4, '2026-11-02', 'Completed'),
    (11, 3, '2025-12-15', 'Completed'),
    (12, 6, '2026-11-05', 'Completed');
-- Populate OrderItems
INSERT INTO OrderItems (
        order_item_id,
        order_id,
        product_id,
        quantity,
        unit_price,
        rating
    )
VALUES (1, 1, 101, 2, 28.00, 5),
    (2, 1, 105, 1, 50.00, 4),
    (3, 2, 102, 1, 55.00, 4),
    (4, 2, 106, 2, 35.00, 3),
    (5, 3, 103, 1, 40.00, 5),
    (6, 3, 105, 2, 48.00, 4),
    (7, 4, 104, 1, 115.00, 2),
    (8, 4, 107, 3, 22.00, 4),
    (9, 5, 101, 1, 30.00, NULL),
    (10, 6, 106, 1, 32.00, 5),
    (11, 6, 107, 2, 25.00, NULL),
    (12, 7, 102, 1, 60.00, NULL),
    (13, 8, 108, 4, 15.00, 5),
    (14, 9, 101, 1, 30.00, 3),
    (15, 10, 104, 1, 110.00, 4),
    (16, 10, 105, 1, 45.00, 5),
    (17, 11, 105, 1, 50.00, 4),
    (18, 12, 108, 2, 14.00, 4),
    (19, 12, 103, 1, 42.00, NULL);