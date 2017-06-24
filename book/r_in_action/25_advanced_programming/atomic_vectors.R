#
# R in action (2 ed.)
#

# ATOMIC VECTORS

# Atomic vectors are arrays that contain a single data type 
# (logical, real, complex, character, or raw)

passed <- c(TRUE, TRUE, FALSE, TRUE)
ages <- c(15, 18, 25, 14, 19)
cmplxNums <- c(1+2i, 0+1i, 39+3i, 12+2i)
names <- c("Bob", "Ted", "Carol", "Alice")

# R doesn’t have a scalar type
# A scalar is an atomic vector with a single element

k <- 2 # = k <- c(2)

# A matrix is an atomic vector that has a dimension attribute, dim, 
# containing two elements

x <- c(1,2,3,4,5,6,7,8)
class(x)
print(x)

# attribute "dim"

attr(x, "dim") <- c(2,4)
print(x)
class(x)
attributes(x)

# Row and Column Names can be attached by adding a "dimnames" attribute
attr(x, "dimnames") <- list(c("A1", "A2"), 
                            c("B1", "B2", "B3", "B4"))
print(x)

# Convert  matrix can be returned to a one-dimensional vector
attr(x, "dim") <- NULL
class(x)
print(x)
