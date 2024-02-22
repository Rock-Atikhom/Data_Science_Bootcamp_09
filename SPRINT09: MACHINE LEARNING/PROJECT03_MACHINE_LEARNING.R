## NORMALIZATION
## INSTALL LIBRARY
## LOAD LIBRARY
library(caret)
library(tidyverse)
library(MLmetrics)


## LOAD DATASET 
churn_df <- read_csv("churn.csv")
glimpse(churn_df)
glimpse(hypo_01)

hypo_01 <- churn_df %>% 
  select(1, 2, 5, 8, 11, 18)


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
## NORMALIZATION
## COMPUTE X_BAR + X_SD

transformer <- preProcess(df[[1]],
                          method = c("range"))

train_df_z <- predict(transformer, df[[1]])

test_df_z <- predict(transformer, df[[2]])


## TRAIN MODEL
## LOGISTIC REGRESSION
set.seed(42)

crtl01 <- trainControl(method = "CV", 
                     number = 5)

crtl02 <- trainControl(method = "boot",
                     number = 5)

crtl03 <- trainControl(method = "loocv")

model01 <- train(churn ~ .,
               train_df_z,
               method = "glm",
               metric = "Accuracy",
               trControl = crtl01)


## K-NEAREST NEIGHBORS MODEL
k_grid <- data.frame(k = c(3,5,7,9,11,13,15,17,19,21))

ctrl04 <- trainControl(method = "cv",
                       number = 5,
                       summaryFunction = prSummary,
                      classProbs = T)


model02 <- train(churn ~ .,
                 train_df_z,
                 method = "knn",
                 trControl = ctrl04,
                 tuneGrid = k_grid,
                 metric = "precision"
                 )


## SCORE 
pred = predict(model02, newdata = test_df_z)

actual = as.factor(test_df_z$churn)

class(actual)


## EVALUATE
mean(pred == actual)


## CONFUSION MATRIX

confusionMatrix(pred, actual, 
                positive = "Yes",
                mode = "prec_recall")
