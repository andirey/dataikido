#
# R in action (2 ed.)
#

#
# Tests of independence
#

# 1: Chi-square test of independence

library(vcd)

# Treatment and Improved are NOT independent (p < .01)
mytable <- xtabs(~ Treatment + Improved, data = Arthritis) 
chisq.test(mytable) 

# Gender and Improved are independent (p > .05)
mytable <- xtabs(~ Improved + Sex, data = Arthritis)
chisq.test(mytable)
