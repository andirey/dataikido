#
# R in action (2 ed.)
#

#
# Simple Linear Regression
#

# model
fit <- lm(weight ~ height, data=women)

# see
summary(fit)

# The multiple R-squared (0.991) indicates that the
# model accounts for 99.1% of the variance in weights. 
# The multiple R-squared is also the squared correlation 
# between the actual and predicted value 

# original
women$weight

# predicted
fitted(fit)

# check
residuals(fit)

# visual
plot(women$height, women$weight, 
     xlab="Height (in inches)", 
     ylab="Weight (in pounds)")
abline(fit)
