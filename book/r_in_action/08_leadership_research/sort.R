#
# R in action (2 ed.)
#

#
# Sorting data
#

source("data.R")

newdata <- leadership[order(leadership$age),]

attach(leadership)
  newdata <- leadership[order(gender, age),]
  newdata
detach(leadership)

attach(leadership)
  newdata <-leadership[order(gender, -age),]
  newdata
detach(leadership)
