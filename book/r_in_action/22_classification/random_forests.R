#
# R in action (2 ed.)
#

#
# Random forests
#
# 1. A random forest is an ensemble learning approach to supervised learning
# 2. It provides  a  natural  measure  of  variable importance

# Load data
source("22_classification/example_breast.R")

# Grows the forest
library(randomForest)
set.seed(1234)
fit.forest <- randomForest(class~., 
                           data=df.train, 
                           na.action=na.roughfix, #replace missing values
                           # ntree=500, # by default
                           importance=TRUE)
fit.forest

# cforest() - using  conditional  inference  trees

# Determines variable importance
importance(fit.forest, type=2) 

# Classifies new cases
forest.pred <- predict(fit.forest, df.validate) 
forest.perf <- table(df.validate$class, forest.pred, dnn=c("Actual", "Predicted"))
forest.perf
