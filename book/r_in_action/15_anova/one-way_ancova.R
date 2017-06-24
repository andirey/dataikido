#
# R in action (2 ed.)
#

#
# One-way ANCOVA
#

data(litter, package="multcomp")
attach(litter)
  table(dose)
  aggregate(weight, by=list(dose), FUN=mean)

  fit <- aov(weight ~ gesttime + dose)
  summary(fit)

  library(effects)
  effect("dose", fit)

detach(litter)
