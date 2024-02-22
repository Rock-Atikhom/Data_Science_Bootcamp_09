## INSTALL PACKAGE
install.packages("tidyverse")


## LIBRARY
library(tidyverse)


## BASIC PLOT IN BASE R
## HISTOGRAM - ONE QUANTITATIVE VARIABLE
hist(mtcars$mpg)
hist(mtcars$hp)


## ANALYZING HORSE POWER
hist(mtcars$hp)
mean(mtcars$hp)
median(mtcars$hp)


## BARPLOT - ONE QUANTITATIVE VARIABLE
str(mtcars)
mtcars$am <- factor(mtcars$am,
                    levels = c(0,1),
                    labels = c("Auto", "Manual"))

barplot(table(mtcars$am))


## BLOXPLOT
boxplot(mtcars$hp)
fivenum(mtcars$hp)

min(mtcars$hp)
quantile(mtcars$hp, props = c(.25, .5, .75))
median(mtcars$hp)
max(mtcars$hp)


## WHISKER CALCULATION
Q <- quantile(mtcars$hp)

Q3 <- Q[[4]]
Q1 <- Q[[2]]

IQR_HP <- Q3 - Q1


## UPPER WHISKER BOUNDARY CALCULATION
Q3 + 1.5 * IQR_HP


## LOWER WHISKER BOUNDARY CALCULATION
Q1 - 1.5 * IQR_HP


## BOXPLOT STAT
boxplot.stats(mtcars$hp, coef = 1.5)


## FILTER OUT OUTLIER
mtcars_no_out <- mtcars %>%
  filter(hp < 335)

boxplot(mtcars_no_out$hp)


## BOXPLOT 2 VARIABLE
## QUALITATIVE X
## QUANITATIVE Y
boxplot(mpg ~ am, data = mtcars, col = (c("salmon","#00abff")))


## SCATTER PLOT
plot(mtcars$hp, mtcars$mpg, pch = 20,
     col = "red",
     main = "My Fisrt Scatter Plot",
     xlab = "Horse Power",
     ylab = "Miles Per Gallon")


## CORRELATION
cor(mtcars$hp, mtcars$mpg)


## LINEAR REGRESSION
lm(mpg ~ hp, data = mtcars)
