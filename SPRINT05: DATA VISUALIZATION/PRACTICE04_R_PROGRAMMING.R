## LIBRARY
library(ggplot2)
library(tidyverse)


## FIRST PLOT
ggplot(data = mtcars, mapping = aes(x = hp, y = mpg)) +
        geom_point() +
        geom_smooth() +
        geom_rug()


## WITHOUT ARGUMENT NAME
ggplot(mtcars, aes(x = hp, y = mpg)) +
  geom_point(size = 3, col = "red", alpha = 0.2) +
  geom_smooth() +
  geom_rug()


## HISTOGRAM
ggplot(mtcars, aes(x = hp)) +
  geom_histogram(bins = 10, fill = "red", alpha = 0.5)


## TECHNIQUE
p <- ggplot(mtcars, aes(x = hp))

p + geom_density()


## BOXPLOT BY GROUP
diamonds %>%
  count(cut) 

diamonds %>%
  count(color)

ggplot(diamonds, aes(cut)) +
  geom_bar(fill = "lightblue")

ggplot(diamonds, aes(cut, fill = color)) +
  geom_bar(position = "stack")

ggplot(diamonds, aes(cut, fill = color)) +
  geom_bar(position = "dodge")

ggplot(diamonds, aes(cut, fill = color)) +
  geom_bar(position = "fill")


## SCATTER PLOT
a <- ggplot(diamonds, aes(carat, price)) + 
  geom_point()


## SCATTER PLOT
## SAMPLE


small_data <- sample_n(diamonds, 5000)

ggplot(diamonds, aes(carat, price)) + 
  geom_point()

ggplot(small_data, aes(carat, price)) + 
  geom_point()


## FACET : SMALL MULTIPLE
ggplot(small_data, aes(carat, price)) + 
  geom_point() +
  facet_wrap(~color)


ggplot(small_data, aes(carat, price,)) +
  geom_point() + 
  facet_wrap(~color, ncol = 4)

ggplot(small_data, aes(carat, price,)) +
  geom_point() + 
  facet_wrap(~color, ncol = 2)


## ADDITION
ggplot(small_data, aes(carat, price,)) +
  geom_point() + 
  geom_smooth(method = "lm", col = "red") +
  facet_wrap(~color, ncol = 4)


## THEME 
ggplot(small_data, aes(carat, price,)) +
  geom_point() + 
  geom_smooth(method = "lm", col = "red") +
  facet_wrap(~color, ncol = 4) +
  theme_minimal() +
  labs(title = "Relationship between carat and price by color",
         x = "Carat",
         y = "Price USD",
         caption = "Source: Diamonds from GGPLOT2 Package")

## COLOR
ggplot(small_data, aes(carat, price, col = cut)) +
  geom_point(size = 3, alpha = 0.5) + 
  geom_smooth(method = "lm", col = "red") +
  facet_wrap(~color, ncol = 4) +
  theme_minimal() +
  labs(title = "Relationship between carat and price by color",
       x = "Carat",
       y = "Price USD",
       caption = "Source: Diamonds from GGPLOT2 Package")
