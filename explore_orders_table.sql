USE restaurant_db;

-- View order table

SELECT *
FROM order_details;

-- Find the date range of this table

SELECT 
	MIN(order_date),
    MAX(order_date)
FROM order_details;

-- How many orders were made in this date range?

SELECT 
	COUNT(DISTINCT order_id)
FROM order_details;

-- How many items were ordered in this date range?

SELECT
	COUNT(*)
FROM order_details;

-- Which orders had the most number of items?

SELECT
	order_id,
    COUNT(item_id) AS number_of_items
FROM order_details
GROUP BY order_id
ORDER BY number_of_items DESC;

-- How many orders had more than 12 items
SELECT COUNT(*)
FROM
(SELECT
	order_id,
    COUNT(item_id) AS number_of_items
FROM order_details
GROUP BY order_id
HAVING number_of_items > 12) AS num_orders;


