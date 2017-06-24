#
# R in action (2 ed.)
#

#
# An enhanced approach
#

#
# 1. Normality ----------------------------------------
#

library(car)

states <- as.data.frame(state.x77[, 
                        c("Murder", "Population", "Illiteracy", "Income", "Frost")])

fit <- lm(Murder ~ Population + Illiteracy + Income + Frost, data=states)

# With the exception of Nevada, all the points fall close to the line and are within the
# confidence envelope, suggesting that you’ve met the normality assumption fairly well.

qqPlot(fit, labels=row.names(states), 
       id.method="identify",
       simulate=TRUE, 
       main="Q-Q Plot")

# outlier

states["Nevada",]
fitted(fit)["Nevada"]

residuals(fit)["Nevada"]
rstudent(fit)["Nevada"]

#
# Function for plotting studentized residuals
#

residplot <- function(fit, nbreaks=10) {
  z <- rstudent(fit)
  hist(z, breaks=nbreaks, freq=FALSE, 
       xlab="Studentized Residual", 
       main="Distribution of Errors")
  rug(jitter(z), col="brown")
  curve(dnorm(x, mean=mean(z), sd=sd(z)), 
        add=TRUE, col="blue", lwd=2)
  lines(density(z)$x, density(z)$y, 
        col="red", lwd=2, lty=2)
  legend("topright", 
         legend = c( "Normal Curve", "Kernel Density Curve"), 
         lty=1:2, col=c("blue","red"), cex=.7)
} 

# Errors follow a normal distribution quite well, with the exception of a large outlier
residplot(fit)

# INDEPENDENCE OF ERRORS
durbinWatsonTest(fit)

#
# 2. LINEARITY ----------------------------------------------------
#

library(car)
crPlots(fit)

#
# 3. HOMOSCEDASTICITY ---------------------------------------------
#

library(car)
ncvTest(fit)
spreadLevelPlot(fit)

#
# 4. Global validation of linear model assumption
#

library(gvlma)
gvmodel <- gvlma(fit)
summary(gvmodel)

# Multicollinearity

library(car)
vif(fit)
# do we have a problem ?
sqrt(vif(fit)) > 2
