#
# R in action (2 ed.)
#

#
# How define impossible values ?
#

x <- c(0, NaN, 1, sin(Inf))

is.nan(x)
