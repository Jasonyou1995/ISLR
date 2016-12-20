# Applied Excercies 8

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

# read and clean data
college <- read.csv("data/College.csv", stringsAsFactors = FALSE)
rownames(college) <- college[, 1]
college <- college[, -1]
attach(college)

# analyze data
summary(college)

# first 10 parameter pairs
readkey()
college$Private <- as.factor(college$Private)
pairs(college[, 1:10])

# side-by-side boxplots of 'Outstate' versus 'Private'
readkey()
plot(as.factor(Private), Outstate)

# create a new Elite column
readkey()
college <- mutate(college, Elite = ifelse(Top10perc > 50, 'Yes', 'No'))
summary(college)
plot(as.factor(college$Elite), Outstate)

# historgrams with different bins
readkey()
par(mfrow = c(2, 2))
hist(Outstate, nclass = 15, col = 6)
hist(Outstate, nclass= 50, col = 6)
hist(Books, nclass = 20, col = 3)
hist(Books, nclass = 10, col = 3)

detach(college)
