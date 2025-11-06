-- View menu_items table

SELECT *
FROM menu_items;

-- Find the number of items on the menu

SELECT
	COUNT(*) AS number_of_items
FROM menu_items;

-- Find the least and most expensive items on the menu

SELECT
	item_name,
    price
FROM menu_items
ORDER BY
	price;

SELECT
	item_name,
    price
FROM menu_items
ORDER BY
	price DESC;

-- How many Italian dishes are on the menu?

SELECT
	COUNT(*) AS italian_dishes
FROM menu_items
WHERE category = 'Italian';

-- What are the least and most expensive Italian dishes on the menu?

SELECT
	item_name,
    price
FROM menu_items
WHERE category = 'Italian'
ORDER BY
	price;

SELECT
	item_name,
    price
FROM menu_items
WHERE category = 'Italian'
ORDER BY
	price DESC;

-- How many dishes are in each category? What is the average dish price within each category?

SELECT
	category,
	COUNT(menu_item_id) AS number_of_dishes,
    AVG(price) AS average_price
FROM menu_items
GROUP BY
	category;
    