USE prints;

/* Problem 1 */
SELECT customer_name, customer_add, customer_city, customer_state, customer_zip FROM customers;

/* Problem 2 */
SELECT customer_name, customer_phone FROM customers WHERE customer_state = 'GA';

/* Problem 3 */
SELECT customer_name, customer_zip FROM customers WHERE customer_state = 'NC' OR customer_state = 'SC';

/* Problem 4 */
SELECT title, Artist, order_date, ship_date FROM items, orderline, orders WHERE items.item_id = orderline.item_id;

/* Problem 5 */
SELECT item_id, title, artist, unit_price, on_hand FROM items ORDER BY Unit_Price;

/* Problem 6 */
SELECT item_id, title, artist, unit_price, on_hand FROM items WHERE Unit_Price > 100.00;

/* Problem 7 */
SELECT item_id, title, artist, unit_price, on_hand FROM items WHERE on_hand > 300;

/* Problem 8 */
SELECT title, Unit_Price, Unit_Price * 2 AS retail_Price FROM items;

/* Problem 9 */
SELECT customer_name, customer_phone FROM customers INNER JOIN orders ON customers.customer_id = orders.customer_id  WHERE order_date LIKE "2014%" ;

/* Problem 10 */
SELECT artist, order_qty, orderline.item_id FROM items INNER JOIN orderline ON items.item_id = orderline.item_id;

/* Problem 11 */
SELECT Title FROM items WHERE Unit_Price BETWEEN 40.00 AND 100.00;

/* Problem 12 */
SELECT customer_name, Title, artist, SUM(orderline.order_qty) AS quantity
FROM customers, orders, orderline, items
WHERE customers.customer_id = orders.customer_id AND orders.order_id = orderline.order_id AND orderline.item_id = items.item_id
GROUP BY orders.customer_id;

/* Problem 13 */
SELECT customer_name, SUM((unit_price * 2) * order_qty) AS revenue
FROM customers, items, orders, orderline
WHERE customers.customer_id = orders.customer_id AND orders.order_id = orderline.order_id AND orderline.item_id = items.item_id
GROUP BY orders.customer_id;

/* Problem 14 */
SELECT DISTINCT customer_state, COUNT(*) AS num_customers FROM customers GROUP BY customer_state;