#
# R in action (2 ed.)
#

#
# Logistic regression 
# --------------------
# 1. Type of generalized linear model that is often used to predict a
# binary  outcome  from  a  set  of  numeric  variables
# 
# 2. Categorical predictors (factors) are automatically replaced with 
# a set of dummy coded variables.
#

# Load data
source("22_classification/example_breast.R")

# Fits the logistic regression
fit.logit <- glm(class~., data=df.train, family=binomial())
summary(fit.logit)

# Classifies new cases
prob <- predict(fit.logit, df.validate, type="response")
logit.pred <- factor(prob > .5, levels=c(FALSE, TRUE), labels=c("benign", "malignant"))

# Evaluates the predictive accuracy
logit.perf <- table(df.validate$class, logit.pred, dnn=c("Actual", "Predicted"))
logit.perf

# Stepwise logistic regression 
# ----------------------------
logit.fit.reduced <- step(fit.logit)

prob <- predict(logit.fit.reduced, df.validate, type="response")
logit.pred <- factor(prob > .5, levels=c(FALSE, TRUE), labels=c("benign", "malignant"))
logit.perf <- table(df.validate$class, logit.pred, dnn=c("Actual", "Predicted"))
logit.perf

