#
# R in action (2 ed.)
#


#
# Support Vector Machines (SVM)
#
# 1. Seek an optimal hyperplane for separating two classes in a multidimensional space.
#
# 2. Unlike the random forest approach, the SVM is also unable
# to accommodate missing predictor values when classifying new cases
#
# 3. Good at situations in which the number of variables is much larger than
# the number of observations
#
# 4. Drawback -  the resulting classification rules
# are difficult to understand and communicate


# Load data
source("22_classification/example_breast.R")

library(e1071)
set.seed(1234)
fit.svm <- svm(class~., data=df.train)
fit.svm

svm.pred <- predict(fit.svm, na.omit(df.validate))

svm.perf <- table(na.omit(df.validate)$class, 
                  svm.pred, dnn=c("Actual", "Predicted"))
svm.perf

# Tuning an RBF support vector machine
set.seed(1234)
tuned <- tune.svm(class~., data=df.train, 
                  gamma=10^(-6:1),
                  cost=10^(-10:10))
tuned 

# Fits the model with these parameters
fit.svm <- svm(class~., data=df.train, gamma=.01, cost=1)   
svm.pred <- predict(fit.svm, na.omit(df.validate))   
svm.perf <- table(na.omit(df.validate)$class, 
                    svm.pred, dnn=c("Actual", "Predicted"))
svm.perf 

