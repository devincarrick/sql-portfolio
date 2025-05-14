-- 1. Add a loyalty points column to track customer engagement
ALTER TABLE customers
ADD COLUMN loyalty_points INTEGER DEFAULT 0;

-- 2. Add customer tier based on spending or engagement
ALTER TABLE customers
ADD COLUMN customer_tier VARCHAR(20) DEFAULT 'standard';

-- 3. Add inventory tracking fields to products
ALTER TABLE products
ADD COLUMN reorder_level INTEGER DEFAULT 10,
ADD COLUMN discontinued BOOLEAN DEFAULT FALSE;

-- 4. Add timestamps to track status changes in orders
ALTER TABLE orders
ADD COLUMN processed_at TIMESTAMP,
ADD COLUMN shipped_at TIMESTAMP,
ADD COLUMN delivered_at TIMESTAMP;

-- 5. Add constraints to enforce business rules
ALTER TABLE reviews
ADD CONSTRAINT valid_review_date CHECK (review_date <= CURRENT_TIMESTAMP);

-- 6. Modify existing column to change data type or constraints
ALTER TABLE products
ALTER COLUMN description TYPE VARCHAR(500);

-- 7. Add estimated delivery date to orders
ALTER TABLE orders
ADD COLUMN estimated_delivery DATE;

-- 8. Add seasonal pricing capability to products
ALTER TABLE products
ADD COLUMN on_sale BOOLEAN DEFAULT FALSE,
ADD COLUMN sale_price DECIMAL(10, 2);