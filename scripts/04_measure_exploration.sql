-- =====================================
-- MEASURE EXPLORATION
-- =====================================
-- Find the total sales
-- Find how many items are sold
-- Find the average selling price
-- Find the total number of orders
-- Find the total number of products
-- Find the total number of customers
-- Find the total number of customers that has placed an order
SELECT
	'Total Sales' measure_name,
	SUM(sales_amount) measure_value
FROM gold.fact_sales
UNION ALL
SELECT
	'Total Quantity' measure_name,
	SUM(quantity) measure_value
FROM gold.fact_sales 
UNION ALL
SELECT
	'Average Price' measure_name,
	AVG(price) measure_value
FROM gold.fact_sales
UNION ALL
SELECT 
	'Total Nr. Orders' measure_name,
	COUNT(DISTINCT order_number) measure_value
FROM gold.fact_sales
UNION ALL
SELECT
	'Total Nr. Products' measure_name,
	COUNT(product_number) measure_value
FROM gold.dim_products
UNION ALL
SELECT
	'Total Nr. Customers' measure_name,
	COUNT(customer_id) measure_value
FROM gold.dim_customers
