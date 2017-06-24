#
# R in action (2 ed.)
#

#
# Basic Statistics
#

# 1: Descriptive statistics

myvars <- c("mpg", "hp", "wt")

head(mtcars[myvars])
summary(mtcars[myvars])

# 2: custom function

mystats <- function(x, na.omit=FALSE) {
  if (na.omit) x <- x[!is.na(x)]
  m <- mean(x)
  n <- length(x)
  s <- sd(x)
  skew <- sum((x-m)^3/s^3)/n
  kurt <- sum((x-m)^4/s^4)/n - 3
  return(c(n=n, mean=m, stdev=s, skew=skew, kurtosis=kurt))
}

sapply(mtcars[myvars], mystats)

# 3: Descriptive statistics via describe() in the Hmisc package

library(Hmisc)
myvars <- c("mpg", "hp", "wt")
describe(mtcars[myvars])

# 4:  Descriptive statistics via stat.desc() in the pastecs package 

library(pastecs)
myvars <- c("mpg", "hp", "wt")
stat.desc(mtcars[myvars])

# 5: Descriptive statistics via describe() in the psych package

library(psych)
myvars <- c("mpg", "hp", "wt")
describe(mtcars[myvars])

