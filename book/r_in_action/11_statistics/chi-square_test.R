#
# R in action (2 ed.)
#

#
# Chi-square test of independence
#

library(vcd)

# 1: Treatment and Improved are NOT independent ((p < .01)

mytable <- xtabs(~ Treatment + Improved, data = Arthritis) 
chisq.test(mytable)

# 2: Gender and Imprived are independent (p > .05)

mytable <- xtabs(~ Improved + Sex, data = Arthritis)
chisq.test(mytable)
