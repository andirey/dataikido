#
# R in action (2 ed.)
#

#
# Measures of association
#
# In  general,  larger  magnitudes  indicate  stronger  associations
#

library(vcd)

mytable <- xtabs(~Treatment+Improved, data=Arthritis)

assocstats(mytable)
