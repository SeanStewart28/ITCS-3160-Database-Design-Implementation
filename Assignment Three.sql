USE prints;

/* Problem 1 */
CREATE VIEW Under_100 AS 
SELECT items.item_id, title, artist, unit_price, order_qty 
FROM items, orderline WHERE items.item_id = orderline.item_id 
AND  unit_price < 100;

/* Problem 2 */
CREATE VIEW Allen AS 
SELECT customers.customer_id, customer_name, customer_phone, title, artist
FROM customers, items, orderline, orders WHERE customers.customer_id = orders.customer_id
AND orders.order_id = orderline.order_id
AND orderline.item_id = items.item_id;

/* Problem 3 */
CREATE VIEW orders_view AS
SELECT orderline.item_id, title, artist, unit_price, order_qty
FROM items, orderline, orders WHERE items.item_id = orderline.item_id
AND orderline.order_id = orders.order_id
AND order_date BETWEEN '2014-01-01' AND '2014-02-28';

/* Problem 4 */
CREATE VIEW zip_27 AS
SELECT customer_name, customer_phone, title, artist, ship_date
FROM customers, items, orders, orderline WHERE customers.customer_id = orders.customer_id
AND orders.order_id = orderline.order_id
AND orderline.item_id = items.item_id
AND customer_zip LIKE '27%';

/* Problem 5 */
CREATE INDEX customer_id
ON customers (customer_id);
CREATE INDEX name
ON customers (customer_name);
CREATE INDEX shipped
ON orders (customer_id , ship_date);

/* Problem 6 */
DROP INDEX name ON customers;

/* Problem 7 */
ALTER TABLE items
ADD CHECK (unit_price > 35.00);

/* Problem 8 */
ALTER TABLE orders ADD FOREIGN KEY (customer_id) REFERENCES customers(customer_id);
ALTER TABLE orderline ADD FOREIGN KEY (item_id) REFERENCES items(item_id);

/* Problem 9 */
ALTER TABLE items
ADD TYPE CHARACTER(1);

/* Problem 10 */
UPDATE items
SET TYPE ='M' WHERE title = 'Skies Above';

/* Problem 11 */
ALTER TABLE items 
MODIFY COLUMN artist CHARACTER(30);

/* Problem 12 */
DROP TABLE orders;