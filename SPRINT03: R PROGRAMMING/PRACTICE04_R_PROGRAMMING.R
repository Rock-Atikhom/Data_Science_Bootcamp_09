## SUBSET AND DATAFRAME

friends <- c("Wan", "Ink", "Aan", "Bee", "Top")

ages <- c(26, 27, 32, 31, 28)

locations <- c("New york", "London", 
               "London", "Tokyo", "Manchester")

movie_lover <- c(T,T,F,T,T)


## CREATE DATA FRAME FROM LIST

my_list <- list(item1 = friends,
                item2 = ages,
                item3 = locations,
                item4 = movie_lover)

data.frame(my_list)

names(ages) <- friends
ages

ages[c("Top", "Ink", "Bee")]
