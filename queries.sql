-- Task 3: SQL for Data Analysis (sample)
-- Schema (SQLite / MySQL compatible simplified)

DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
  customer_id INTEGER PRIMARY KEY,
  customer_name TEXT,
  email TEXT,
  city TEXT
);

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  order_id INTEGER PRIMARY KEY,
  customer_id INTEGER,
  order_date TEXT,
  amount REAL,
  FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);

-- Sample data inserts
INSERT INTO customers(customer_id, customer_name, email, city) VALUES
(1,'Alice','alice@example.com','Bengaluru'),
(2,'Bob','bob@example.com','Mumbai'),
(3,'Charlie','charlie@example.com','Chennai');

INSERT INTO orders(order_id, customer_id, order_date, amount) VALUES
(101,1,'2025-01-10',750.00),
(102,1,'2025-02-12',1250.50),
(103,2,'2025-01-15',300.00),
(104,3,'2025-03-05',980.00),
(105,2,'2025-03-20',450.00);

-- Example queries required by the task:

-- 1) Basic SELECT & WHERE
SELECT * FROM orders WHERE amount > 500;

-- 2) GROUP BY + SUM
SELECT customer_id, SUM(amount) AS total_spent
FROM orders
GROUP BY customer_id
ORDER BY total_spent DESC;

-- 3) Average Revenue Per User (ARPU)
SELECT AVG(total_spent) AS ARPU
FROM (
  SELECT customer_id, SUM(amount) AS total_spent
  FROM orders
  GROUP BY customer_id
) AS t;

-- 4) JOIN (customers + orders)
SELECT c.customer_name, o.order_id, o.amount, o.order_date
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
ORDER BY o.order_date;

-- 5) Subquery: orders above average amount
SELECT order_id, customer_id, amount
FROM orders
WHERE amount > (SELECT AVG(amount) FROM orders);

-- 6) Create a view for analysis
CREATE VIEW customer_revenue AS
SELECT customer_id, SUM(amount) AS revenue
FROM orders
GROUP BY customer_id;

-- 7) Create index (optimization hint)
-- MySQL / PostgreSQL syntax:
CREATE INDEX idx_orders_customer_id ON orders(customer_id);

-- End of sample SQL file.
