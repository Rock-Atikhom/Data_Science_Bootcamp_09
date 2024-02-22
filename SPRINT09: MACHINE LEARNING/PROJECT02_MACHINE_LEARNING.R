## INSTALL LIBRARY
## LOAD LIBRARY
library(caret)
library(tidyverse)
library(MLmetrics)


## LOAD DATASET 
churn_df <- read_csv("churn.csv")
glimpse(churn_df)


hypo_01 <- churn_df %>% 
  select(1, 2, 3, 4, 7, 10, 13, 16)


## CHECK DATASET
glimpse(hypo_01)


## CONVERT TO FACTOR
churn_df$churn <- as.factor(churn_df$churn)
churn_df$internationalplan <- as.factor(churn_df$internationalplan)
churn_df$voicemailplan <- as.factor(churn_df$voicemailplan)


## EXPLORE MISSING VALUE
mean(complete.cases(churn_df))


## SPLIT DATA
split_data <- function(data, size=0.8) {
  set.seed(42)
  n <- nrow(data)
  id <- sample(n, size * n)
  train_df <- data[id, ]
  test_df <- data[-id, ]
  return(list(train_df, test_df))
}

df <- split_data(hypo_01)


## PREPROCESS
## STANDARDIZATION
## CENTER AND SCALE
## COMPUTE X_BAR + X_SD

transformer <- preProcess(df[[1]],
                          method = c("center", "scale"))


train_df_z <- predict(transformer, df[[1]])


test_df_z <- predict(transformer, df[[2]])


## TRAIN MODEL
## LOGISTIC MODEL
set.seed(42)

crtl01 <- trainControl(method = "CV", 
                       number = 10)

crtl02 <- trainControl(method = "boot",
                       number = 5)


model01 <- train(churn ~ .,
                 train_df_z,
                 method = "glm",
                 metric = "Accuracy",
                 trControl = crtl01)

model02 <- train(churn ~ .,
                 train_df_z,
                 method = "glm",
                 metric = "Accuracy",
                 trControl = crtl02)


## K-NEAREST NEIGHBORS MODEL
k_grid <- data.frame(k = c(3,5,7,9,11,13,15,17,19,21))

ctrl03 <- trainControl(method = "cv",
                       number = 5)

ctrl04 <- trainControl(method = "repeatedcv",
                       number = 10,
                       repeats = 5)

ctrl05 <- trainControl(method = "repeatedcv",
                       number = 10,
                       repeats = 5,
                       summaryFunction = prSummary,
                       classProbs = T)

model03 <- train(churn ~ .,
                 train_df_z,
                 method = "knn",
                 trControl = ctrl03,
                 tuneGrid = k_grid,
                 metric = "Accuracy")

model04 <- train(churn ~ .,
                 train_df_z,
                 method = "knn",
                 trControl = ctrl04,
                 tuneGrid = k_grid,
                 metric = "Accuracy")

model05 <- train(churn ~ .,
                 train_df_z,
                 method = "knn",
                 trControl = ctrl05,
                 tuneGrid = k_grid,
                 metric = "Precision")


## SCORE
pred_knn <- predict(model05, newdata = test_df_z)

actual_knn <- test_df_z$churn



## EVALUATATION
mean(pred_knn == actual_knn)


table(pred_knn, actual_knn, 
      dnn = c("prediction", "actual"))


## CONFUSION MATRIX
conf_test <- confusionMatrix(pred_knn, actual_knn,
                             positive = "No",
                             mode = "prec_recall")
