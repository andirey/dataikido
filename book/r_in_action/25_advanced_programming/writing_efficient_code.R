#
# R in action (2 ed.)
#

# Writing efficient code

# 1. Read in only the data you need
# ---------------------------------

# p.509

# 2. Use vectorization rather than loops whenever possible
# --------------------------------------------------------

set.seed(1234)
mymatrix <- matrix(rnorm(10000000), ncol=10)

accum <- function(x){
  sums <- numeric(ncol(x))
  for (i in 1:ncol(x)){
    for(j in 1:nrow(x)){
      sums[i] <- sums[i] + x[j,i]
    }
  }
}

# with a for-loop
system.time(accum(mymatrix))

# ! with colSums !
system.time(colSums(mymatrix))

# 3. Create objects of the correct size, rather than resizing repeatedly
# ----------------------------------------------------------------------

set.seed(1234)
k <- 100000
x <- rnorm(k)

# 1st approach
y <- 0
system.time(for (i in 1:length(x)) y[i] <- x[i]^2)

# 2nd approach (!)
y <- numeric(length=k)
system.time(for (i in 1:k) y[i] <- x[i]^2)

# 3rd approach (vectorisation)
y <- numeric(length=k)
system.time(y <- x^2)

# 4. Use parallelization for repetitive, independent tasks
# --------------------------------------------------------
# Example: Parallelization with foreach and doParallel

# Loads packages and registers the number of cores
library(foreach)
library(doParallel)
registerDoParallel(cores=4)

# Defines the function
eig <- function(n, p){                            
  x <- matrix(rnorm(100000), ncol=100)
  r <- cor(x)
  eigen(r)$values
} 
n <- 1000000 
p <- 100
k <- 500

# Executes normally
system.time(x <- foreach(i=1:k, .combine=rbind) %do% eig(n, p))   

# Executes in parallel
system.time(x <- foreach(i=1:k, .combine=rbind) %dopar% eig(n, p))
