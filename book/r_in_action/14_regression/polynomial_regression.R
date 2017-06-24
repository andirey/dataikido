#
# R in action (2 ed.)
#

#
# Polynomial regression
#

# 2

fit2 <- lm(weight ~ height + I(height^2), data = women)

summary(fit2)

plot(women$height, women$weight,
     xlab="Height (in inches)",
     ylab="Weight (in lbs)")

lines(women$height, fitted(fit2))

# 3

fit3 <- lm(weight ~ height + I(height^2) + I(height^3), data=women)

summary(fit3)

plot(women$height, women$weight,
     xlab="Height (in inches)",
     ylab="Weight (in lbs)")

lines(women$height, fitted(fit3))

# Although higher polynomials are possible, 
# rarely found that terms higher than
# cubic are necessary. 

#
# scatterplot() function in the car package
#

library(car)

scatterplot(weight ~ height, data=women, 
            spread=FALSE, smoother.args=list(lty=2), pch=19,
            main="Women Age 30-39",
            xlab="Height (inches)", 
            ylab="Weight (lbs.)")

