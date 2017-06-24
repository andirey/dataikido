#
# R in action (2 ed.)
#

#
# t-tests
#

library(MASS)

str(UScrime)

# Compares Southern (group 1) and non-Southern (group 0) states 
# on the probability of imprisonment using a two-tailed test 
# without the assumption of equal variances

# 1. Dependent t-test: 
  
t.test(Prob ~ So, data = UScrime)

# 2. Dependent t-test: 
# assumes that the difference between groups is normally distributed. 

sapply(UScrime[c("U1","U2")], function(x)(c(mean=mean(x), sd=sd(x))))

with(UScrime, t.test(U1, U2, paired=TRUE))

#
# 3. Comparing two groups
#

with(UScrime, by(Prob, So, median))
wilcox.test(Prob ~ So, data=UScrime)

sapply(UScrime[c("U1","U2")], median)
with(UScrime, wilcox.test(U1, U2, paired=TRUE))

#
# 4. Comparing more than two groups
#

states <- data.frame(state.region, state.x77)

kruskal.test(Illiteracy ~ state.region, data=states)

# Visualizing group differences
