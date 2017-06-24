#
# R in action (2 ed.)
#

#
# Regression diagnostics
#

# 1: A typical approach (women case)
# Interpretation of results on p.212

# 1.1
fit <- lm(weight ~ height, data=women)
par(mfrow=c(2,2))
plot(fit)

# 1.2 quadratic fit
# polynomial regression provides a better fit with regard to the 
# linearity assumption, normality of residuals
fit2 <- lm(weight ~ height + I(height^2), data=women)
par(mfrow=c(2,2))
plot(fit2)

# 2: A typical approach (states case)

# data
states <- as.data.frame(state.x77[,c("Murder", "Population", "Illiteracy", "Income", "Frost")])

fit <- lm(Murder ~ Population + Illiteracy + Income + Frost, data=states)
confint(fit)

par(mfrow=c(2,2))
plot(fit)






