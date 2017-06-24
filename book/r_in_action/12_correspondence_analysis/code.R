#
# R in action (2 ed.)
#

#
# Correspondence Analysis
# https://cran.r-project.org/web/packages/ca/ca.pdf

library(ca)

data("author")

ca(author)
plot(ca(author))

# table method
haireye <- margin.table(HairEyeColor, 1:2)
haireye.ca <- ca(haireye)
haireye.ca
plot(haireye.ca)

# some plot options
plot(haireye.ca, lines=TRUE)
plot(haireye.ca, arrows=c(TRUE, FALSE))
