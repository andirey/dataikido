#
# R in action (2 ed.)
#

#
# stopifnot
#

# 1

triangular <- function(n) {
  stopifnot(all(n > 0))
  return(0.5 * n * (n+1))
}

triangular(1:5)

# 2

library(assertive)
triangular <- function(n) {
  assert_all_are_positive(n)
  stopifnot(all(n > 0))
  return(0.5 * n * (n+1))
}



