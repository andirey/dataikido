#
# R in action (2 ed.)
#

#
# Decision trees
# 2. Conditional inference trees
# variables and splits are selected based on significance tests rather than 
# purity/homogeneity measures. The significance tests are permutation tests
#
# pruning isn’t required for conditional inference trees, and the process is
# somewhat  more  automated

# Load data
source("22_classification/example_breast.R")

library(party)

fit.ctree <- ctree(class~., data=df.train)

plot(fit.ctree, main="Conditional Inference Tree")

ctree.pred <- predict(fit.ctree, df.validate, type="response")

ctree.perf <- table(df.validate$class, ctree.pred, dnn=c("Actual", "Predicted"))
ctree.perf

