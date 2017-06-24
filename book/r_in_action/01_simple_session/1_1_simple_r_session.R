#
# R in action (2 ed.)
#

# Listing 1.1: A sample R session

# 1. Vectors
age <- c(1,3,5,2,11,9,3,9,12,3)
weight <- c(4.4,5.3,7.2,5.2,8.5,7.3,6.0,10.4,10.2,6.1)

# 2. Stats
mean(weight)
sd(weight)
cor(age,weight)

# 3. Plot
plot(age,weight)
