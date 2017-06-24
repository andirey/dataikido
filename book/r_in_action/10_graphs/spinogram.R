#
# R in action (2 ed.)
#

# Spinogram

library(vcd)

attach(Arthritis)
counts <- table(Treatment, Improved)
spine(counts, main="Spinogram Example")
detach(Arthritis)
