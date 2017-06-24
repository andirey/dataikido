#
# R in action (2 ed.)
#

#
# Permution tests
#

library(coin)

# 1.  Independent two-sample and k-sample tests

score <- c(40, 57, 45, 55, 58, 57, 64, 55, 62, 65)
treatment <- factor(c(rep("A",5), rep("B",5)))
mydata <- data.frame(treatment, score)
t.test(score ~ treatment, data=mydata, var.equal=TRUE)
oneway_test(score~treatment, data=mydata, distribution="exact")

# 2. Independence in contingency tables

library(coin)
library(vcd)
Arthritis <- transform(Arthritis, Improved=as.factor(as.numeric(Improved)))
set.seed(1234)
chisq_test(Treatment~Improved, data=Arthritis, distribution=approximate(B=9999))

# 3.  Independence between numeric variables

states <- as.data.frame(state.x77)
set.seed(1234)
spearman_test(Illiteracy~Murder, data=states, 
              distribution=approximate(B=9999))

# Dependent two-sample and k-sample tests

library(coin)
library(MASS)
wilcoxsign_test(U1~U2, data=UScrime, distribution="exact")

# lmPerm package
# ...

library(lmPerm)
set.seed(1234)
fit <- lmp(weight~height, data=women, perm="Prob")
