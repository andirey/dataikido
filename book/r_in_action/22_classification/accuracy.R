#
# R in action (2 ed.)
#

#
# Accuracy
#

source("22_classification/example_breast.R")


# Function for assessing binary classification accuracy

performance <- function(table, n=2){
  if(!all(dim(table) == c(2,2))) 
    stop("Must be a 2 x 2 table")
  
  # Extracts frequencies
  tn = table[1,1]                     
  fp = table[1,2]
  fn = table[2,1]
  tp = table[2,2]
  
  # Sensitivity
  sensitivity = tp/(tp+fn)              
  # Specificity
  specificity = tn/(tn+fp)
  # Positive predictive value
  ppp = tp/(tp+fp)
  # Negative predictive value
  npp = tn/(tn+fn)
  # Accuracy
  hitrate = (tp+tn)/(tp+tn+fp+fn)

result <- paste("Sensitivity = ", round(sensitivity, n) , 
                  "\nSpecificity = ", round(specificity, n),
                  "\nPositive Predictive Value = ", round(ppp, n),
                  "\nNegative Predictive Value = ", round(npp, n),
                  "\nAccuracy = ", round(hitrate, n), "\n", sep="")
  cat(result)                                       
}

performance(logit.perf)
performance(dtree.perf)
performance(ctree.perf)
performance(forest.perf)
performance(svm.perf)

