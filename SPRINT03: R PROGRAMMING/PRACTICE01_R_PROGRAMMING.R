## DATA FRAME

friends <- c("Wan", "Ink", "Aan", "Bee", "Top")

ages <- c(26, 27, 32, 31, 28)

locations <- c("New york", "London", 
               "London", "Tokyo", "Manchester")

movie_lover <- c(T,T,F,T,T)




df <- data.frame(friends,
           ages,
           locations,
           movie_lover)

View(df)
