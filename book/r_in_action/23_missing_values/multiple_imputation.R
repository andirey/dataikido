#
# R in action (2 ed.)
#

# Multiple imputation

library(mice)

data(sleep, package="VIM")

imp <- mice(sleep, seed=1234)
fit <- with(imp, lm(Dream ~ Span + Gest))
pooled <- pool(fit)
summary(pooled)

imp
# predictive mean matching (pmm)

# original
sleep$Dream 

# imputed (5 iterations)
imp$imp$Dream

# displays the third (out of five) complete dataset 
# created by the multiple imputation process
dataset3 <- complete(imp, action=3)
dataset3
