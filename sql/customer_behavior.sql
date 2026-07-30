WITH customer_behavior AS (
SELECT * 
FROM
orderdetails_data_cleaned o
LEFT JOIN menu_data_cleaned m
ON o.item_id = m.menu_item_id 
)

# total sales 
-- 159217.9 in 3 months
SELECT 
ROUND(SUM(price),2) AS `Total Sales`
FROM customer_behavior;

# AOV
-- 29,8
WITH customer_behavior AS (
SELECT * 
FROM
orderdetails_data_cleaned o
LEFT JOIN menu_data_cleaned m
ON o.item_id = m.menu_item_id 
)

SELECT 
ROUND(SUM(price)/COUNT(DISTINCT order_id),2) AS `AOV`
FROM customer_behavior;

# least and most ordered items
-- least ordered : chicken tacos 
-- most ordered : hamburger
WITH customer_behavior AS (
SELECT * 
FROM
orderdetails_data_cleaned o
LEFT JOIN menu_data_cleaned m
ON o.item_id = m.menu_item_id 
)

SELECT item_name, category, `Total Order`
FROM (
    SELECT
        item_name,
        category,
        COUNT(*) AS `Total Order`,
        RANK() OVER (ORDER BY COUNT(*) ASC) AS ranking
    FROM customer_behavior
    GROUP BY item_id, item_name, category
) AS t
WHERE ranking = 1
   OR ranking = (
       SELECT MAX(ranking)
       FROM (
           SELECT
               RANK() OVER (ORDER BY COUNT(*) ASC) AS ranking
           FROM customer_behavior
           GROUP BY item_id
       ) AS r
   );

# top 5 orders
-- top 1 : 440 spent 192.15
WITH customer_behavior AS (
SELECT * 
FROM
orderdetails_data_cleaned o
LEFT JOIN menu_data_cleaned m
ON o.item_id = m.menu_item_id 
)

SELECT 
order_id AS `Order ID`,
Spent 
FROM 
(
	SELECT 
	order_id,
	ROUND(SUM(price),2) AS `Spent`, 
	RANK() OVER(ORDER BY SUM(price) DESC)
	FROM customer_behavior
	GROUP BY order_id
) AS t
LIMIT 5;

# top order analysis 
-- spent more than 170 per order
-- spent most in italian and asian
-- order more than 10 items per orders 
WITH customer_behavior AS (
    SELECT *
    FROM orderdetails_data_cleaned o
    JOIN menu_data_cleaned m
        ON o.item_id = m.menu_item_id
)

SELECT
    order_id,
    category,
    COUNT(*) AS total_items,
    SUM(price) AS total_spent,
    AVG(price) AS avg_price
FROM customer_behavior
GROUP BY order_id, category
ORDER BY total_spent DESC
LIMIT 10;

SELECT
    order_id,
    SUM(price) AS total_spent,
    COUNT(*) AS total_items
FROM customer_behavior
GROUP BY order_id
ORDER BY total_spent DESC
LIMIT 10;