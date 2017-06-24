#
# R in action (2 ed.)
#

# ANOVA as regression

library(multcomp)
levels(cholesterol$trt)

fit.aov <- aov(response ~ trt, data=cholesterol)
summary(fit.aov)

fit.lm <- lm(response ~ trt, data=cholesterol)
summary(fit.lm)

contrasts(cholesterol$trt)

fit.lm <- lm(response ~ trt, data=cholesterol, contrasts="contr.helmert")
options(contrasts = c("contr.SAS", "contr.helmert"))
