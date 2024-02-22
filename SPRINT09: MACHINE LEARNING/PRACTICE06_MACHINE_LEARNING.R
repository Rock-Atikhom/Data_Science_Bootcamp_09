## INSTALL LIBRARY
library(tidyverse)
library(caret)


## PREVIEW
head(mtcars)


## RECAP STATISTICS
model <- lm(mpg ~ hp + wt, data = mtcars)


## BUILD STANDARD INTERFACE FOR MODEL TRAINING
## MPG = F(HP, WT)
model2 <- train(mpg ~ hp + wt, 
      data = mtcars,
      method = "lm")


## SPLIT DATA
split_data <- function(data, size=0.8) {
  set.seed(42)
  n <- nrow(data)
  id <- sample(1:n, size*n)
  df_train <- data[id, ]
  df_test <- data[-id, ]
  return(list(df_train, df_test))
}

prep_data <- split_data(mtcars)

prep_data[[1]]

prep_data[[2]]


## TRAIN MODEL
ctrl <- trainControl(method = "CV",
                     number = 5)

model <- train(mpg ~ hp + wt + am,
      data = prep_data[[1]],
      method = "lm",
      trControl = ctrl)


## SCORE MODEL
pred_mpg <- predict(model, newdata = prep_data[[2]])


## EVALUATION MODEL
actual_mpg <- prep_data[[2]]$mpg


## MEAN ABSOLUTE ERROR
mae <- mean(abs(actual_mpg - pred_mpg))

MAE(pred_mpg, actual_mpg)


## ROOT MEAN SQURED ERROR
rmse <- sqrt(mean((actual_mpg - pred_mpg)**2))

RMSE(pred_mpg, actual_mpg)
 
 
 cat("MEAN ABSOLUTE ERROR: ", mae,
     "\nROOT MEAN SQUARED ERROR: ", rmse)
