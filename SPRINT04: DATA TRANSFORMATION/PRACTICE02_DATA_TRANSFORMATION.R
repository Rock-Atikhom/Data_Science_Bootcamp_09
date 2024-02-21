## INSTALL NEW PACKAGE IN RSTUDIO
install.packages("tidyverse")


## LOAD LIBRARY
library(tidyverse)


## DATA.FRAME VS TIBBLE
df <- data.frame(
  id = 1:3,
  name = c("Rock", "Toy", "Guts")
)

df_tibble <- tibble(
  id = 1:3,
  name = c("Rock", "Toy", "Guts")
)


## CONVERT DATA FRAME TO TIBBLE
mtcars_tibble <- tibble(mtcars

                        
## SAMPLE DATA
set.seed(4)
sample_n(mtcars, size = 3)


## SAMPLE DATA
sample_frac(mtcars, size = 0.10)

sample_frac(mtcars, size = 0.50, replace = T)


## SLICE
mtcars %>%
  slice(1:5)

slice(mtcars, 1:5)


## SLICE
mtcars %>%
  slice(c(1,3,5))


## SLICE
mtcars %>%
  slice(sample(nrow(mtcars), 10))
  
