#
# R in action (2 ed.)
#

#
# Aggregate
#

mtcars

options(digits=3)

attach(mtcars)
  agg_data <- aggregate(mtcars, by = list(mtcars$cyl, mtcars$gear), FUN=mean, na.rm=TRUE)
  agg_data
detach(mtcars)