## SQL CRASH COURSE
## SELECT

SELECT firstname, lastname, country
FROM customers LIMIT 10;

## CASE INSENSITIVE

SELECT 
	firstname, 
    lastname, 
    country,
    email, 
    phone
FROM customers LIMIT 10;

## RENAME 

SELECT 
	firstname, 
    lastname, 
    country ,
    email as user_name, 
    phone as mobile_phone
FROM customers LIMIT 10;

## WHERE

SELECT 
	firstname, 
    lastname, 
    country ,
    email as user_name, 
    phone as mobile_phone
FROM customers
WHERE country = 'USA' AND firstname = 'Tim';

## PATTERN MATCHING 

SELECT 
	firstname, 
    lastname, 
    country ,
    email as user_name, 
    phone as mobile_phone
FROM customers
WHERE user_name like '%@yahoo%';

## AGGREGAGATE FUNCTION 

SELECT 
	SUM(total),
    AVG(total), 
   	MIN(total),
    MAX(total),
    count(total)
from invoices;

## GROUP BY

SELECT 
	billingcountry,
	SUM(total),
    AVG(total), 
   	MIN(total),
    MAX(total),
    count(total)
from invoices
group BY billingcountry;

## ORDER BY

SELECT 
	billingcountry,
	SUM(total),
    AVG(total), 
   	MIN(total),
    MAX(total),
    count(total)
from invoices
group BY billingcountry
ORDER BY sum(total) DESC
limit 5;

## CREATE TABLE

CREATE TABLE top_five_countries AS
  SELECT 
      billingcountry,
      SUM(total),
      AVG(total), 
      MIN(total),
      MAX(total),
      count(total)
  from invoices
  group BY billingcountry
  ORDER BY sum(total) DESC
  limit 5;

## DROP TABLE

DROP TABLE top_five_countries- 

- export data

select * FROM tracks
where name like '%the%';

## IMPORT DATA

SELECT
 	*
 FROM membership;
