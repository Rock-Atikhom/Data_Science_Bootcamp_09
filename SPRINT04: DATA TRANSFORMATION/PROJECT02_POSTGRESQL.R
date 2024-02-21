## RPOSTGRESQL
install.packages("RPostgreSQL")
library(RPostgreSQL)
library(tidyverse)


## DBCONNECT
con <- dbConnect(
  PostgreSQL(),
  host = "floppy.db.elephantsql.com",
  dbname = "xbdymyja", 
  user = "xbdymyja",
  password = "AKofmj5d_APXTz7s8R-RrV2ZSTGS4YSN",
  port = 5432
)

## CREATE CUSTOMERS TABLE
customers <- tribble(
  ~customer_id, ~firstname, ~lastname, ~phone, ~email,
  "c1", "Kenzo", "Tenma", "0868478113", "kenzo.te@gmail.com",
  "c2", "Johan", "Liebert", "0943173883", "johan.li@gmail.com",
  "c3", "Nina", "Fortner", "0988346684", "nina.fo@gmail.com", 
  "c4", "Eva", "Heinemann", "0988769113", "eva.he@gmail.com", 
  "c5", "Werner", "Weber", "0868263698", "werner.we@gmail.com"
)


## CREATE MENUS TABLE
menus <- tribble(
  ~mune_id, ~menu_name, ~menu_size, ~price,
  "m1", "Angry Chicken", "Small", 479,
  "m2", "Seafood Cocktail", "Small", 479,
  "m3", "Double Pepperoni", "Small", 479,
  "m4", "Shrimp Cocktail", "Small", 479,
  "m5", "Meat Deluxe", "Small", 479,
  "m6", "Angry Chicken", "Medium", 569,
  "m7", "Seafood Cocktail", "Medium", 569,
  "m8", "Double Pepperoni", "Medium", 569,
  "m9", "Shrimp Cocktail", "Medium", 569,
  "m10", "Meat Deluxe", "Medium", 569,
  "m11", "Angry Chicken", "Large", 689,
  "m12", "Seafood Cocktail", "Large", 689,
  "m13", "Double Pepperoni", "Large", 689,
  "m14", "Shrimp Cocktail", "Large", 689,
  "m15", "Meat Deluxe", "Large", 689
)

## CREATE ORDER TABLE
orders <- tribble(
  ~order_id, ~customer_id, ~menu_id, ~menu_name, ~menu_size, ~quantity, ~shipping, ~order_date,
  1, "c5", "m1", "Angry Chicken", "Medium", 2, FALSE, "2023-11-01",
  2, "c4", "m5", "Meat Deluxe", "Medium", 1, TRUE, "2023-11-02",
  3, "c3", "m4", "Shrimp Cocktail", "Large", 2, TRUE, "2023-11-03",
  4, "c2", "m3", "Double Pepperoni", "Large", 1, FALSE, "2023-11-04",
  5, "c1", "m2", "Seafood Cocktail", "Medium", 3, FALSE,"2023-11-05",
  6, "c1", "m1", "Angry Chicken", "Medium", 3, TRUE, "2023-11-06",
  7, "c2", "m2", "Seafood Cocktail", "Medium", 1, FALSE, "2023-11-08",
  8, "c3", "m4", "Shrimp Cocktail", "Large", 1, TRUE, "2023-11-10",
  9, "c4", "m3", "Double Pepperoni", "Large", 1, TRUE, "2023-11-11",
  10, "c5", "m2", "Seafood Cocktail", "Medium", 3, FALSE, "2023-11-12",
  11, "c4", "m1", "Angry Chicken", "Medium", 2, FALSE, "2023-11-13",
  12, "c2", "m4", "Shrimp Cocktail", "Large", 1, TRUE, "2023-11-14",
  13, "c3", "m3", "Double Pepperoni", "Large", 4, TRUE, "2023-11-16",
  14, "c4", "m5", "Meat Deluxe", "Medium", 3, FALSE, "2023-11-20"
)

tibble(customers)
tibble(menus)
tibble(orders)


## WRITE TABLE TO DATABASE
dbWriteTable(con, "customers", customers)
dbWriteTable(con, "menus", menus)
dbWriteTable(con, "orders", orders)


## GET TABLE FROM DATABASE
dbGetQuery(con, "select * from customers;")
dbGetQuery(con, "select * from menus;")
dbGetQuery(con, "select * from orders;")


## CHECK DATABASE COLUMNS
dbListTables(con)


## CHECK TABLE COLUMNS
dbListFields(con, "customers")
dbListFields(con, "menus")
dbListFields(con, "orders")


## STOP CONECTION TO DATABASE

dbDisconnect(con)
