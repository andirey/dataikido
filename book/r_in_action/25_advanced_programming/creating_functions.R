#
# R in action (2 ed.)
#

# Creating functions

# Almost everything in R is a function
#  "+"(2,2) = 2+2

f <- function(x, y, z=1){
  result <- x + (2*y) + (3*z)
  return(result)
}

f(2,3)
f(2,3,4)
f(x=2, y=3)
f(z=4, y=2, 3)

# if "return" is missing, the results of the last statement are returned

#
args(f)

# Object scope
x <- 2; y <- 3; z <- 4
f <- function(w){ z <- 2;   x <- w*y*z; return(x) }
f(x)
x;y;z
