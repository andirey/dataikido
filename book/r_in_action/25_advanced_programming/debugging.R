#
# R in action (2 ed.)
#

# Debugging

# A sample debugging session

# Views the formal arguments
args(mad)
debug(mad)
mad(1:10)
undebug(mad)

# Sample debugging session with recover()
f <- function(x, y){     
  z <- x + y
  g(z)
}
g <- function(x){
  z <- round(x)
  h(z)
}
h <- function(x){
  set.seed(1234)
  z <- rnorm(x)
  print(z)
}
options(error=recover)
f(2,3)
f(2, -3)
