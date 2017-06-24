#
# R in action (2 ed.)
#

# Multiple graphs per page
# need : install.packages(gridExtra)

data(Salaries, package="car")

library(ggplot2)
library(gridExtra)

p1 <- ggplot(data=Salaries, aes(x=rank)) + geom_bar()
p2 <- ggplot(data=Salaries, aes(x=sex)) + geom_bar()
p3 <- ggplot(data=Salaries, aes(x=yrs.since.phd, y=salary)) + geom_point()

grid.arrange(p1, p2, p3, ncol=3)
