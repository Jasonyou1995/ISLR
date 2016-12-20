library(MASS)
library(dplyr)
library(ISLR)
library(ggplot2)

readkey <- function() {
  cat('Press [enter] to continue')
  line <- readline()
  # clean the history
  par(margin(rep(0, 4)), mfrow = c(1, 1))
}

# (a)
dim(Boston)
names(Boston)
# row names are observations

# (b)
pairs(Boston)

# (c)
plot(Boston)
