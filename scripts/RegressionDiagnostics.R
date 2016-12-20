# Assume that we are fitting a multiple linear regression
# on the MTCARS data
library(car)
fit <- lm(mpg ~ disp + hp + wt + drat, data = mtcars)

# Assessing Outliers
outlierTest(fit)  # Bonferonni p-value for most extreme obs

qqPlot(fit, main = 'QQ Plot')  # qq plot for studentized resid

leveragePlot(fit)  # leverage plots
