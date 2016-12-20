# The Lab 3.6 in the Testbook

library(MASS)
library(ISLR)
# library(dplyr)
# library(ggplot2)

# attach(Boston)
# View(Boston)
# names(Boston)
# 
# lm.fit <- lm(medv ~ lstat, data = Boston)
# summary(lm.fit)
# names(lm.fit)
# coef(lm.fit)
# confint(lm.fit)
# 
# predict(lm.fit, data.frame(lstat = c(5, 10, 15)), interval = 'confidence')
# # notice that the prediction interval is substantially
# # wider than the confidence interval
# predict(lm.fit, data.frame(lstat = c(5, 10, 15)), interval = 'prediction')
# 
# # plot the observations and regression line
# plot(lstat, medv, pch = '+')
# abline(lm.fit, lwd = 3, col = 'red')
# # a demo of the arg 'pch'
# # plot(1:20, 1:20, pch = 1:20, col = 1:20)
# 
# par(mfrow = c(2, 2))
# plot.new()
# plot(lm.fit)
# plot(predict(lm.fit), residuals(lm.fit))
# plot(predict(lm.fit), rstudent(lm.fit))
# plot(hatvalues(lm.fit))  # the leverage statistics
# which.max(hatvalues(lm.fit))  # identifies the index of the largest element
# detach(Boston)

# multiple linear regression
attach(Boston)
lm.fit2 <- lm(medv ~ lstat + age, data = Boston)
summary(lm.fit2)

# fit all
lm.fit3 <- lm(medv ~ ., data = Boston)
summary(lm.fit3)
s <- summary(lm.fit3)
s$r.squared  # gives the R^2
s$sigma  # gives the RSE
car::vif(lm.fit3)

# regression without the 'age' variable
lm.fit4 <- lm(medv ~ . - age, data = Boston)
summary(lm.fit4)

# same result with the update() funciton (update and re-fit a model)
# update(object, formula., ..., evaluate = TRUE)
lm.fit5 <- update(lm.fit3, ~ . - age, evaluate = TRUE)  # the result is just a
                                            # new fomular is evaluate = FALSE
all(coef(lm.fit4) == coef(lm.fit5))  # check

# add interactive terms 'a * b'
lm.fit6 <- lm(medv ~ lstat * age, data = Boston)
# this is equals to:
lm.fit7 <- lm(medv ~ lstat + age + lstat:age, data = Boston)
all(coef(lm.fit6) == coef(lm.fit7))  # check


# non-linear tranformations of the predictors
# the I() funciton, or 'treaded as is' function, needed to do the correct eval
lm.fit8 <- lm(medv ~ lstat + I(lstat^2), data = Boston)
summary(lm.fit8)
anova(lm.fit, lm.fit8)  # 1-d and 2-d 'lstat' as predictors in two models

par(mfrow = c(2, 2))
plot(lm.fit8)

# even higher order prediction
lm.polyfit <- lm(medv ~ poly(lstat, 5), data = Boston)
summary(lm.polyfit)

# a log transformation
summary(lm(medv ~ log(rm), data = Boston))
