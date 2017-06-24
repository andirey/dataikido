#
# R in action (2 ed.)
#

#
# Variable selection
#

#
# 1. Stepwise methods
#

# 1.1. Backward stepwise selection

library(MASS)
states <- as.data.frame(state.x77[,c("Murder", "Population", 
                                     "Illiteracy", "Income", "Frost")])

fit <- lm(Murder ~ Population + Illiteracy + Income + Frost, data=states)

stepAIC(fit, direction="backward")

#
# 2. All-subsets regression
# In  most  instances,  it is  preferable  to  stepwise  regression
#

library(leaps)

states <- as.data.frame(state.x77[,c("Murder", "Population", 
                                     "Illiteracy", "Income", "Frost")])

leaps <- regsubsets(Murder ~ Population + Illiteracy + Income +
                     Frost, data=states, nbest=4)

plot(leaps, scale="adjr2")

library(car)
subsets(leaps, statistic="cp", main="Cp Plot for All Subsets Regression")
abline(1,1,lty=2,col="red")
