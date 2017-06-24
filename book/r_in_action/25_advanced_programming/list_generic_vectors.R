#
# R in action (2 ed.)
#

# GENERIC VECTORS OR LISTS

# Lists  are  collections  of  atomic  vectors  and/or  other  lists.  

# Data  frames  are  a  special type of list, where each atomic vector 
# in the collection has the same length

head(iris)
unclass(iris)
attributes(iris)

set.seed(1234)
fit <- kmeans(iris[1:4], 3)
names(fit)
unclass(fit)
sapply(fit, class)
