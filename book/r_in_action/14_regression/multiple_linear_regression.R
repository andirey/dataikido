#
# R in action (2 ed.)
#

#
# Multiple linear regression
#

library(car)

#
# 1. Multiple linear regression
#

# Data
states <- as.data.frame(state.x77[, c("Murder", "Population", "Illiteracy", "Income", "Frost")])

# Examining bivariate relationships
cor(states)

# Scatter plots of the variables with each other in the off-diagonals and 
# superimposes smoothed (loess) and linear fit lines on these plots. 
# The principal diagonal contains density and rug plots for each variable. 

scatterplotMatrix(states, spread=FALSE, smoother.args=list(lty=2), main="Scatter Plot Matrix")

# model

fit <- lm(Murder ~ Population + Illiteracy + Income + Frost, data = states)

summary(fit)

#
# 2. Multiple linear regression with interactions
#

fit <- lm(mpg ~ hp + wt + hp:wt, data=mtcars)

summary(fit)

# Visualize interactions using the effect() function

library(effects)

plot(effect("hp:wt", fit,, list(wt=c(2.2, 3.2, 4.2))), multiline=TRUE)
