#
# R in action (2 ed.)
#

#
# Correlations
#

library(psych)
library(ggm)

# 1. Pearson product-moment correlation 
# assesses the degree of linear relationship
# between  two  quantitative  variables.  

states <- state.x77[, 1:6]

cov(states)

cor(states)

# 2. Spearman’s  rank-order  correlation  coefficient 
# assesses the degree of relationship between two rank-ordered variables. 

cor(states, method="spearman")

# 3. Kendall’s tau is also a nonparametric measure of rank correlation. 

#
# nonsquare matrices
#

x <- states[, c("Population", "Income", "Illiteracy", "HS Grad")]
y <- states[, c("Life Exp", "Murder")]
cor(x,y)

#
# Partial correlation coefficients
#

colnames(states)

# correlation between population (variable 1) and murder rate # (variable 5), 
# controlling for the influence of income, illiteracy rate, and high school
# graduation rate (variables 2, 3, and 6 respectively). 

pcor(c(1,5,2,3,6), cov(states))

# Other types of correlations -- polycor package


#
# Testing correlations for significance
#

# Testing a correlation coefficient for significance (1 correlation)

cor.test(states[,3], states[,5])

# Correlation matrix and tests of significance via corr.test()

library(psych)
corr.test(states, use="complete")
