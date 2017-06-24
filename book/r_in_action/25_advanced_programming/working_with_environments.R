#
# R in action (2 ed.)
#

# Working with environments

x <- 5
myenv <- new.env()
assign("x", "Homer", env=myenv)
ls()
ls(myenv)
x
get("x", env=myenv)

# the same
myenv <- new.env()
myenv$x <- "Homer"
myenv$x

# Parent env
parent.env(myenv)

# function closures
trim <- function(p){
  trimit <- function(x){
    n <- length(x)
    lo <- floor(n*p) + 1
    hi <- n + 1 - lo
    x <- sort.int(x, partial = unique(c(lo, hi)))[lo:hi]
  }
  trimit
}

x <- 1:10
trim10pct <- trim(.1)
y <- trim10pct(x)
y
ls(environment(trim10pct))
get("p", env=environment(trim10pct))

# ---------
makeFunction <- function(k){
  f <- function(x){
    print(x + k)
  }
}
g <- makeFunction(10)
g(4)
k <- 2
g(5)
ls(environment(g))
environment(g)$k

# 2. An example of an arbitrary generic function
# ----------------------------------------------

# 1. Defines a generic function
mymethod <- function(x, ...) UseMethod("mymethod")  
mymethod.a <- function(x) print("Using A")
mymethod.b <- function(x) print("Using B")
mymethod.default <- function(x) print("Using Default")

# 2. Assigns classes to objects
x <- 1:5
y <- 6:10
z <- 10:15
class(x) <- "a"       
class(y) <- "b"

# 3. Applies the generic function to the objects
mymethod(x)
mymethod(y)
mymethod(z)

# 4. Applies the generic function to an object with two classes
class(z) <- c("a", "b")
mymethod(z)

# 5. Generic function has no default for class "c"
class(z) <- c("c", "a", "b")    
mymethod(z)
