LoadLibraries <- function() {
  library(MASS)
  library(ISLR)
  # library(dplyr)
  # library(ggplot2)
  print('The libraries have been loaded.')
}

LoadLibraries()

View(Carseats)
names(Carseats)

lm.fit <- lm(Sales ~ . + Income:Advertising + Price:Age, data = Carseats)
summary(lm.fit)

# returns the coding that R uses for the dummy variables
contrasts(Carseats$ShelveLoc)


