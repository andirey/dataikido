#
# R in action (2 ed.)
#

# Nonparametric analysis and the npar package

# This is a set of analytic techniques that can be used to compare
# two or more groups on an outcome variable that’s not normally distributed, 
# or in situations where the variance of the outcome variable differs markedly 
# across groups. 


# downloading

pkg <- "npar_1.0.tar.gz"
loc <- "http://www.statmethods.net/RiA"
url <- paste(loc, pkg, sep="/")
download.file(url, pkg)
install.packages(pkg, repos=NULL, type="source")

# 1

library(npar)
hist(life$hlef, xlab="Healthy Life Expectancy (years) at Age 65",
     main="Distribution of Healthy Life Expectancy for Women", 
     col="grey", breaks=10)

# 2

library(ggplot2)
ggplot(data=life, aes(x=region, y=hlef)) + 
  geom_point(size=3, color="darkgrey") +
  labs(title="Distribution of HLE Estimates by Region",
       x="US Region", y="Healthy Life Expectancy at Age 65") +
  theme_bw()

# 3 : Comparison of HLE estimates with the npar package

library(npar)
results <- oneway(hlef ~ region, life)
summary(results)

plot(results, col="lightblue", main="Multiple Comparisons",
     xlab="US Region", 
     ylab="Healthy Life Expectancy (years) at Age 65")
