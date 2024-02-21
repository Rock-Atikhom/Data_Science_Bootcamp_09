## CONTROL FLOW
## IF() IN GOOGLE SHEETS

point <- 90


if(point >= 80) {
  print("Passed")
} else {
  print("Failed")
}

if(point >= 90) {
  print("Passed")
} else {
  print("Failed")
}

if (point > 90) {
  print("Passed")
} else if (point >= 50) {
  print("OKAY")
} else {
  print("Enroll Again")
}


## IFELSE

ifelse(point >= 50, "Okay", "Enroll Again")

ifelse(point >= 80, "Passed", ifelse(point >= 50, "OKAY", 
                              ifelse(point < 50, "Enroll Again"
)
)
)


## FOR

friends <- c("Toy", "John", "Mary", "Anna")

for(friend in friends) {
  print(friend)
}

for(friend in friends) {
  print(paste("Hi",friend))
}


##VECTORIZATION
paste("Hi",friends)

nums <- c(5, 10, 12, 20, 25)
nums <- nums + 2
nums


## COMPARABLE WHILE FOR AND VECTORIZATION
for(num in nums) {
  print(num-2)
}

(nums <- nums - 2)


## WHILE

count <- 0

while(count < 5) {
  print("Hi!")
  count <- count + 1
}


## FUNCTION
## INPUT -> f() -> OUTPUT  
## CORE-CONCEPT

x <- c(10, 25, 50, 100)

sum(x)
mean(x)
sd(x) ##STANDARD DEVIATION


## CREATE OUR FIRST FUNCTION

greeting <- function() {
  print("Hello World")
}

greeting_name <- function(name) {
  print(paste("Hello!", name))
}

greeting_name("Rock")
greeting_name("Toy")

func <- function() {
  greeting()
  greeting_name("Rock")
}


## FUNCTION PARAMETER  & ARGUMENT

greeting_name <- function(name = "Rock") {
  print(paste("Hello!", name))
}


## OVERWRITE

greeting_name(name = "Toy")


## OR

greeting_name("Toy")


## MORE THAN ONE PARAMETER

greeting_name <- function(name = "Rock", age = 23) {
  print(paste("Hello!", name))
  print(paste("age:", age))
}


## overwrite 
greeting_name(name = "Toy", age = 25)
greeting_name(age = 25, name = "Toy")

## OR
greeting_name(25, "Toy")
greeting_name("Toy", 25)


## ADD_TO_NUMS

add_to_nums <- function(val1, val2) {
  return(val1 * val2)
}


## OR
add_to_num <- function(val1, val2) {
  (val1 * val2)
}


## CUBE

cube <- function(base, power=3) {
  return(base ** power)
}


## OR

cubes <- function(base, power=3) {
  (base ** power)
}


# OVERWRITE

cube(2, power=2)
cube(2,2)


## COUNT BALL

balls <- c("red", "blue", "red", "red", 
          "green", "yellow", "red", "blue")

count_ball <- function(balls) {
  sum(balls == "red")
}

## OR

count_balls <- function(balls,color) {
  sum(balls == color)
}


## LOGICAL COMPARISON

balls <- c("red", "blue", "red", "red", 
           "green", "yellow", "red", "blue")


(balls == "red")


## LOOP OVER A DATAFRAME

data()

nrow(USArrests)
ncol(USArrests)
head(USArrests)


for(i in 1:ncol(USArrests)) {
  print(names(USArrests)[i])
  print(mean(USArrests[i]))
}


## CREATE FUNCTION

cal_mean_by_col <- function(df) {
  for (i in 1:ncol(df)) {
    print(names(df[i]))
    print(mean(df[[i]]))
  }
}

cal_mean_by_col(USArrests)


cal_mean_by_col(airquality)


## APPLY FUNCTION

by_row <- apply(USArrests, MARGIN=1, mean)

by_col <- apply(USArrests, MARGIN=2, mean)

apply(USArrests, MARGIN=2, sum)

apply(USArrests, MARGIN=2, sd)

apply(USArrests, MARGIN=2, median)
