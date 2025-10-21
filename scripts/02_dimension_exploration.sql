-- =====================================
-- DIMENSION EXPLORATION
-- =====================================
-- Explore All Countries our Customers come from
SELECT DISTINCT country FROM gold.dim_customers

-- Explore All Categories "The Major Divisions"
SELECT DISTINCT category FROM gold.dim_products

-- Explore All Categories, subcategories, product_name "The Major Divisions"
SELECT DISTINCT category, subcategory, product_name FROM gold.dim_products
ORDER BY 1, 2, 3
