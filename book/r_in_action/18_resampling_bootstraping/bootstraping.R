#
# R in action (2 ed.)
#

#
# Bootstrapping
#

library(boot)

#
# 1. Bootstrapping a single statistic
#

rsq <- function(formula, data, indices) {
  d <- data[indices,]
  fit <- lm(formula, data=d)
  return(summary(fit)$r.square)
} 

set.seed(1234)
results <- boot(data = mtcars, statistic = rsq,
                R = 1000, formula = mpg ~ wt + disp)
results
plot(results)

boot.ci(results, type=c("perc", "bca"))

#
# 2.  Bootstrapping several statistics
#
  
bs <- function(formula, data, indices) {                
  d <- data[indices,]
  fit <- lm(formula, data=d)
  return(coef(fit))                                    
}

set.seed(1234)
results <- boot(data=mtcars, statistic=bs,
                R=1000, formula=mpg~wt+disp)
print(results)
plot(results, index=2)
boot.ci(results, type="bca", index=2)
boot.ci(results, type="bca", index=3)
