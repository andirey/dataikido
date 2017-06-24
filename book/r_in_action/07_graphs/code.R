#
# R in action (2 ed.)
#

# Graphs

attach(mtcars)
  plot(wt, mpg)
  abline(lm(mpg ~ wt))
  title("Regression of MPG on Weight")
detach(mtcars)

# save as a graph
pdf("07_graphs/mygraph.pdf")
  attach(mtcars)
    plot(wt, mpg)
    abline(lm(mpg ~ wt))
    title("Regression of MPG on Weight")
  detach(mtcars)
dev.off()

# Patient responses to two drugs at five dosage levels
dose  <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)
plot(dose, drugA, type="b")

# set parameters
opar <- par(no.readonly=TRUE)  # copy of current settings
par(lty=2, pch=17)             # changes
plot(dose, drugA, type="b")   
par(opar)

# the same
plot(dose, drugA, type="b", lty=2, pch=17)

#
plot(dose, drugA, type="b", lty=3, lwd=3, pch=15, cex=2)
