#
# R in action (2 ed.)
#

#
# Logistic regression
# *******************
# Predict binary outcome from a set of continuous and/or categorical 
# predictor variables
#
# Extensions: 
# 1. Robust logistic regression - outliers and influential observations
# 2. Multinomial logistic regression - more than two unordered categories
# 3. Ordinal logistic regression -  set of ordered categories
#

library(AER)

data(Affairs, package="AER")
summary(Affairs)

table(Affairs$affairs)

# create dichotomous factor "ynaffair"

Affairs$ynaffair[Affairs$affairs  > 0] <- 1
Affairs$ynaffair[Affairs$affairs == 0] <- 0

Affairs$ynaffair <- factor(Affairs$ynaffair, 
                           levels = c(0, 1), 
                           labels = c("No", "Yes"))
table(Affairs$ynaffair)

# logistic regression model

fit.full <- glm(ynaffair ~ gender + age + yearsmarried + children + 
                  religiousness + education + occupation +rating,
                data = Affairs, family = binomial())
summary(fit.full)

# leave features with "*"
fit.reduced <- glm(ynaffair ~ age + yearsmarried + religiousness + rating, 
                   data = Affairs, family = binomial())

summary(fit.reduced)

# compare two models

anova(fit.reduced, fit.full, test="Chisq")

# interpreting 

coef(fit.reduced)
exp(coef(fit.reduced))
exp(confint(fit.reduced)) 

# The odds of an extramarital affair increase with years married and decrease 
# with age, religiousness, and marital rating.

#
# 2. Assessing the impact of predictors on the probability of an outcome
#   ... on the probability of having an extramarital affair
#

# 2.1. Impact of "ratings"

testdata <- data.frame(rating=c(1, 2, 3, 4, 5), 
                       age = mean(Affairs$age),
                       yearsmarried = mean(Affairs$yearsmarried),
                       religiousness = mean(Affairs$religiousness))
testdata

#
testdata$prob <- predict(fit.reduced, newdata=testdata, type="response")
testdata

# 1=very unhappy # 5=very  happy

# 2.2. Impact of "age"

testdata <- data.frame(rating = mean(Affairs$rating),
                       age = seq(17, 57, 10),                 
                       yearsmarried = mean(Affairs$yearsmarried),
                       religiousness = mean(Affairs$religiousness))
testdata

testdata$prob <- predict(fit.reduced, newdata=testdata, type="response")
testdata


#
# 3. Overdispersion
#
# occurs when the observed variance of the response variable
# is larger than what would be expected from a binomial distribution. It
# can lead to distorted test standard errors and inaccurate tests of significance
#
# should use the "quasibinomial distribution"
#

# detect  overdispersion
# is considerably larger than 1, you have evidence of overdispersion

deviance(fit.reduced) / df.residual(fit.reduced)

fit <- glm(ynaffair ~ age + yearsmarried + religiousness + 
             rating, family = binomial(), data = Affairs)
fit.od <- glm(ynaffair ~ age + yearsmarried + religiousness +
                  rating, family = quasibinomial(), data = Affairs)
pchisq(summary(fit.od)$dispersion * fit$df.residual,  
         fit$df.residual, lower = F)

