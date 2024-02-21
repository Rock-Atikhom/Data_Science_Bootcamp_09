## INTALL PACKAGE
install.packages("nycflights13")

## LIBRARY
library(nycflights13)
library(tidyverse)

## TIBBLE
tibble(flights)
tibble(airlines)
tibble(airports)
Vtibble(planes)
tibble(weather)


## PROJECT
## Q1: WHICH AIRLINES EXPERIENCED THE MOST AND LEAST ON-TIME PERFORMANCE IN 2013, BASED ON AVERAGE DEPARTURE DELAY?
## THE LEAST ON-TIME PERFORMANCE IN 2013

most_delay <- flights %>%
  filter(year == 2013, dep_delay > 0) %>%
  group_by(carrier) %>%
  summarise(avg_delay = sum(dep_delay)) %>%
  arrange(desc(avg_delay)) %>%
  left_join(airlines, by = c("carrier" = "carrier")) %>%
  select(carrier, name, avg_delay) %>%
  head(3)

least_delay <- flights %>%
  filter(year == 2013, dep_delay < 0) %>%
  group_by(carrier) %>%
  summarise(avg_delay = sum(dep_delay)) %>%
  arrange(avg_delay) %>%
  left_join(airlines, by = c("carrier" = "carrier")) %>%
  select(carrier, name, avg_delay) %>%
  head(3)

list(most_delay, least_delay)


## PROJECT
## Q2: ## WHICH AIRCRAFT TYPE TEND TO BE DELAYED MORE OFTEN?

delay_df <- flights %>%
  filter(arr_delay > 0) %>%
  group_by(tailnum) %>%
  summarise(avg_arr_delay = sum(arr_delay)) %>%
  arrange(desc(avg_arr_delay)) %>%
  inner_join(planes, by = "tailnum") %>%
  select(tailnum, type, avg_arr_delay, engine) %>%
  head(6)

list(delay_df)


## PROJECT
## Q3: ON WHICH DAY OF THE WEEK WERE THE MOST FLIGHTS DELAYED?

most_delay <- flights %>%
  mutate(flight_date = make_date(year, month, day)) %>%
  mutate(weekday = wday(flight_date, label = T)) %>%
  mutate(month_name = month(flight_date, label = T)) %>%
  filter(dep_delay > 0) %>%
  group_by(weekday) %>%
  summarise(avg_delay = n()) %>%
  arrange(desc(avg_delay)) %>%
  head(1)

list(most_delay)


## PROJECT
## Q4: ## 4. HOW MANY FLIGHTS DEPARTED FROM EACH NEW YORK CITY AIRPORT (JFK, LGA, EWR) IN 2013?

flights_departed <- flights %>%
  filter(origin %in% c("JFK","LGA", "EWR")) %>%
  count(origin)

list(flights_departed)


## PROJECT
## Q5: WHICH AIRLINE HAD THE MOST CANCELLED FLIGHTS IN 2013?

flights %>%
  filter(year == 2013 & is.na(dep_time)) %>%
  group_by(carrier) %>%
  summarise(count = n()) %>%
  arrange(desc(count)) %>%
  inner_join(airlines, by = "carrier") %>%
  select(carrier, name, count) %>%
  head(10)
