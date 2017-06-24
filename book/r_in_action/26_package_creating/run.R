#
# R in action (2 ed.)
#

# need https://cran.r-project.org/bin/windows/Rtools/

library(roxygen2)
roxygenize("npar")

system("R CMD build npar")
system("Rcmd INSTALL --build npar")
