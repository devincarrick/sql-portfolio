-- 1. Index on customer email for quick lookups
CREATE INDEX idx_customer_email ON customers(email);

-- 2. Index on product name for search functionality
CREATE INDEX idx_product_name ON products(name);

-- 3. Index on order dates for reporting queries
CREATE INDEX idx_order_date ON orders(order_date);

-- 4. Compound index for filtering products by category and price
CREATE INDEX idx_category_price ON products(category_id, price);

-- 5. Index for customer lookups by name
CREATE INDEX idx_customer_name ON customers(last_name, first_name);

-- 6. Index for order status filtering
CREATE INDEX idx_order_status ON orders(status);

-- 7. Index for product reviews
CREATE INDEX idx_product_reviews ON reviews(product_id);