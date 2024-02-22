## CORRELATION
cor(mtcars$hp, mtcars$mpg)

cor(mtcars$wt, mtcars$mpg)

cor(mtcars$wt, mtcars$hp)

plot(mtcars$hp, mtcars$mpg, pch = 19)

plot(mtcars$wt, mtcars$mpg, pch = 19)

plot(mtcars$wt, mtcars$hp, pch = 19)


## SUBSET
cor(mtcars[ , c("mpg", "hp", "wt")])


## PIPE OPERATOR
library(dplyr)

mtcars %>%
  select(mpg, hp, wt) %>%
  cor()


## COMPUTE CORRELATION AND SIGNIFICANCE TEST
cor.test(mtcars$hp, mtcars$mpg)


## LINEAR REGRESSION
## MPG = F(HP)
lmfit <- lm(mpg ~ hp, data = mtcars)

summary(lmfit)


## PREDICTION
## LINEAR REGRESSION SUBSET
## MPG = F(HP)
## MPG = INTERCEPT + SLOPE * HP

lmfit$coefficients

lmfit$coefficients[1]

lmfit$coefficients[2]

lmfit$coefficients[[1]]

lmfit$coefficients[[2]]

lmfit$coefficients[[1]] + lmfit$coefficients[[2]] * 200


## PREDICT
new_cars <- data.frame(
  hp = c(250, 320, 400, 410, 450)
)

predict(lmfit, new_cars)

predict(lmfit, newdata = new_cars)


## ADD VARIANCE TO COLUMN
new_cars$predicted_mpg <- predict(lmfit, newdata = new_cars)


## ROOT MEAN SQUARED ERROR (RMSE)
## MULTIPLE LINEAR REGRESSION
## MPG = F(HP, WT, AM)
## MPG = INTERCEPT + B0 * HP + B1 * WT + B2 * AM

lmfit_v2 <- lm(mpg ~ hp + wt + am, data = mtcars)


## COEFFICIENTS
coefs <- coef(lmfit_v2)

coefs
coefs[[1]]
coefs[[2]]
coefs[[3]]
coefs[[4]]

coefs[[1]] + coefs[[2]] * 200 + coefs[[3]] * 3.5 + coefs[[4]]

predict(lmfit_v2)


## BUILD FULL MODEL
lmfull <- lm(mpg ~ ., data = mtcars)


lmfull <- lm(mpg ~ . -gear, data = mtcars)


## ERROR VALUES
mtcars$predicted_mpg <- predict(lmfull)


## ERROR^2 VALUES
error <- mtcars$mpg - mtcars$predicted_mpg

error_2 <- (mtcars$mpg - mtcars$predicted_mpg) ** 2


## ROOT MEAN SQUARED ERROR
rmse <- sqrt(mean(error_2))


## SPLIT DATASET
## TRAINING SETS 80%
## TEST SETS 20%
set.seed(42)
n <- nrow(mtcars)
id <- sample(1:n, size = n*0.8)
train_data <- mtcars[id, ]
test_data <- mtcars[-id, ]


## TRAIN MODEL
model1 <- lm(mpg ~ hp, wt, data = train_data)


## PREDICT
p_train <- predict(model1)


## ERROR
error_train <- train_data$mpg - p_train


## ERROR^2
error2_train <- error_train ** 2


## ROOT MEAN SQUARED ERROR
rmse_train <- sqrt(mean(error**2))

sqrt(mean(error2_train))


## TEST MODEL
p_test <- predict(model1, newdata = test_data)


## ERROR
error_test <- test_data$mpg - p_test


## ERROR^2
error2_test <- error_test**2


## ROOT MEAN SQURED ERROR
sqrt(mean(error2_test))

rmse_test <- sqrt(mean(error_test**2))


## PRIN RESULT
cat("RMSE TRAIN:", rmse_train,
    "\nRMSE TEST:", rmse_test)


## \n
cat("RMSE TRAIN:", rmse_train, "\n")
cat("RMSE TEST:", rmse_test)
