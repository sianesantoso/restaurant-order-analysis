# use database
USE restaurant_order;

# order detail preview 
SELECT * FROM orderdetails_data_cleaned;

# total order 
-- 5343 total order
SELECT COUNT(DISTINCT order_id) AS `Total Order` FROM orderdetails_data_cleaned;

# period data 
-- start (01 Jan 2023) End (31 Mar 2023) 
-- Q1 / 3 months
SELECT 
	MIN(order_date) AS `Start Period`,
	MAX(order_date) AS `End Period`
FROM orderdetails_data_cleaned;

# total items ordered
-- 12097 items
SELECT 
COUNT(item_id)  
FROM orderdetails_data_cleaned;


# the most and least orderred
-- the most orderred 101 = 622 orders
-- the leat orderred 115 = 123 orders
SELECT item_id, total_order
FROM (
    SELECT
        item_id,
        COUNT(*) AS total_order,
        RANK() OVER (ORDER BY COUNT(*) DESC) AS ranking
    FROM orderdetails_data_cleaned
    GROUP BY item_id
) AS t
WHERE ranking = 1;

SELECT item_id, total_order
FROM (
    SELECT
        item_id,
        COUNT(*) AS total_order,
        RANK() OVER (ORDER BY COUNT(*) ASC) AS ranking
    FROM orderdetails_data_cleaned
    GROUP BY item_id
) AS t
WHERE ranking = 1;

# average items per order
-- 2.26
SELECT
    ROUND(AVG(total_item), 2) AS `Average Items per Order`
FROM (
    SELECT
        order_id,
        COUNT(*) AS total_item
    FROM orderdetails_data_cleaned
    GROUP BY order_id
) AS t;

# 20 orders have more than 12 items 
# max 14 orders per order
SELECT COUNT(*) AS `Total Order`
FROM 
(SELECT 
COUNT(`order_id`) AS `Total Order`
FROM orderdetails_data_cleaned
GROUP BY `order_id`
HAVING COUNT(*) > 12) AS t;