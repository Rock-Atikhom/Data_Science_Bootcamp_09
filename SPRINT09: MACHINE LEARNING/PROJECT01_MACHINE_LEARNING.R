## INSTALL LIBRARY
## LOAD LIBRARY
library(tidyverse)
library(caret)
library(readr)

churn <- read_csv("churn.csv")

churn$churn <- factor(churn$churn, 
                      levels = c("No", "Yes"),
                      labels = c("No", "Yes"))


## SPLIT DATA
split_data <- function(data, size = 0.8) {
  n <- nrow(data)
  id <- sample(n, size*n)
  train_df <- data[id, ]
  test_df <- data[-id, ]
  return(list(train_df, test_df))
}

prep_df <- split_data(churn, size = 0.8)

prep_df[[1]]
prep_df[[2]]


## TRAIN MODEL
ctrl <- trainControl(method = "loocv",
                     verboseIter = T)


model <- train(churn ~ 
                 totaldayminutes +  
                 totaleveminutes +  
                 totalnightminutes +
                 totalintlminutes,
               data = prep_df[[1]], 
               method = "glm",
               trControl = ctrl)


## SCORE
pred_churn <- predict(model, newdata = prep_df[[2]])

actual_churn <- prep_df[[2]]$churn


## EVALUATION
accuracy <- mean(actual_churn == pred_churn)


## CONFUSION MATRIX
confusionMatrix(pred_churn, actual_churn,
                positive = "Yes",
                mode = "prec_recall")


conf <- table(pred_churn, actual_churn, 
        dnn = c("predicted", "actual"))

conf[[1,1]]
conf[[1,2]]
conf[[2,1]]
conf[[2,2]]

sum(conf)

ac <- cat("Accuracy: ", (conf[[1,1]] + conf[[2,2]]) / sum(conf))

prec <- cat("Precision: ", (conf[[2,2]]) / (conf[[2,1]] + conf[[2,2]]))

rec <- cat("Recall: ", (conf[[2,2]]) / (conf[[1,2]] + conf[[2,2]]))

f1 <- cat("F1: ", 2 * ((0.875 * 0.05147059) / (0.875 + 0.05147059)))
