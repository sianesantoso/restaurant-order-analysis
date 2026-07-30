# use database
USE restaurant_order;

# number of items on the menu 
-- 32 items in on the menu
SELECT DISTINCT COUNT(*) AS `Total Menu` FROM menu_data_cleaned;

# most expensive & cheapest items
-- cheapest (113, Edamame, Asian, 5)
-- most expensive (130, Shrimp Scampi, Italian 19.95)
SELECT * 
FROM menu_data_cleaned
WHERE  
	price = (SELECT MAX(price) FROM menu_data_cleaned) OR 
    price = (SELECT MIN(price) FROM menu_data_cleaned)
ORDER BY price ASC;

# how many category on the menu 
# 4 category (Anerican, Asian, Mexican, Italian)
SELECT category AS `Category`
FROM menu_data_cleaned
GROUP BY category;

# American category has 6 total menu
# Average Price 10.07
# the most expensive is Cheeseburger 13.95
# the cheapest is Mac & Cheese 7
SELECT 
    COUNT(*) AS `Total Menu`,
    ROUND(AVG(price),2) AS `Average Price`,
    (
        SELECT item_name
        FROM menu_data_cleaned
        WHERE category = 'American'
        ORDER BY price DESC
        LIMIT 1
    ) AS `Most Expensive Menu`,
    (
        SELECT MAX(price)
        FROM menu_data_cleaned
        WHERE category = 'American'
    ) AS `Highest Price`,
    (
        SELECT item_name
        FROM menu_data_cleaned
        WHERE category = 'American'
        ORDER BY price ASC
        LIMIT 1
    ) AS `Cheapest Menu`,
    (
        SELECT MIN(price)
        FROM menu_data_cleaned
        WHERE category = 'American'
    ) AS `Lowest Price`
FROM menu_data_cleaned
WHERE category = 'American';

# Asian category has 8 total menu
# Average Price 13.48
# the most expensive is Korean Beef Bowl 17.95
# the cheapest is Edamame 5
SELECT 
    COUNT(*) AS `Total Menu`,
    ROUND(AVG(price),2) AS `Average Price`,
    (
        SELECT item_name
        FROM menu_data_cleaned
        WHERE category = 'Asian'
        ORDER BY price DESC
        LIMIT 1
    ) AS `Most Expensive Menu`,
    (
        SELECT MAX(price)
        FROM menu_data_cleaned
        WHERE category = 'Asian'
    ) AS `Highest Price`,
    (
        SELECT item_name
        FROM menu_data_cleaned
        WHERE category = 'Asian'
        ORDER BY price ASC
        LIMIT 1
    ) AS `Cheapest Menu`,
    (
        SELECT MIN(price)
        FROM menu_data_cleaned
        WHERE category = 'Asian'
    ) AS `Lowest Price`
FROM menu_data_cleaned
WHERE category = 'Asian';

# Mexican category has 9 total menu
# Average Price 11.8
# the most expensive is Steak Burrito 14.95
# the cheapest is Chips & Salsa 7
SELECT 
    COUNT(*) AS `Total Menu`,
    ROUND(AVG(price),2) AS `Average Price`,
    (
        SELECT item_name
        FROM menu_data_cleaned
        WHERE category = 'Mexican'
        ORDER BY price DESC
        LIMIT 1
    ) AS `Most Expensive Menu`,
    (
        SELECT MAX(price)
        FROM menu_data_cleaned
        WHERE category = 'Mexican'
    ) AS `Highest Price`,
    (
        SELECT item_name
        FROM menu_data_cleaned
        WHERE category = 'Mexican'
        ORDER BY price ASC
        LIMIT 1
    ) AS `Cheapest Menu`,
    (
        SELECT MIN(price)
        FROM menu_data_cleaned
        WHERE category = 'Mexican'
    ) AS `Lowest Price`
FROM menu_data_cleaned
WHERE category = 'Mexican';


# Italian category has 9 total menu
# Average Price 16.75
# the most expensive is shrimp scampi 19.95
# the cheapest is spaghetti 14.5
SELECT
    COUNT(*) AS `Total Menu`,
    AVG(price) AS `Average Price`,
    (
        SELECT item_name
        FROM menu_data_cleaned
        WHERE category = 'Italian'
        ORDER BY price DESC
        LIMIT 1
    ) AS `Most Expensive Menu`,
    (
        SELECT MAX(price)
        FROM menu_data_cleaned
        WHERE category = 'Italian'
    ) AS `Highest Price`,
    (
        SELECT item_name
        FROM menu_data_cleaned
        WHERE category = 'Italian'
        ORDER BY price ASC
        LIMIT 1
    ) AS `Cheapest Menu`,
    (
        SELECT MIN(price)
        FROM menu_data_cleaned
        WHERE category = 'Italian'
    ) AS `Lowest Price`
FROM menu_data_cleaned
WHERE category = 'Italian';
