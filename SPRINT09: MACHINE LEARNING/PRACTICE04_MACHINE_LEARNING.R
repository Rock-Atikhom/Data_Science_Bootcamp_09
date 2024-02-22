## FIND THE BEST HYPERPARAMETER THAT IMPROVE MODEL PERFORMANCE
library(tidyverse)
library(caret)
library(mlbench)

data("BostonHousing")
data("PimaIndiansDiabetes")


## MEAN IMPUTATION
clean_df <- mtcars %>% 
  select(mpg, hp, wt, am) %>%
  mutate(hp = replace_na(hp, 146.68), 
         wt = replace_na(wt, 3.21)) %>%
  drop_na()


## TRAIN MODEL
## K-NEAREST NEIGHBORS
set.seed(42)

## grid search
k_grid <- data.frame(k = c(3,5,7))

ctrl <- trainControl(
  method = "REPEATEDCV", 
  number = 5,
  repeats = 4,
  verboseIter = T ## LOG PROGRESS BAR
)

knn_model <- train(
  mpg ~ .,
  data = clean_df,
  method = "knn",
  metric = "Rsquared",
  trControl = ctrl,
  tuneGrid = k_grid
)


## RANDOM
knn_model <- train(
  mpg ~ .,
  data = clean_df,
  method = "knn",
  metric = "Rsquared",
  trControl = ctrl,
  tuneLength = 4
)


## SAVE MODEL
saveRDS(knn_model, "knn_model.RDS")


## NORMALIZATION
## 1. MIN - MAX (FEATURE SCALING 0, 1)
## 2. STANDARDIZATION (CENTER AND SCALE -3, +3)
x <- c(5, 10, 12, 15, 20)

minmaxNorm <- function(x) {
  (x-min(x)) / (max(x) - min(x)) 
}


## CENTER AND SCALE
## STANDARDIZATION
zNorm <- function(x) {
  (x - mean(x)) / sd(x)
}


## PREPROCESS
## SPLIT DATA ROUHGLY
train_df <- mtcars[1:20, ]
test_df <- mtcars[21:32, ]


## CONPUTE X_BAR, X_SD
transformer <- preProcess(
                 train_df,
                 method = c("range")
)

train_df_z <- predict(transformer, train_df)

test_df_z <- predict(transformer, test_df)
