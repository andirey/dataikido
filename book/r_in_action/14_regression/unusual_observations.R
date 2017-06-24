#
# R in action (2 ed.)
#

#
# Unusual observations
#

# 1. namely  outliers

# A rough rule of thumb isthat standardized residuals that 
# are larger than 2 or less than –2 are worth attention
# If it’s significant, you must delete it and 
# rerun the test to see if others are present

library(car)

outlierTest(fit)

# 2. high-leverage  observations

hat.plot <- function(fit) {
  p <- length(coefficients(fit))
  n <- length(fitted(fit))
  plot(hatvalues(fit), main="Index Plot of Hat Values")
  abline(h=c(2,3)*p/n, col="red", lty=2)
  identify(1:n, hatvalues(fit), names(hatvalues(fit)))
}
hat.plot(fit)

# 3. influential  observations
# There are two methods for identifying influential observations: 
# Cook’s distance (or D statistic) and added variable plots

cutoff <- 4/(nrow(states)-length(fit$coefficients)-2)
plot(fit, which=4, cook.levels=cutoff)
abline(h=cutoff, lty=2, col="red")

avPlots(fit, ask=FALSE, id.method="identify")

# 4. Combine the information from outlier, leverage, 
# and influence plots into one highly informative plot 
# using the influencePlot()

influencePlot(fit, id.method="identify", main="Influence Plot",
              sub="Circle size is proportional to Cook's distance")


