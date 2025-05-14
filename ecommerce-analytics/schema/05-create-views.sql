-- 1. Customer order summary view
CREATE VIEW customer_order_summary AS
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_spent,
    MAX(o.order_date) AS last_order_date
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name, c.email;

-- 2. Product performance view
CREATE VIEW product_performance AS
SELECT 
    p.product_id,
    p.name AS product_name,
    c.name AS category_name,
    SUM(oi.quantity) AS total_units_sold,
    SUM(oi.quantity * oi.unit_price) AS total_revenue,
    COUNT(DISTINCT o.customer_id) AS unique_customers,
    AVG(r.rating) AS average_rating,
    COUNT(r.review_id) AS review_count
FROM products p
LEFT JOIN categories c ON p.category_id = c.category_id
LEFT JOIN order_items oi ON p.product_id = oi.product_id
LEFT JOIN orders o ON oi.order_id = o.order_id
LEFT JOIN reviews r ON p.product_id = r.product_id
GROUP BY p.product_id, p.name, c.name;

-- 3. Order status overview
CREATE VIEW order_status_summary AS
SELECT 
    status,
    COUNT(*) AS order_count,
    SUM(total_amount) AS total_amount,
    MIN(order_date) AS earliest_order,
    MAX(order_date) AS latest_order,
    AVG(total_amount) AS average_order_value
FROM orders
GROUP BY status;