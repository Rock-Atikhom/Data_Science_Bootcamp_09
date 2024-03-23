print("Hello World")


## basic calculation

1+1
5/2
5^2
5**2

## data type

x <- 10
y <- 20
print(x+y)

my_name <- "Rock"
age <- 23
school <- "RockAtikhom"

print(my_name)
print(age)
print(school)

## create vectors

friends <- c("Rock", "Toy", "Tap", "Ann", "Ink")

class(friends)

length(friends)

friends[8]
friends[1:4]

## dataframe

friends <- c("Rock", "Toy", "Tap", "Ann", "Ink")
ages <- c(23, 32, 25, 38, 30)
movies <- c(TRUE, FALSE, TRUE, TRUE, FALSE)

df <- data.frame(friends, ages, movies)

dim(df)

## create new columns

df$location <- c("Bangkok", "Bangkok", "London", "London", "London")

## delete columns

df$location <- NULL

## subset function

subset(df, df$age < 30)
subset(df, df$age > 30)
subset(df, df$movies == T)


## function in R

squares <- function(x){
  return(x^2)
}

squares(2)

## control flow
## if 
## for
## while

wheather <- "couldy"

if(wheather == "sunny") {
  print("Lovely Whether")
} else {
  print("Bad Whether")
}


check_whether <- function(wheather) {
  if(wheather == "sunny") {
    print("Lovely Whether")
  } else {
    print("Bad Whether")
  }
}

check_whether("sunny")
check_whether("Couldy")

## read and write data

url <- "https://gist.githubusercontent.com/toyeiei/77576fc3b016ea073cb4a2b331cb9584/raw/13f65efcbf230e595fd46f17c791a2d090eb57b1/r_example_dataframe.csv"

blackpink <- read.csv(url)
