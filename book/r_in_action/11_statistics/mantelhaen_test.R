#
# R in action (2 ed.)
#

#
# Cochran–Mantel–Haenszel chi-square
# test of the null hypothesis that two nominal variables are conditionally independent in
# each  stratum  of  a  third  variable
#

mytable <- xtabs(~Treatment+Improved+Sex, data=Arthritis)
mantelhaen.test(mytable)
