-- Combine menu_items and order_details into single table

CREATE TABLE orders_complete AS
SELECT *
FROM order_details
	LEFT JOIN menu_items
		ON order_details.item_id = menu_items.menu_item_id;
        
SELECT *
FROM orders_complete;

-- What were the least and most ordered items? What categories were they in?

SELECT
	item_name,
    COUNT(order_details_id) AS num_orders,
    category
FROM orders_complete
GROUP BY item_name, category
ORDER BY num_orders;

SELECT
	item_name,
    COUNT(order_details_id) AS num_orders,
    category
FROM orders_complete
GROUP BY item_name, category
ORDER BY num_orders DESC;

-- What were the top 5 orders that spent the most money?

SELECT
	order_id,
    SUM(price) AS total_spent
FROM orders_complete
GROUP BY order_id
ORDER BY total_spent DESC
LIMIT 5;

-- View the details of the highest spend order. Which specific items were purchased?

SELECT
	order_id,
    item_name,
    category,
    price
FROM orders_complete
WHERE order_id = 440;

-- View the details of the top 5 highest spend orders
SELECT
	order_id,
    item_name,
    category,
    price
FROM orders_complete
WHERE order_id IN (440,2075,1957,330,2675);

SELECT
	order_id, category, COUNT(item_id) AS num_items
FROM orders_complete
WHERE order_id IN (440,2075,1957,330,2675)
GROUP BY order_id, category;

-- How much was the most expensive order in the dataset?

SELECT
	order_id,
    SUM(price) AS total_spent
FROM orders_complete
GROUP BY order_id
ORDER BY total_spent DESC
LIMIT 1;
