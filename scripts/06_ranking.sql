-- =====================================
-- RANKING
-- =====================================
-- Which 5 products generate the highest revenue?
SELECT TOP 5
gdp.product_name,
SUM(gfs.sales_amount) total_revenue
FROM gold.fact_sales gfs
LEFT JOIN gold.dim_products gdp
ON gdp.product_key = gfs.product_key
GROUP BY gdp.product_name
ORDER BY total_revenue DESC

-- Which 5 products generate the highest revenue? (with window function)
SELECT *
FROM(
	SELECT
	gdp.product_name,
	SUM(gfs.sales_amount) total_revenue,
	ROW_NUMBER() OVER (ORDER BY SUM(gfs.sales_amount) DESC) AS rank_products
	FROM gold.fact_sales gfs
	LEFT JOIN gold.dim_products gdp
	ON gdp.product_key = gfs.product_key
	GROUP BY gdp.product_name
)t WHERE rank_products <= 5

-- What are the 5 worst-performing products in terms of sales?
SELECT TOP 5
gdp.product_name,
SUM(gfs.sales_amount) total_revenue
FROM gold.fact_sales gfs
LEFT JOIN gold.dim_products gdp
ON gdp.product_key = gfs.product_key
GROUP BY gdp.product_name
ORDER BY total_revenue ASC

-- Find the top 10 customers who have generated the highest revenue
SELECT TOP 10
gdc.customer_key,
gdc.first_name,
gdc.last_name,
SUM(gfs.sales_amount) total_revenue
FROM gold.fact_sales gfs
LEFT JOIN gold.dim_customers gdc
ON gdc.customer_key = gfs.customer_key
GROUP BY
gdc.customer_key,
gdc.first_name,
gdc.last_name
ORDER BY total_revenue DESC

-- Top 3 customers with the fewest orders placed
SELECT TOP 3
gdc.customer_key,
gdc.first_name,
gdc.last_name,
COUNT(DISTINCT order_number) total_orders
FROM gold.fact_sales gfs
LEFT JOIN gold.dim_customers gdc
ON gdc.customer_key = gfs.customer_key
GROUP BY
gdc.customer_key,
gdc.first_name,
gdc.last_name
ORDER BY total_orders ASC
