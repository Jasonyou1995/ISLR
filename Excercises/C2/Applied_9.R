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

auto <- read.csv("data/Auto.csv", stringsAsFactors = FALSE, na.strings = "?")
auto = na.omit(auto)

# (a) 
# quantitative: mpg, displacement, horsepower, weight, acceleration, year, cylinders
# qualitative: origin, name

# (b) range of quantitative data
apply(auto[, -8:-9], 2, range, na.rm = TRUE)  # pass the arg na.rm into `range()`

# (c) mean and sd of each quantitative data
m1 <- apply(auto[, -8:-9], 2, mean, na.rm = TRUE)
s1 <- apply(auto[, -8:-9], 2, sd, na.rm = TRUE)
plot(m1, type = 'b', col = 2, lty = 1, pch = 1)
points(s1, type = 'b', col = 3, lty = 1, pch = 1)

# (d)
m2 <- apply(auto[-10:-85, -8:-9], 2, mean, na.rm = TRUE)
s2 <- apply(auto[-10:-85, -8:-9], 2, sd, na.rm = TRUE)
points(m2, type = 'b', col = 4, lty = 2, pch = 22, lwd = 2.5)
points(s2, type = 'b', col = 5, lty = 2, pch = 22, lwd = 2.5)
