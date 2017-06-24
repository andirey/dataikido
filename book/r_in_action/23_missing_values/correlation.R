#
# R in action (2 ed.)
#


# Using correlations to explore missing values

x <- as.data.frame(abs(is.na(sleep)))

head(sleep, n=5)
head(x, n=5)

# extracts the variables that have some (but not all) missing values
y <- x[which(apply(x,2,sum)>0)]

#  correlations among these indicator variables
cor(y)

# relationship between missing values in a variable and
# the observed values on other variables
cor(sleep, y, use="pairwise.complete.obs")
