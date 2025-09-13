-- Database Design & Normalization Assignment
-- Author: Prudence Mukite
-- Schema: Using classicmodels but with unique table names to avoid conflicts

USE classicmodels;

-- ==============================
-- QUESTION 1: Achieving 1NF
-- ==============================

-- Drop table if it exists
DROP TABLE IF EXISTS ProductDetail_1NF;

-- Create normalized table
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100)
);

-- Insert normalized rows (one product per row)
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

-- Check result
SELECT * FROM ProductDetail_1NF;


-- ==============================
-- QUESTION 2: Achieving 2NF
-- ==============================

-- Drop old tables if they exist
DROP TABLE IF EXISTS OrderDetails_2NF;
DROP TABLE IF EXISTS Orders_Assignment;

-- Create Orders table (holds OrderID and CustomerName)
CREATE TABLE Orders_Assignment (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Insert customer/order data
INSERT INTO Orders_Assignment (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Create OrderDetails table (holds product details, linked by OrderID)
CREATE TABLE OrderDetails_2NF (
    DetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders_Assignment(OrderID)
);

-- Insert order details
INSERT INTO OrderDetails_2NF (OrderID, Product, Quantity) VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

-- Check result
SELECT * FROM Orders_Assignment;
SELECT * FROM OrderDetails_2NF;
