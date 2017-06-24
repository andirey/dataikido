#
# R in action (2 ed.)
#

#
# Multiple comparisons employing user-supplied contrasts
#

library(multcomp)

contrast <- rbind("no drug vs. drug" = c(3, -1, -1, -1))
summary(glht(fit, linfct=mcp(dose=contrast)))

# Testing for homogeneity of regression slopes

fit2 <- aov(weight ~ gesttime*dose, data=litter)
summary(fit2)
