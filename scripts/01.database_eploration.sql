-- =====================================
-- DATABASE EXPLORATION
-- =====================================

-- Explore All Objects in the Database
SELECT * FROM INFORMATION_SCHEMA.TABLES

-- Explore All Column in the Database
SELECT * FROM INFORMATION_SCHEMA.COLUMNS

-- Explore dim_customers column in the Database
SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'dim_customers'
