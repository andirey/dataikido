#
# R in action (2 ed.)
#

#
# Excluding (dropping) variables
#

source("data.R")

# 1

my_vars <- names(leadership) %in% c("q3","q4")
new_data <- leadership[ ! my_vars ]

# 2
new_data <- leadership[ c(-8, -9) ]

# 3
leadership$q3 <- leadership$q4 <- NULL

leadership
my_vars
new_data
