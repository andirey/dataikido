#
# R in action (2 ed.)
#

#
# Normal distribution [-3, 3]
#

x <- pretty(c(-3, 3), 30)

y <- dnorm(x)

plot(x, y, type = "l", xlab="Normal Deviative", ylab="Density", yaxs="i")
