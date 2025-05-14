-- This section demonstrates the proper sequence for dropping tables
-- with foreign key constraints. In real scenario, you would not run these
-- until you're ready to remove the database.

-- To drop tables in the correct order:
DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS suppliers;
DROP TABLE IF EXISTS categories;

-- Alternative: Drop with CASCADE (use with caution!)
-- DROP TABLE IF EXISTS categories CASCADE;