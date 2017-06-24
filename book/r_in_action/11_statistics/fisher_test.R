#
# R in action (2 ed.)
#

#
# Fisher's exact test of independence
#
# 1. Evaluates the null hypothesis of independence of rows and columns 
# in a contingency  table  with  fixed  marginals
#
# 2. Can be applied to any two-way table with two or more rows and columns, 
# not a 2 × 2 table
#

library(vcd)

# 1: Treatment and Improved are NOT independent (p < .01)

mytable <- xtabs(~ Treatment + Improved, data = Arthritis) 
fisher.test(mytable)

# 2: Gender and Imprived are independent (p > .05)

mytable <- xtabs(~ Improved + Sex, data = Arthritis)
chisq.test(mytable)
