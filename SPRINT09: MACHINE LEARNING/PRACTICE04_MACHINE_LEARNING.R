## INSTALL LIBRARY
install.packages("caret")
library(caret)

mtcars


## CREATE FUNCTION FOR SPLIT DATA BEFORE TRAIN MODEL
train_test_split <- function(data) {
  
  set.seed(42)
  n <- nrow(data)
  id <- sample(n, size = 0.8*n)
  train_data <- data[id, ]
  test_data <- data[-id, ]
  return(list(train_data, test_data))
  
}

split_data <- train_test_split(mtcars)


## TRAIN MODEL
lm_model <- train(mpg ~ hp, 
      data = split_data[[1]],
      method = "lm")


## SCORE AND EVALUATE
p <- predict(lm_model, newdata = split_data[[2]])


## EVALUATE WITH ROOT MEAN SQUARED ERROR
error <- split_data[[2]]$mpg - p

rmse <- sqrt(mean(error**2))
