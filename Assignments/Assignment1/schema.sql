PRAGMA foreign_keys = ON;
CREATE TABLE Customers (
    customer_id INTEGER PRIMARY KEY,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    city VARCHAR(60) NOT NULL,
    registration_year INTEGER NOT NULL CHECK (registration_year > 0)
);
CREATE TABLE Suppliers (
    supplier_id INTEGER PRIMARY KEY,
    supplier_name VARCHAR(60) NOT NULL UNIQUE,
    city VARCHAR(60) NOT NULL
);
CREATE TABLE Products (
    product_id INTEGER PRIMARY KEY,
    product_name VARCHAR(60) NOT NULL UNIQUE,
    category VARCHAR(40) NOT NULL,
    supplier_id INTEGER NOT NULL,
    list_price DECIMAL(10, 2) NOT NULL CHECK (list_price >= 0),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);
CREATE TABLE Orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    order_date DATE NOT NULL,
    status VARCHAR(12) NOT NULL CHECK (status IN ('Completed', 'Pending', 'Cancelled')),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
CREATE TABLE OrderItems (
    order_item_id INTEGER PRIMARY KEY,
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    unit_price DECIMAL(10, 2) NOT NULL CHECK (unit_price >= 0),
    rating INTEGER CHECK (
        rating IS NULL
        OR (
            rating BETWEEN 1 AND 5
        )
    ),
    UNIQUE (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);