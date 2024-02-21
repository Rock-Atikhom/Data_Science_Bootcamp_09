## INSTALL PACKAGES
install.packages("dplyr")


## LOAD PACKAGES
library(dplyr)


## READ CSV FILE INTO R STUDIO
imdb <-read.csv("imdb.csv", stringsAsFactors = F)


## REVIEW DATA STRUCTURE
glimpse(imdb)


## PRINT HEAD AND TAIL OF DATA
head(imdb)

tail(imdb)


## SELECT COLUMNS
head(imdb)
names(imdb)

select(imdb,MOVIE_NAME, RATING)
select(imdb, 1, 5)


## SELECT COLUMNS (RENAME)
select(imdb, movie_name = MOVIE_NAME, released_year = YEAR)


## PIPE OPERATOR (RENAME)
imdb %>% 
  select(movie_name = MOVIE_NAME, released_year = YEAR) %>%
  head(10)


## FILTER DATA
names(imdb) <- tolower(names(imdb))

filter(imdb, score >= 9.0)
imdb %>% filter(score >= 9.0)

imdb %>%
  select(movie_name, year, score) %>% 
  filter (score >= 9)

imdb %>%
  select(movie_name, year, score) %>% 
  filter (score >= 9 & year > 2000)

imdb %>%
  select(movie_name, length, score) %>%
  filter(score == 8.8)


## OR OPERATOR
imdb %>%
  select(movie_name, length, score) %>%
  filter(score == 8.8 | score == 8.3 | score == 9.0)

imdb %>%
  select(movie_name, length, score) %>% 
  filter(score %in% c(8.3, 8.8, 9.0))


## FILTER STRING COLUMNS
imdb %>% 
  select(movie_name, genre, rating) %>%
  filter(rating == "R")

imdb %>% 
  select(movie_name, genre, rating) %>%
  filter(rating == "PG-13")


## FILTER STRING COLUMNS
imdb %>% 
  select(movie_name, genre, rating) %>%
  filter(genre == "Drama")


## FILTER STRING COLUMNS
imdb %>% 
  select(genre) %>%
  filter(grepl("Drama", imdb$genre))


## FILTER STRING COLUMNS
imdb %>%
  select(movie_name) %>%
  filter(grepl("The", imdb$movie_name))

imdb %>%
  select(movie_name) %>%
  filter(grepl("the", imdb$movie_name))


## CREATE NEW COLUMNS
imdb %>%
  select(score, length) %>%
  mutate(score_group = if_else(score >= 9, "High Rating", "Low Rating"),
         length_group = if_else(length >= 120, "Long Flim", "Short Flim"))

imdb %>%
  select(score) %>%
  mutate(score_update = score + 0.1) %>%
  head(10)

imdb %>%
  select(score) %>%
  mutate(score = score + 0.1) %>%
  head(10)

## ARRANGE
head(imdb)

imdb %>%
  select(length) %>%
  arrange(length) %>%
  head(10)

imdb %>%
  select(length) %>%
  arrange(desc(length)) %>%
  head(10)


imdb %>%
  select(rating, length) %>%
  arrange(rating, desc(length)) %>%
  head(10)


## SUMMARY STATISTICS AND GROUP BY
imdb %>%
  filter(rating != "") %>%
  group_by(rating) %>%
  summarise(mean_length = mean(length),
            sum_length = sum(length),
            sd_length = sd(length),
            min_length = min(length),
            max_length = max(length),
            n = n())
            

## JOIN TABLE
favorite_films <- data.frame(id = c(5, 10, 25, 30, 98))


## JOIN TABLE
favorite_films %>%
  inner_join(imdb, by = c("id" = "no"))


## WRITE CSV FILE (EXPORT RESULT)
imdb_prep <- imdb %>%
  select(movie_name, release_year = year, rating, length, score) %>%
  filter(rating == "R" & release_year > 2000)


## EXPORT CSV FILE
write.csv(imdb_prep, "imdb_prep.csv", row.names = F)
