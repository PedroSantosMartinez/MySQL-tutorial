# Create new database for E-Commerce Store

-- CREATE DATABASE e_commerce;
-- USE e_commerce;

-- Create Table for Customers
CREATE TABLE customers (
-- Add our schema
	customers_id INT AUTO_INCREMENT UNIQUE PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    phone_number VARCHAR(15) UNIQUE NOT NULL,
    address VARCHAR(50) NOT NULL,
    city VARCHAR(30) NOT NULL,
    state VARCHAR(20) NOT NULL,
    zip_code INT NOT NULL
);

ALTER TABLE customers
ADD registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- Create Table for Products
CREATE TABLE products (
	products_id INT AUTO_INCREMENT UNIQUE PRIMARY KEY,
    products_name VARCHAR(50) NOT NULL,
    prod_description VARCHAR(500),
    -- Add two decimal places for price
    price INT NOT NULL,
    stock_quantity INT NOT NULL,
    origin_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);

-- Create Table for Orders
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT UNIQUE PRIMARY KEY,
    customers_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled') DEFAULT 'Pending',
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customers_id) REFERENCES customers(customers_id)
);

CREATE TABLE order_details (
    order_detail_id INT AUTO_INCREMENT UNIQUE PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(products_id)
);

-- Add Data for Customers
INSERT INTO customers (first_name, last_name, email, phone_number, address, city, state, zip_code)
VALUES
('Alice', 'Johnson', 'alice.johnson@example.com', '1234567890', '123 Maple St', 'Springfield', 'IL', 62701),
('Bob', 'Smith', 'bob.smith@example.com', '9876543210', '456 Oak Ave', 'Springfield', 'IL', 62702),
('Carol', 'Williams', 'carol.williams@example.com', '5551234567', '789 Pine Rd', 'Chicago', 'IL', 60601),
('David', 'Brown', 'david.brown@example.com', '2223334444', '101 Birch Ln', 'Peoria', 'IL', 61602),
('Eve', 'Davis', 'eve.davis@example.com', '4445556666', '202 Cedar St', 'Rockford', 'IL', 61101);

-- Add Data for Products
INSERT INTO products (products_name, prod_description, price, stock_quantity)
VALUES
('Laptop', 'High-performance laptop', 1200.00, 10),
('Smartphone', 'Latest model smartphone', 800.00, 25),
('Tablet', 'Portable touchscreen tablet', 300.00, 15),
('Headphones', 'Noise-cancelling headphones', 150.00, 50),
('Smartwatch', 'Waterproof smartwatch with GPS', 200.00, 30);

-- Add Data for Orders
INSERT INTO orders (customers_id, total_amount)
VALUES
(1, 2000.00),  -- Order for Alice Johnson
(2, 1200.00),  -- Order for Bob Smith
(3, 800.00),   -- Order for Carol Williams
(4, 600.00),   -- Order for David Brown
(5, 300.00);   -- Order for Eve Davis

-- Add Data for Order Detail
INSERT INTO order_details (order_id, product_id, quantity, price)
VALUES
(1, 1, 1, 1200.00),  -- Alice Johnson buys 1 Laptop
(1, 2, 1, 800.00),   -- Alice Johnson buys 1 Smartphone
(2, 1, 1, 1200.00),  -- Bob Smith buys 1 Laptop
(3, 2, 1, 800.00),   -- Carol Williams buys 1 Smartphone
(4, 3, 2, 300.00),   -- David Brown buys 2 Tablets
(5, 4, 2, 150.00);   -- Eve Davis buys 2 Headphones




