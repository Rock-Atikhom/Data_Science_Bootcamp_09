## INSTALL PACKAGES

install.packages(c("readr",
                   "readxl",
                   "googlesheets4",
                   "jsonlite",
                   "dplyr",
                   "sqldf",
                   "RSQLite"
)
)


## LOAD LIBRARY

library(readr)
library(readxl)
library(googlesheets4)
library(jsonlite)
library(dplyr)
library(sqldf)
library(RSQLite)

setwd("new path")


## EXCEL FILE

result <- list()

for(i in 1:3) {
  result[[i]] <- read_excel("students.xlsx", sheet = i)
}


## BIND ROWS

library(readxl)
library(dplyr)

econ <- read_excel("students.xlsx", sheet = 1)
business <- read_excel("students.xlsx", sheet = 2)
data <- read_excel("students.xlsx", sheet = 3)


list_df <- list(econ,business,data)

bind_rows(list_df)


## BIND COLUMN

df1 <- data.frame(
  id = 1:5,
  name = c("John", "Marry", "Anna",
           "David", "Lisa")
)

df2 <- data.frame(
  id = 1:5,
  city = c(rep("BKK", 3), rep("LONDON", 2)),
  country = c(rep("TH", 3), rep("UK",2))
)


## LEFT JOIN

df1 <- data.frame(
  id = 1:5,
  name = c("John", "Marry", "Anna",
           "David", "Lisa")
)

df2 <- data.frame(
  id = 1:5,
  city = c(rep("BKK", 3), rep("LONDON", 2)),
  country = c(rep("TH", 3), rep("UK",2))
)


## SQL

library(sqldf)
library(readr)

school <- read_csv("school.csv")


query <- sqldf("SELECT 
                  sum(student), 
                  avg(student)
                FROM school;")

sql_query <- sqldf("SELECT
                      school_id,
                      school_name,
                      country
                    FROM school;")

filter_country <- sqldf("SELECT * FROM school
                        where country = 'USA';")


## SQLITE

library(RSQLite)

## CONNECT TO SQLITE DATABASE (.DB FILE)
## 1. OPEN CONNECTION
conn <- dbConnect(SQLite(), "chinook.db")


## 2. GET DATA
dbListTables(conn)
dbListFields(conn, "customers")

df <- dbGetQuery(conn, "SELECT * FROM customers
                  WHERE country = 'USA'")

## 3. CLOSE CONNECTION
dbDisconnect(conn)
