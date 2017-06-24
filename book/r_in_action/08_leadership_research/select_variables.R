#
# R in action (2 ed.)
#

#
# Selecting (keeping) variables
#

source("data.R")

# 
# 1
newdata <- leadership[, c(6:10)] 

# 2
myvars <- c("q1", "q2", "q3", "q4", "q5") 
newdata <-leadership[myvars]

# 3
myvars <- paste("q", 1:5, sep="")
newdata <-leadership[myvars]

# view
newdata
