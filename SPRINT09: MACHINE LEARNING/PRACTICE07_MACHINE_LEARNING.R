## BUILD TO CLASSIFY DIABETES PATIENTS
## BINARY CLASSIFICATION
library(tidyverse)
library(caret)
library(mlbench)
library(MLmetrics)


## LOAD DATASET
data("PimaIndiansDiabetes")
df <- PimaIndiansDiabetes
glimpse(df)


## EXPLORE MISSING VALUE
## NO MISSING VALUE
mean(complete.cases(df))


## SELECT VARIABLE
df_starter <- df %>%
  select(2, 5, 6, 8, diabetes)

glimpse(df_starter)


df_starter %>%
  group_by(diabetes) %>%
  summarise(BMI = mean(mass),
            GLUCOSE = mean(glucose),
            AGE = mean(age))

## SPLIT DATA
## TRAIN AND TEST DATA
set.seed(42)

split_df <- function(data, size = 0.8) {
  n <- nrow(data)
  id <- sample(n, size*n)
  train_data <- data[id, ]
  test_data <- data[-id, ]
  return(list(train_data, test_data))
}

dataset <- split_df(df_starter)


## TRAIN MODEL
set.seed(42)
ctrl <- trainControl(method = "CV",
                     number = 10,
                     ## PR = PRECISION AND RECALL
                     summaryFunction = prSummary,
                     classProbs = T)

logis_model <- train(diabetes ~ .,
                     data = dataset[[1]],
                     method = "knn",
                     metric = "F",
                     trControl = ctrl)


## SCORE
pred_df <- predict(logis_model,
                newdata = dataset[[2]])

actual_df <- dataset[[2]]$diabetes


## EVALUATION
mean(actual_df == pred_df)


## CONFUSION MATRIX WITH HAND CALCULATION
conf <- table(pred_df, actual_df,
              dnn = c("predicted", "actual"))


conf[[1,1]]
conf[[1,2]]
conf[[2,1]]
conf[[2,2]]

accuracy <- ((conf[[1,1]] + conf[[2,2]]) / sum(conf))

precision <- conf[[2,2]] / (conf[[2,1]] + conf[[2,2]])

recall <- conf[[2,2]] / (conf[[1,2]] + conf[[2,2]])

F1Score <- 2 * ((precision * recall) / (precision + recall)) 


## CONFUSION FUNCTION
confu_df <- confusionMatrix(pred_df, actual_df,
                positive = "pos",
                mode = "prec_recall")
