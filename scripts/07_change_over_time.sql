-- =======================================================
-- Change Over Time
-- =======================================================

-- Analyse Performance Sales Changes Over Month
SELECT
YEAR(order_date) order_year,
MONTH(order_date) order_month,
SUM(sales_amount) total_sales,
COUNT(DISTINCT customer_key) total_customer,
SUM(quantity) total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY YEAR(order_date), MONTH(order_date)

-- Analyse Performance Sales Changes Over Year (DATETRUNC)
SELECT
DATETRUNC(year, order_date) order_year,
SUM(sales_amount) total_sales,
COUNT(DISTINCT customer_key) total_customer,
SUM(quantity) total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(year, order_date)
ORDER BY DATETRUNC(year, order_date)

-- Analyse Performance Sales Changes Over Year (FORMAT)
SELECT
FORMAT(order_date, 'yyyy-MMM') order_date,
SUM(sales_amount) total_sales,
COUNT(DISTINCT customer_key) total_customer,
SUM(quantity) total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY FORMAT(order_date, 'yyyy-MMM')
ORDER BY FORMAT(order_date, 'yyyy-MMM')
