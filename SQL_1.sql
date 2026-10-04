CREATE DATABASE ecommerce;
use ecommerce;
CREATE TABLE customer(
    customer_id INT PRIMARY KEY,
    customer_name varchar(50),
    city varchar(20),
    email varchar(50),
    phone int(10)
);
ALTER TABLE customer
ADD state VARCHAR(20);
SELECT * FROM customer;
INSERT INTO customer(customer_id, customer_name, city, email, phone,state)
VALUES
(1,'sai','kadapa','sainath@gmail.com',79797979,'Ap'),
(2,'kal','hyderabad','kalyan@gmail.com',868688686,"Telengana"),
(3,'thri','adoni','thrived@gmail.com',867586575,'Ap'),
(4,'nanda','kadapa','nanda@gmail.com',939399393,'Ap'),
(5,'yash','kadapa','yash@gmail.com',878787787,'Ap'),
(6,'leela','puri','leela@gmail.com',765767655,'Odisha'),
(7,'anand','banaganpally','anand@gmail.com',993232313,'Ap'),
(8,'aravind','punganur','aravind@gmail.com',823823282,'Ap'),
(9,'chenna','kadapa','chenna@gmail.com',934334393,'Ap'),
(10,'sumith','nandyal','sumi@gmail.com',989982323,'Ap'),
(11,'mahesh','Anantapur','mahesh@gmail.com',989876565,'Ap'),
(12,'ravi','Ongole','ravi@gmail.com',987659875,'Ap'),
(13,'nikhil','nellore','nikhilgmail.com',987987655,'Ap'),
(14,'sai krishna','kadapa','saikrishna@gmail.com',876487654,'Ap'),
(15,'sadwik','Banaganpally','sadwik@gmail.com',987982143,'Ap');

SELECT *FROM customer;

SELECT * FROM customer
WHERE state = 'Ap';

SELECT customer_name FROM customer;

SELECT * FROM customer
WHERE state = 'Ap' 
AND city = 'kadapa';

SELECT * FROM customer 
WHERE state = 'Telengana' OR state = 'Karnataka';

SELECT * FROM customer
WHERE customer_id BETWEEN 5 AND 10;

SELECT * FROM customer
WHERE customer_name LIKE 'S%';

SELECT * FROM customer
WHERE city LIKE 'Kadapa';

SELECT DISTINCT city FROM customer;


CREATE TABLE PRODUCT(
    product_id int PRIMARY KEY,
    name varchar(50),
    category varchar(50),
    price DECIMAL(10,0),
    stock int(50)
);
ALTER TABLE PRODUCT
MODIFY PRICE DECIMAL(10,2);

SELECT * FROM PRODUCT;
INSERT INTO PRODUCT(product_id,name,category, price ,stock)VALUES
(101,'LAPTOP','ELECTRONIC',59999.99,200),
(102,'BAGS','SHOPPING',500.00,40),
(103,'MOBLIE','ELECTRONICS',25000,100),
(104,'AIRPODS','ACCESSORIES',30000.00,70),
(105,'SHIRTS','SHOPPING',1999.99,200),
(106,'SHOES','SHOPPING',6000.00,100),
(107,'PENS','STATIONARY',5.99,150),
(108,'AIR CONDITIONER','ELECTRONICS',25000.99,40),
(109,'TELIVISION','ELECTRONICS',20599.99,30),
(110,'PANTS','SHOPPING',1599.89,100),
(111,'BOOKS','STATIONARY',300.00,50),
(112,'BISCUITS','FOOD',100.00,200),
(113,'WATCHES','ACCESSORIES',10000.00,30),
(114,'TOYS','PLAYING',500.00,123),
(115,'RACKETS','SPORTS',2599.99,20);

SELECT * FROM PRODUCT;

SELECT * FROM PRODUCT
WHERE PRICE BETWEEN 10000.00 AND 25000.00;

SELECT * FROM PRODUCT;

SELECT * FROM PRODUCT
WHERE category IN('ELECTRONICS');

SELECT * FROM PRODUCT
WHERE CATEGORY LIKE('SHOPPING');

SELECT * FROM PRODUCT
WHERE PRICE = 500.00 AND name = 'BAGS' ;

select * from product
ORDER BY PRICE ASC;

SELECT * FROM PRODUCT 
ORDER BY PRICE DESC;

SELECT * FROM PRODUCT
WHERE PRICE = (SELECT MIN(PRICE) FROM PRODUCT);

SELECT * FROM PRODUCT
WHERE PRICE = (SELECT MAX(PRICE) FROM PRODUCT);

SELECT SUM(PRICE) AS TOTAL_SUM FROM PRODUCT;

SELECT AVG(PRICE) AS AVERAGE_SUM FROM PRODUCT;

SELECT * FROM PRODUCT 
ORDER BY PRICE ASC LIMIT 1;

SELECT * FROM PRODUCT
ORDER BY PRICE DESC LIMIT 1;

SELECT * FROM PRODUCT
ORDER BY PRICE DESC LIMIT 5;


CREATE TABLE ORDERS(
    ORDER_ID INT PRIMARY KEY,
    CUSTOMER_ID INT,
    ORDER_DATE DATE,
    ORDER_STATUS VARCHAR(50),
    FOREIGN KEY(CUSTOMER_ID) REFERENCES customer (customer_id)
);
select * from ORDERS;
INSERT INTO ORDERS(ORDER_ID,CUSTOMER_ID,ORDER_DATE,ORDER_STATUS)
VALUES
(101, 1, '2026-03-01', 'Delivered'),
(102, 2, '2026-09-02', 'Pending'),
(103, 3, '2026-04-03', 'Shipped'),
(104, 4, '2026-09-04', 'Delivered'),
(105, 5, '2026-09-05', 'Cancelled'),
(106, 6, '2026-05-06', 'Pending'),
(107, 7, '2026-09-07', 'Shipped'),
(108, 8, '2026-09-08', 'Delivered'),
(109, 9, '2026-05-09', 'Pending'),
(110, 10, '2026-09-10', 'Delivered'),
(111, 11, '2026-09-11', 'Shipped'),
(112, 12, '2026-09-12', 'Cancelled'),
(113, 13, '2026-04-13', 'Pending'),
(114, 14, '2026-09-14', 'Delivered'),
(115, 15, '2026-04-15', 'Shipped');

SELECT * FROM ORDERS;

SELECT * FROM ORDERS
WHERE ORDER_STATUS = 'cancelled';

SELECT * FROM ORDERS
WHERE ORDER_STATUS = 'Delivered';

SELECT * FROM ORDERS
WHERE ORDER_DATE BETWEEN '2026-09-04'
 AND '2026-09-12';

CREATE TABLE ORDER_ITEMS(
    ORDER_ITEM_ID INT PRIMARY KEY,
    ORDER_ID INT,
    PRODUCT_ID INT,
    QUANTITY INT,
    FOREIGN KEY(ORDER_ID) REFERENCES ORDERS(ORDER_ID),
    FOREIGN KEY(PRODUCT_ID) REFERENCES PRODUCT(product_id)
);
SELECT * FROM ORDER_ITEMS;
INSERT INTO ORDER_ITEMS(ORDER_ITEM_ID,ORDER_ID,PRODUCT_ID,QUANTITY) VALUES
(1001,101,101,4),
(1002,102,102,3),
(1003,103,103,2),
(1004,104,104,4),
(1005,105,105,6),
(1006,106,106,6),
(1007,107,107,7),
(1008,108,108,2),
(1009,109,109,9),
(1010,110,110,10),
(1011,111,111,2),
(1012,112,112,8),
(1013,113,113,4),
(1014,114,114,6),
(1015,115,115,7);

SELECT * FROM ORDER_ITEMS;

CREATE TABLE payment(
    order_id INT,
    payment_method VARCHAR(100),
    payment_amount DECIMAL(10,2),
    payment_status VARCHAR(200),
    FOREIGN KEY(order_id) REFERENCES orders(order_id)


);
ALTER TABLE payment
ADD payment_id int ;
SELECT * FROM payment;


INSERT INTO payment
(order_id, payment_method, payment_amount, payment_status)
VALUES
(101, 'UPI', 150000.90, 'Completed',101),
(102, 'Credit Card', 25500.54, 'Pending',102),
(103, 'Debit Card', 6500.00, 'Completed',103),
(104, 'Cash', 39000.99, 'Completed',104),
(105, 'UPI', 10000.54, 'Failed',105),
(106, 'Net Banking', 9000.00, 'Completed',106),
(107, 'Credit Card', 999.99, 'Completed',107),
(108, 'UPI', 25500.54, 'Completed',108),
(109, 'Cash', 865.95, 'Pending',109),
(110, 'Debit Card', 5999.98, 'Completed',110),
(111, 'UPI', 2999.94, 'Completed',111),
(112, 'Credit Card', 3002.97, 'Refunded',112),
(113, 'Net Banking', 5199.96, 'Pending',113),
(114, 'UPI', 11999.96, 'Completed',114),
(115, 'Debit Card', 2899.87, 'Failed',115);


SELECT * FROM payment;

DROP TABLE payment;

CREATE TABLE payment (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_method VARCHAR(100),
    payment_amount DECIMAL(10,2),
    payment_status VARCHAR(200),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

SELECT * FROM payment;
INSERT INTO payment(payment_id,order_id,payment_method,payment_amount,payment_status)VALUES
(10001,101,'UPI',140000,'COMPLEATED'),
(10002,102,'CREDIT CARD',120000,'PENDING'),
(10003,103,'DEBITCARD',20000,'COMPLEATED'),
(10004,104,'CASH',20000,'CANCELLED'),
(10005,105,'UPI',30000,'COMPLEATED'),
(10006,106,'NET BANKING',50000,'PENDING'),
(10007,107,'CASH',20000,'PENDING'),
(10008,108,'UPI',40000,'COMPLEATED'),
(10009,109,'DEBIT CARD',20000,'COMPLEATED'),
(10010,110,'CASH',50000,'COMPLEATED');
USE ecommerce;
SELECT * FROM payment;


SELECT *
FROM customer AS c
JOIN orders AS o
ON c.customer_id = o.customer_id;

SELECT *
FROM CUSTOMER AS c
JOIN ORDERS AS o
ON c.customer_id = o.customer_id;


