#
# R in action (2 ed.)
#

#
# How exclude missing values from analyse ?
#

# Data with NA value
x <- c(1, 2, NA, 3)

# The result will be NA
sum(x)

# Use na.omit option for correct result
sum(x, na.rm=TRUE)

