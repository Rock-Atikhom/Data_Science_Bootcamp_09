## BINARY CLASSIFICATION
## LOGISTIC REGERSSION 

hapiness <- c(10, 8, 9, 7, 8, 5, 9, 6, 8, 7, 1, 1, 3, 1, 4, 5, 6, 3, 2, 0)

divorce <- c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)

df <- data.frame(hapiness, divorce)


## FIT LOGISTIC REGRESSION MODEL FULL DATAL 

model <- glm(divorce ~ hapiness, data = df, family = "binomial")


## P-VALUE

summary(model)

## PREDICT AND EVALUATE MODEL

df$prop_divorce <- predict(model, type = "response")

df$prep_divorce <- ifelse(df$prop_divorce >= 0.05, 1, 0)


## CONFUSION MATRIX

conM <- table(df$prep_divorce, df$divorce, 
              dnn = c("predicted" , "actual"))

## EVALUATION MODEL

conM[1,1]
conM[1,2]
conM[2,1]
conM[2,2]


## ACCURACY

cat("Accuracy:", conM[1,1] + conM[2,2] / sum(conM))

## PRECISION

cat("Precision:", conM[2,2] / (sum(conM[2,1], conM[2,2])))

## RECALL

cat("Recall:", conM[2,2] / (sum(conM[2,2], conM[1,2])))

## F1 SCORE

cat("F1 Score:", 2 * ((0.7142857 * 1) / (0.7142857 + 1)))
