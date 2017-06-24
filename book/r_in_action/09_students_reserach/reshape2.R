#
# R in action (2 ed.)
#

#
# reshape2
#

library(reshape2)

# Data creation

id <- c(1,1,2,2)
time <- c(1,2,1,2)
x1 <- c(5,3,6,2)
x2 <- c(6,5,1,4)

df <- data.frame(id, time, x1, x2)

#
# Melting
#
# When you melt a dataset, you restructure it into a format in which 
# each measured variable is in its own row 
# along with the ID variables needed to uniquely identify it

md <- melt(df, id=c("id", "time"))
md

#
# Recast data in melted form
#

dcast(md, time ~ variable, mean)

