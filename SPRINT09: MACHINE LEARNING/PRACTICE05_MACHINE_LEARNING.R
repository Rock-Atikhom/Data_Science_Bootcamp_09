## CLASSIFICATION 
## LOGISTIC REGRESSION
library(caret)


## TRAIN TEST SPLIT
train_test <- function(data) {
  n <- nrow(data)
  id <- sample(n, size = 0.8 * n)
  train_model <- data[id, ]
  test_model <- data[-id, ]
  return(list(train_model, test_model))
}

split <- train_test(mtcars)


## FACTOR
mtcars$am <- factor(mtcars$am, 
       levels = c(0, 1),
       labels = c("Auto", "Manual"))

table(mtcars$am)

class(mtcars$am)


## TRAIN MODEL
glm_model <- train(am ~ mpg, ## CLASSIFICATION
              data = split[[1]],
              method = "glm")


## SCORE AND EVALUATION
glm_p <- predict(glm_model, newdata = split[[2]])

acc <- mean(glm_p == split[[2]]$am)
