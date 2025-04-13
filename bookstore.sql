CREATE DATABASE bookstoreDB;
USE bookstoreDB;
CREATE TABLE book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    isbn VARCHAR(20),
    language_id INT,
    publisher_id INT,
    publication_year YEAR
);
 CREATE TABLE author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL
);
CREATE TABLE book_author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);
CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100)
);
CREATE TABLE customer_address (
    customer_id INT,
    address_id INT,
    PRIMARY KEY (customer_id, address_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id)
);
CREATE TABLE address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    street_address VARCHAR(255),
    city VARCHAR(100),
    postal_code VARCHAR(20),
    country_id INT
);
CREATE TABLE country (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL
);CREATE TABLE cust_order (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    shipping_method_id INT,
    order_status_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);
CREATE TABLE order_line (
    order_line_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);
CREATE TABLE order_status (
    order_status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(100) NOT NULL
);
CREATE TABLE shipping_method (
    shipping_method_id INT AUTO_INCREMENT PRIMARY KEY,
    method_name VARCHAR(100) NOT NULL
);
CREATE TABLE book_language (
    language_id INT AUTO_INCREMENT PRIMARY KEY,
    language_name VARCHAR(100) NOT NULL
);

CREATE TABLE publisher (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    publisher_name VARCHAR(255) NOT NULL
);
CREATE TABLE address_status (
    address_status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(100) NOT NULL
);
CREATE TABLE order_history (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    status_id INT,
    change_date DATETIME NOT NULL,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (status_id) REFERENCES order_status(order_status_id)
);

INSERT INTO book (book_id, title, isbn, language_id, publisher_id, publication_year)
VALUES 
(1, 'The Great Gatsby', '978-0743273565', 1, 1, 1925),
(2, 'To Kill a Mockingbird', '978-0060935467', 2, 2, 1960),
(3, '1984', '978-0451524935', 1, 3, 1949),
(4, 'Moby-Dick', '978-1503280786', 3, 4, 1851),
(5, 'Pride and Prejudice', '978-1503290563', 3, 5, 1813);
INSERT INTO author (author_id, first_name, last_name)
VALUES 
(1, 'F. Scott', 'Fitzgerald'),
(2, 'Harper', 'Lee'),
(3, 'George', 'Orwell'),
(4, 'Herman', 'Melville'),
(5, 'Jane', 'Austen');
INSERT INTO book_author (book_id, author_id)
VALUES 
(1, 1), -- 'The Great Gatsby' by F. Scott Fitzgerald
(2, 2), -- 'To Kill a Mockingbird' by Harper Lee
(3, 3), -- '1984' by George Orwell
(4, 4), -- 'Moby-Dick' by Herman Melville
(5, 5); -- 'Pride and Prejudice' by Jane Austen
INSERT INTO customer (customer_id, first_name, last_name, email)
VALUES 
(1, 'John', 'Doe', 'john.doe@example.com'),
(2, 'Jane', 'Smith', 'jane.smith@example.com'),
(3, 'Michael', 'Johnson', 'michael.johnson@example.com'),
(4, 'Emily', 'Davis', 'emily.davis@example.com'),
(5, 'Chris', 'Wilson', 'chris.wilson@example.com');
INSERT INTO customer_address (customer_id, address_id)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);
INSERT INTO address (address_id, street_address, city, postal_code, country_id)
VALUES 
(1, '123 Elm Street', 'Benin City', '300001', 1),
(2, '456 Oak Avenue', 'Lagos', '100001', 2),
(3, '789 Pine Drive', 'Abuja', '900001', 1),
(4, '321 Maple Blvd', 'Port Harcourt', '500001', 3),
(5, '654 Cedar Lane', 'Enugu', '400001', 1);
INSERT INTO country (country_id, country_name)
VALUES 
(1, 'Nigeria'),
(2, 'Ghana'),
(3, 'Kenya'),
(4, 'South Africa'),
(5, 'Egypt');
INSERT INTO cust_order (order_id, customer_id, order_date, shipping_method_id, order_status_id)
VALUES 
(1, 1, '2025-04-01', 1, 1),
(2, 2, '2025-04-02', 2, 2),
(3, 3, '2025-04-03', 3, 3),
(4, 4, '2025-04-04', 1, 4),
(5, 5, '2025-04-05', 2, 1);
INSERT INTO order_line (order_line_id, order_id, book_id, quantity)
VALUES 
(1, 1, 1, 2),
(2, 1, 2, 1),
(3, 2, 3, 1),
(4, 3, 4, 3),
(5, 4, 5, 1);
INSERT INTO order_status (order_status_id, status_name)
VALUES 
(1, 'Pending'),
(2, 'Shipped'),
(3, 'Delivered'),
(4, 'Cancelled'),
(5, 'Returned');
INSERT INTO shipping_method (shipping_method_id, method_name)
VALUES 
(1, 'Standard Shipping'),
(2, 'Express Shipping'),
(3, 'Overnight Shipping'),
(4, 'Pick-up'),
(5, 'Drone Delivery');
INSERT INTO book_language (language_id, language_name)
VALUES 
(1, 'English'),
(2, 'French'),
(3, 'Spanish'),
(4, 'German'),
(5, 'Italian');
INSERT INTO publisher (publisher_id, publisher_name)
VALUES 
(1, 'Penguin Random House'),
(2, 'HarperCollins'),
(3, 'Macmillan Publishers'),
(4, 'Simon & Schuster'),
(5, 'Oxford University Press');
INSERT INTO order_history (history_id, order_id, status_id, change_date)
VALUES 
(1, 1, 1, '2025-04-01 12:00:00'),
(2, 1, 2, '2025-04-02 14:00:00'),
(3, 2, 1, '2025-04-03 09:30:00'),
(4, 2, 3, '2025-04-04 10:45:00'),
(5, 3, 4, '2025-04-05 16:00:00');
INSERT INTO book (book_id, title, isbn, language_id, publisher_id, publication_year)
VALUES 
(1, 'The Great Gatsby', '978-0743273565', 1, 1, 1925),
(2, 'To Kill a Mockingbird', '978-0060935467', 1, 2, 1960),
(3, '1984', '978-0451524935', 1, 3, 1949),
(4, 'Moby-Dick', '978-1503280786', 3, 4, 1851),
(5, 'Pride and Prejudice', '978-1503290563', 3, 5, 1813);
-- Create roles
-- Create Roles
CREATE ROLE 'admin';
CREATE ROLE 'client';
CREATE ROLE 'employee';
CREATE ROLE 'guest';

-- Assign Privileges to Roles
GRANT ALL PRIVILEGES ON bookstoreDB.* TO 'admin';
GRANT SELECT, INSERT, UPDATE ON bookstoreDB.* TO 'client';
GRANT SELECT, INSERT, UPDATE ON bookstoreDB.order_history TO 'employee';
GRANT SELECT ON bookstoreDB.* TO 'guest';

-- Create Users
CREATE USER 'admin'@'admin_pc' IDENTIFIED BY 'admin_password';
CREATE USER 'client'@'client_device' IDENTIFIED BY 'client_password';
CREATE USER 'employee1'@'employee1_laptop' IDENTIFIED BY 'employee1_password';
CREATE USER 'employee2'@'employee2_laptop' IDENTIFIED BY 'employee2_password';
CREATE USER 'guest'@'guest_device' IDENTIFIED BY 'guest_password';

-- Assign Roles to Users
GRANT 'admin' TO 'admin'@'admin_pc';
GRANT 'client' TO 'client'@'client_device';
GRANT 'employee' TO 'employee1'@'employee1_laptop';
GRANT 'employee' TO 'employee2'@'employee2_laptop';
GRANT 'guest' TO 'guest'@'guest_device';

-- Set Default Roles for Users
SET DEFAULT ROLE 'admin'TO 'admin'@'admin_pc';
SET DEFAULT ROLE 'client' TO 'client'@'client_device';
SET DEFAULT ROLE 'employee' TO 'employee1'@'employee1_laptop';
SET DEFAULT ROLE 'employee' TO 'employee2'@'employee2_laptop';
SET DEFAULT ROLE 'guest' TO 'guest'@'guest_device';

-- Apply Changes
FLUSH PRIVILEGES;


