# create db
CREATE DATABASE restaurant_order;

# use db
USE restaurant_order;

# check cleaning table
# 1. menu data (rows, columns, preview) 
SELECT 
COUNT(*) AS `Total Rows`,  
(
	SELECT COUNT(*)
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA = 'restaurant_order'
	AND TABLE_NAME = 'menu_data_cleaned'
) AS `Total Kolom`
FROM menu_data_cleaned;

SELECT * FROM menu_data_cleaned;

# 2. order details data (rows, columns, preview)
SELECT 
COUNT(*) AS `Total Baris`,
(
	SELECT COUNT(*)
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'restaurant_order'
	AND TABLE_NAME = 'orderdetails_data_cleaned'
) AS `Total Kolom`
FROM orderdetails_data_cleaned;

SELECT * FROM orderdetails_data_cleaned;


