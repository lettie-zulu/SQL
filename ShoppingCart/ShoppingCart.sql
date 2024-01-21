CREATE TABLE product_menu (
    id bigserial,
    name varchar(10),
    price integer,
    CONSTRAINT product_key PRIMARY KEY (id)
);

INSERT INTO product_menu (name, price)
VALUES
('Coke', 10),
('Chips', 5);

CREATE TABLE users (
    id bigserial,
    name varchar(10),
    CONSTRAINT user_key PRIMARY KEY (id)
);

INSERT INTO users (name)
VALUES
('Lettie'),
('Tyeishia');

CREATE TABLE cart (
    product_id integer REFERENCES product_menu (id),
    qty integer
);

INSERT INTO cart (product_id, qty)
VALUES (1, 1),
(2, 1); 

--adding coke to cart (increasing qty by 1)
UPDATE cart  
SET qty = add_product(qty)
WHERE product_id = 1;
--adding chips to cart (increasing qty by 1)
UPDATE cart  
SET qty = add_product(qty)
WHERE product_id = 2;
--removing coke to cart (decreasing qty by 1)
UPDATE cart  
SET qty = remove_product(qty)
WHERE product_id = 1;
--removing chips to cart (decreasing qty by 1)
UPDATE cart  
SET qty = remove_product(qty)
WHERE product_id = 2;

CREATE TABLE order_header (
    order_id bigserial,
    user_id integer REFERENCES users (id),
    order_date timestamp,
    CONSTRAINT header_key PRIMARY KEY (order_id)
);

INSERT INTO order_header (user_id, order_date)
VALUES (1, now()),
(2, now()); 

--copying shopping cart into order_details
CREATE TABLE order_details AS
SELECT * FROM cart;

ALTER TABLE order_details ADD COLUMN order_header integer REFERENCES order_header (order_id);

UPDATE order_details 
SET order_header = 1
WHERE order_header IS NULL;
--insering the second order values
INSERT INTO order_details(product_id, qty, order_header)
VALUES (1, 3, 2),
(2, 4, 2);

--order header must exist 
ALTER TABLE order_details ADD CONSTRAINT order_id_exists CHECK (order_header IS NOT NULL);

--function to add 1 to the qty
CREATE OR REPLACE FUNCTION
add_product( old_qty integer )
RETURNS integer AS
'SELECT 
    old_qty + 1
;'
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

--function to delete 1 from qty
CREATE OR REPLACE FUNCTION
remove_product( old_qty integer )
RETURNS integer AS
'SELECT 
    old_qty - 1
;'
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

--removing item from cart completely once qty is equal to 0
DELETE FROM cart
WHERE qty = 0;

--printing a first order
SELECT pro.name AS product,
pro.price AS price,
ord.qty AS quantity,
round(ord.qty * pro.price::numeric, 2) AS total_price
FROM product_menu pro INNER JOIN order_details ord
ON pro.id = ord.product_id
WHERE ord.order_header = 1;

--printing a second order
SELECT pro.name AS product,
pro.price AS price,
ord.qty AS quantity,
round(ord.qty * pro.price::numeric, 2) AS total_price
FROM product_menu pro INNER JOIN order_details ord
ON pro.id = ord.product_id
WHERE ord.order_header = 2;