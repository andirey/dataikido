#
# R in action (2 ed.)
#

#
# ANOVA
#

# 1. One-way ANOVA
# comparing the dependent variable means of
# two or more groups defined by a categorical grouping factor

library(multcomp)

attach(cholesterol)
  table(trt)
  aggregate(response, by=list(trt), FUN=mean) 
  aggregate(response, by=list(trt), FUN=sd)

  fit <- aov(response ~ trt)  
  summary(fit)

  library(gplots)
  plotmeans(response ~ trt, 
            xlab="Treatment", ylab="Response", main="Mean Plot\nwith 95% CI")
detach(cholesterol)

#
# 2. Multiple comparisons
# Tukey HSD pairwise group comparisons

TukeyHSD(fit)

par(las=2)
par(mar=c(5,8,4,2)) 
plot(TukeyHSD(fit))

# 2
library(multcomp)
par(mar=c(5,4,6,2))
tuk <- glht(fit, linfct=mcp(trt="Tukey"))
plot(cld(tuk, level=.05),col="lightgrey")

# Assessing test assumptions

library(car)
qqPlot(lm(response ~ trt, data=cholesterol), 
       simulate=TRUE, main="Q-Q Plot", labels=FALSE)

bartlett.test(response ~ trt, data=cholesterol)

# test for outliers
library(car)
outlierTest(fit)
