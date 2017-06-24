#
# R in action (2 ed.)
#

lmfit <- lm(mpg ~ wt, data = mtcars)

summary(lmfit)

plot(lmfit)

# influence statistics
cook <- cooks.distance(lmfit)

