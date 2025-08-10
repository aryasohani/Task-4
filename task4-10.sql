USE ecommerce;
SHOW TABLES;

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'ecommerce' AND TABLE_NAME = 'products';

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'ecommerce' AND TABLE_NAME = 'order_items';

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'ecommerce' AND TABLE_NAME = 'orders';

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'ecommerce' AND TABLE_NAME = 'customers';

/* 1) Show first 10 rows from main tables */
SELECT * FROM customers LIMIT 10;
SELECT * FROM orders LIMIT 10;
SELECT * FROM products LIMIT 10;
SELECT * FROM order_items LIMIT 10;

SELECT DISTINCT
    p.product_id,
    p.product_category,
    oi.price
FROM products p
JOIN order_items oi 
    ON p.product_id = oi.product_id
WHERE oi.price > 1000
ORDER BY oi.price DESC;

SELECT 
    o.customer_id,
    SUM(oi.price + IFNULL(oi.freight_value, 0)) AS total_spent
FROM orders o
JOIN order_items oi 
    ON o.order_id = oi.order_id
GROUP BY o.customer_id
ORDER BY total_spent DESC;

SELECT 
    o.order_id,
    c.customer_unique_id,
    p.product_id,
    p.product_category,
    oi.price,
    oi.freight_value
FROM orders o
JOIN customers c 
    ON o.customer_id = c.customer_id
JOIN order_items oi 
    ON o.order_id = oi.order_id
JOIN products p 
    ON oi.product_id = p.product_id;

SELECT DISTINCT
    p.product_id,
    p.product_category,
    oi.price
FROM products p
JOIN order_items oi 
    ON p.product_id = oi.product_id
WHERE oi.price > (SELECT AVG(price) FROM order_items)
ORDER BY oi.price DESC;

CREATE OR REPLACE VIEW high_value_orders AS
SELECT 
    o.order_id,
    o.customer_id,
    SUM(oi.price + IFNULL(oi.freight_value, 0)) AS order_total
FROM orders o
JOIN order_items oi 
    ON o.order_id = oi.order_id
GROUP BY o.order_id, o.customer_id
HAVING order_total > 5000;

CREATE INDEX idx_order_items_price ON order_items(price);