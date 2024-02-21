## SQL IN R PROGRAMMING
## INSTALL SQLDF LIBRARY
install.packages("sqldf")

library(sqldf)

sqldf("select * from mtcars
      where hp >= 200;")

sqldf("select avg(hp), max(hp), count(*) from mtcars")


## RSQLITE
install.packages("RSQlite")
library(RSQLite)


## DBCONNECT
con <- dbConnect(SQLite(), "chinook.db")


## DBLISTTABLE
dbListTables(conn)


## DBLISTFIELDS
dbListFields(con, "customers")


## DBGETQUERY
dbGetQuery(con, "select country from customers
           where country = 'USA';")

## CREATE DATAFRAME TO DATABASE
products <- tribble(
  ~id, ~product_name,
  1, "chocolate",
  2, "pineapple",
  3, "samsung galaxy"
)


## WRITE TABLE TO DATABASE
dbWriteTable(con, "products", products)

dbListTables(con)

dbGetQuery(con, "select * from products;")

dbRemoveTable(con, "products")

dbListTables(con)

dbDisconnect(con)


## POSTGRESQL
install.packages("RPostgreSQL")


## LIBRARY

library(RPostgreSQL)
library(tidyverse)
