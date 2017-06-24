#
# R in action (2 ed.)
#

#
# Poisson regression
#
# predicting an outcome variable representing 
# "counts from a set of continuous and/or categorical predictor variables"
#

library(robust)

data(breslow.dat, package="robust")
names(breslow.dat)
summary(breslow.dat[c(6,7,8,10)])

opar <- par(no.readonly=TRUE)
par(mfrow=c(1,2))
attach(breslow.dat)
  hist(sumY, breaks=20, xlab="Seizure Count", 
       main="Distribution of Seizures")
  boxplot(sumY ~ Trt, xlab="Treatment", main="Group Comparisons")
  par(opar) 
detach(breslow.dat)

fit <- glm(sumY ~ Base + Age + Trt, data=breslow.dat, family=poisson())
summary(fit)
coef(fit)

# interpret the regression coefficients in the original scale
# of the dependent variable

exp(coef(fit))

# check overdispersion
deviance(fit)/df.residual(fit)

# test for overdispersion in the Poisson case
# p-value less than 0.05, strongly suggesting
# the presence of overdispersion.

library(qcc)
qcc.overdispersion.test(breslow.dat$sumY, type="poisson")

# new fitting
fit.od <- glm(sumY ~ Base + Age + Trt, data=breslow.dat,
              family=quasipoisson())
summary(fit.od)

# --------------------------------------------
# POISSON REGRESSION WITH VARYING TIME PERIODS
#

fit <- glm(sumY ~ Base + Age + Trt, data=breslow.dat, 
           offset= log(time), family=poisson)

# --------------------------------
# ZERO-INFLATED POISSON REGRESSION

# ------------------------- 
# ROBUST POISSON REGRESSION
# helpful in the presence of outliers and influential observations 

