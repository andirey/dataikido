#
# R in action (2 ed.)
#

#
# Descriptive statistics by group
#

# 1: using aggregate()

myvars <- c("mpg", "hp", "wt")

aggregate(mtcars[myvars], by=list(am=mtcars$am), mean)
aggregate(mtcars[myvars], by=list(am=mtcars$am), sd)

# 2:  using by()

mystats <- function(x, na.omit=FALSE) {
  if (na.omit) x <- x[!is.na(x)]
  m <- mean(x)
  n <- length(x)
  s <- sd(x)
  skew <- sum((x-m)^3/s^3)/n
  kurt <- sum((x-m)^4/s^4)/n - 3
  return(c(n=n, mean=m, stdev=s, skew=skew, kurtosis=kurt))
}

dstats <- function(x) sapply(x, mystats)
myvars <- c("mpg", "hp", "wt")
by(mtcars[myvars], mtcars$am, dstats)

# 3: using summaryBy() in the doBy package

library(doBy)
summaryBy(mpg+hp+wt ~ am, data=mtcars, FUN=mystats)

# 4: using describe.by() in the psych package

library(psych)
myvars <- c("mpg", "hp", "wt")
describeBy(mtcars[myvars], list(am=mtcars$am))


