## LOGISTIC REGRESSION
library(dplyr)

mtcars %>%
  head()


## CHECK CLASS

str(mtcars)


## CONVERT NUMERIC TO FACTOR
mtcars$am <- factor(mtcars$am, levels = c(0, 1), 
                    labels = c("Auto", "Manual"))

table(mtcars$am)


## SPLIT DATA
set.seed(42)
n <- nrow(mtcars)
id <- sample(1:n, n*0.8)

logis_train <- mtcars[id, ]
logis_test <- mtcars[-id, ]


## TRAIN MODEL
logis_model <- glm(am ~ mpg, data = logis_train, family = "binomial")


## PREDICT TRAIN
p_train <- predict(logis_model, type = "response") ## PROBABILITY


## CLASSIFICATION
logis_train$prep <- if_else(p_train >= 0.5, "Manual", "Auto")


## CALCULATION FOR ACCURACY
logis_train$am == logis_train$prep


## MEAN
mean(logis_train$am == logis_train$prep)


## TEST MODEL
logis_model <- glm(am ~ mpg, data = logis_train, family = "binomial")


## PREDICT TEST
p_test <- predict(logis_model, newdata = logis_test, type = "response") ## PROBABILITY


## CLASSIFICATION
logis_test$prep <- if_else(p_test >= 0.5, "Manual", "Auto")


## CALCULATION FOR ACCURACY
logis_test$am == logis_test$prep


## MEAN 
mean(logis_test$am == logis_test$prep)
