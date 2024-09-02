CREATE DATABASE IF NOT EXISTS global_store_db;
USE global_store_db;

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2),
    quantity INT
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    quantity_ordered INT,
    order_date DATE,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

ALTER TABLE products 
ADD COLUMN category VARCHAR(50) AFTER price;

RENAME TABLE products TO inventory;

INSERT INTO inventory (name, price, quantity, category) VALUES
('Product A', 25.50, 20, 'Category 1'),
('Product B', 40.00, 15, 'Category 2'),
('Product C', 10.00, 0, 'Category 1'),
('Product D', 75.99, 8, 'Category 3'),
('Product E', 150.00, 5, 'Category 4'),
('Product F', 50.00, 25, 'Category 2'),
('Product G', 30.00, 12, 'Category 1'),
('Product H', 20.00, 0, 'Category 3'),
('Product I', 60.00, 10, 'Category 2'),
('Product J', 85.00, 7, 'Category 4');

INSERT INTO orders (product_id, quantity_ordered, order_date) VALUES
(1, 3, '2024-08-01'),
(2, 2, '2024-08-02'),
(5, 1, '2024-08-03'),
(6, 4, '2024-08-04'),
(9, 2, '2024-08-05');

SELECT * FROM inventory;

SELECT * FROM orders;

SELECT DISTINCT category FROM inventory;

SELECT * FROM inventory 
ORDER BY price DESC 
LIMIT 5;

SELECT name FROM inventory 
WHERE quantity > 10;

SELECT SUM(price * quantity) AS total_inventory_value 
FROM inventory;

SELECT category, COUNT(*) AS product_count 
FROM inventory 
GROUP BY category;

SELECT name, price 
FROM inventory 
WHERE quantity = 0;

CREATE VIEW expensive_products AS
SELECT * 
FROM inventory 
WHERE price > (SELECT AVG(price) FROM inventory);

INSERT INTO inventory (name, price, quantity, category) VALUES
('Product K', 200.00, 5, 'Category 5'),
('Product L', 100.00, 10, 'Category 6'),
('Product M', 300.00, 3, 'Category 5'),
('Product N', 50.00, 20, 'Category 6'),
('Product O', 400.00, 2, 'Category 5');

SELECT * FROM expensive_products;

SELECT i.name, o.quantity_ordered 
FROM inventory i
JOIN orders o ON i.product_id = o.product_id;











