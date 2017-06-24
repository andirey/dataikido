#
# R in action (2 ed.)
#

#
# Random samples
#

source("data.R")

my_sample <- leadership[ sample(1:nrow(leadership), 3, replace=FALSE), ]

my_sample


