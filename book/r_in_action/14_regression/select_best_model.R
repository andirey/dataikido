#
# R in action (2 ed.)
#

#
# Selecting the "best" regression model
#

# 1. Comparing models

# 1.1. Comparing nested models using the anova() function

states <- as.data.frame(state.x77[, c("Murder", 
            "Population", "Illiteracy", "Income", "Frost")])

# fit2 is nested within fit1
fit1 <- lm(Murder ~ Population + Illiteracy + Income + Frost,  data = states)
fit2 <- lm(Murder ~ Population + Illiteracy, data = states)

anova(fit2, fit1)

# test is nonsignificant (p = .994)
# we can drop Income, Frost 

# 1.2.  Akaike Information Criterion (AIC)
fit1 <- lm(Murder ~ Population + Illiteracy + Income + Frost,  data=states)
fit2 <- lm(Murder ~ Population + Illiteracy, data=states)

AIC(fit1,fit2)

#  model without Income and Frost is the better model
