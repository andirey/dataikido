#
# R in action (2 ed.)
#

# Object-oriented programming

# 1. Generic functions (testing)
# ------------------------------

summary(women)
fit <- lm(weight ~ height, data=women)
summary(fit)

summary
class(women)
class(fit)

methods(summary)

summary.data.frame
getAnywhere(summary.ecdf)
