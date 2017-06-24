#
# R in action (2 ed.)
#

#
# Decision trees
# 1. Classical decision trees
# 2. Conditional inference trees
#
# Decision trees can be biased toward selecting predictors that have
# many levels or many missing values


# Load data
source("22_classification/example_breast.R")

# 1. Classical decision trees
# Creating a classical decision tree with rpart()

# Grows the tree
library(rpart)
set.seed(1234)
dtree <- rpart(class ~ ., data=df.train, method="class", 
               parms=list(split="information"))
dtree$cptable
plotcp(dtree)

# Prunes the tree
# cp = complexity parameter
dtree.pruned <- prune(dtree, cp=.0125)

library(rpart.plot)
prp(dtree.pruned, type = 2, extra = 104,  
    fallen.leaves = TRUE, main="Decision Tree")

# Classifies new cases
dtree.pred <- predict(dtree.pruned, df.validate, type="class")
dtree.perf <- table(df.validate$class, dtree.pred, 
                    dnn=c("Actual", "Predicted"))
dtree.perf
