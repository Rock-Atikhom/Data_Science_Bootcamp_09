/* PROJECT
CREATE AT LEAST 3 TABLES
-- CUSTOMERS
-- ORDERS 
-- MENU (PIZZA)

THREE SQL QUERIES
-- JOIN
-- SUBQUERIES OR WITH
-- AGGREGATE FUNCTIONS
 PROJECT */

-- TABLE 01 (CUSTOMERS)

CREATE TABLE customers (
  customerId INT UNIQUE,
  firstname TEXT,
  lastname TEXT,
  phone VARCHAR,
  email TEXT
);

INSERT INTO customers VALUES
  (1,'Kenzo','Tenma','0868478113','kenzo.te@gmail.com'),
  (2,'Johan','Liebert','0943173883','johan.li@gmail.com'),
  (3,'Nina','Fortner','0988346684','nina.fo@gmail.com'),
  (4,'Eva','Heinemann','0988769113','eva.he@gmail.com'),
  (5,'Werner','Weber','0868263698','werner.we@gmail.com');

.mode box
SELECT
  customerId,
  firstname,
  lastname,
  firstname || ' ' || lastname AS fullname,
  phone,
  email
FROM customers;

-- TABLE 02 (MENUS)

CREATE TABLE menus (
  menuId INT UNIQUE,
  menuName VARCHAR(10),
  menu_size VARCHAR(10),
  promotion VARCHAR,
  price REAL
);

INSERT INTO menus VALUES
  (1,'Angry Chicken','Medium','Special Deals',479),
  (2,'Seafood Cocktail','Medium','Special Deals',539),
  (3,'Double Pepperoni','Large','Value Set',569),
  (4,'Shrimp Cocktail','Large','value Set',689),
  (5,'Meat Deluxe','Medium','Special Deals',479);

.mode box
SELECT * FROM menus;

-- TABLE 03 (ORDERS)

CREATE TABLE orders (
  orderId INT UNIQUE,
  customerId INT,
  menuId INT,
  menuName VARCHAR(10),
  menu_size VARCHAR(10),
  quantity INT,
  shipping BOOLEAN,
  orderDate date
);

INSERT INTO orders VALUES 
  (1,5,1,'Angry Chicken','Medium',2,FALSE,'2023-11-01'),
  (2,4,5,'Meat Deluxe','Medium',1,TRUE,'2023-11-02'),
  (3,3,4,'Shrimp Cocktail','Large',2,TRUE,'2023-11-03'),
  (4,2,3,'Double Pepperoni','Large',1,FALSE,'2023-11-04'),
  (5,1,2,'Seafood Cocktail','Medium',3,FALSE,'2023-11-05'),
  (6,1,1,'Angry Chicken','Medium',3,TRUE,'2023-11-06'),
  (7,2,2,'Seafood Cocktail','Medium',1,FALSE,'2023-11-08'),
  (8,3,4,'Shrimp Cocktail','Large',1,TRUE,'2023-11-10'),
  (9,4,3,'Double Pepperoni','Large',1,TRUE,'2023-11-11'),
  (10,5,2,'Seafood Cocktail','Medium',3,FALSE,'2023-11-12'),
  (11,4,1,'Angry Chicken','Medium',2,FALSE,'2023-11-13'),
  (12,2,4,'Shrimp Cocktail','Large',1,TRUE,'2023-11-14'),
  (13,3,3,'Double Pepperoni','Large',4,TRUE,'2023-11-16'),
  (14,4,5,'Meat Deluxe','Medium',3,FALSE,'2023-11-20');

.mode box
SELECT * FROM orders;

-- JOIN FUNCTION

SELECT 
  o.orderId,
  c.firstname || ' ' || c.lastname AS fullname,
  m.menuId,
  m.menuName,
  m.price,
  CASE 
    WHEN o.shipping = 0 THEN 'Pick-up'
    WHEN o.shipping = 1 THEN 'Delivery'
  END as shipping,
  o.orderdate
FROM menus AS m 
JOIN orders AS o
  ON m.menuId = o.menuId
JOIN customers AS c
  ON o.customerId = c.customerId;

-- WITH FUNCTION

WITH all_menu AS (
  SELECT
    m1.menuId,
    m1.menuName,
    m1.promotion,
    m1.price
  FROM menus AS m1 
), all_procedure AS (
  SELECT
    o2.orderId,
    o2.menuId,
    CAST(STRFTIME('%Y',o2.orderDate) AS INT) AS order_year,
    CAST(STRFTIME('%m',o2.orderDate) AS INT) AS order_month,
    CAST(STRFTIME('%d',o2.orderDate) AS INT) AS order_day,
    
    STRFTIME('%Y-%m',o2.orderDate) AS year_month
  FROM orders AS o2
  ORDER BY 3
), all_customer AS (
  SELECT 
    customerId,
    firstname || ' ' || lastname AS fullname,
    phone
)

SELECT
  orderId,
  menuName,
  promotion,
  COUNT(orderId) AS COUNT_unite,
  AVG(price) AS AVG_price,
  SUM(price) AS SUM_price,
  MIN(price) AS MIN_price,
  MAX(price) AS MAX_price
FROM (
  SELECT
  orderId,
  menuName,
  promotion,
  price,
  year_month,
  order_day,
  price
FROM all_menu AS a1, all_procedure AS a2
WHERE a1.menuId = a2.menuId
)
GROUP BY 1, 2, 3
ORDER BY 1, 3 DESC, 4 DESC, 5 DESC, 6 DESC, 7, 8 DESC;


SELECT
  COUNT(orderId) AS total_COUNT,
  SUM(price) AS total_SUM,
  ROUND(AVG(price),2) AS total_AVG,
  ROUND(SUM(price)/ 14,2) AS total_median,
  MAX(price) AS total_MAX,
  MIN(price) AS total_MIN
FROM (
  SELECT * FROM orders AS o
  JOIN menus AS m
  ON o.menuId = m.menuId
);


SELECT
  orderId,
  menuName,
  firstname || ' ' || lastname AS fullname,
  phone,
  CASE 
    WHEN shipping = 0 THEN 'Pick-up'
    WHEN shipping = 1 THEN 'Delivery'
  END as shipping,
  CASE
    WHEN shipping = 1 THEN (1+0.01) * SUM(Price)
    WHEN shipping = 0 THEN SUM(price)
  END AS 'shipping cost (1%)',
  orderDate
FROM (
  SELECT * 
    FROM customers AS c
  JOIN orders AS o
    ON c.customerId = o.customerId
  JOIN menus AS m
    ON o.menuId = m.menuid
)
GROUP BY 1;


SELECT
  COUNT(orderId)  AS total,
  SUM(shipping_cost) AS total_SUM,
  ROUND(AVG(shipping_cost),2) AS total_AVG,
  ROUND(SUM(shipping_cost)/14,2) AS total_MEDIAN,
  MAX(shipping_cost) AS total_MAX,
  MIN(shipping_cost) AS total_MIN
FROM (
SELECT
  orderId,
  menuName,
  firstname || ' ' || lastname AS fullname,
  phone,
  CASE 
    WHEN shipping = 0 THEN 'Pick-up'
    WHEN shipping = 1 THEN 'Delivery'
  END as shipping,
  CASE
    WHEN shipping = 1 THEN (1+0.01) * SUM(Price)
    WHEN shipping = 0 THEN SUM(price)
  END AS shipping_cost,
  orderDate
FROM (
  SELECT * 
    FROM customers AS c
  JOIN orders AS o
    ON c.customerId = o.customerId
  JOIN menus AS m
    ON o.menuId = m.menuid
)
GROUP BY 1
);
