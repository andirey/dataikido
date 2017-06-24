#
# R in action (2 ed.)
#

#
# Renaming variables
#

# simple approach

source("data.R")
names(leadership)[2] <- "testDate"
names(leadership)[6:10] <- c("item1", "item2", "item3", "item4", "item5")

# plyr package

source("data.R")
library(plyr)
leadership <- rename(leadership, c(manager = "managerID", date = "testDate"))
