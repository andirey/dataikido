#
# Install packages used in the book
#

# 1. Install packages from CRAN
install.packages("akima")
install.packages("chron")
install.packages("mcmc")
install.packages("spdep")
install.packages("spatstat")
install.packages("tree")

# 2. Install packages from Github
install_github("lme4/lme4", dependencies=TRUE)

# 3. This package is updated
# install.packages("odesolve")
install.packages("deSolve")


