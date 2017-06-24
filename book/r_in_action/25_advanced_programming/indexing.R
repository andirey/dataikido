#
# R in action (2 ed.)
#

# Indexing

# 1. atomic  vector  without  named elements
x <- c(20, 30, 40)
x[3]
x[c(2,3)]

# 2. atomic vector with named elements
x <- c(A=20, B=30, C=40)
x[c(2,3)]
x[c("B", "C")]

# lists
set.seed(1234)
fit <- kmeans(iris[1:4], 3)
fit[c(2,7)]
fit[2] # return "list"
fit[[2]] # return "matrix"

fit$centers

#  Notations can be combined to obtain the elements within components

fit[[2]][1,]


# ------------------------------------------------------
# Plotting the centroids from a k-means cluster analysis
# ------------------------------------------------------
library(reshape2)                           

set.seed(1234)
fit <- kmeans(iris[1:4], 3)     
means <- fit$centers

dfm <- melt(means)
names(dfm) <- c("Cluster", "Measurement", "Centimeters")
dfm$Cluster <- factor(dfm$Cluster)
head(dfm)

library(ggplot2)        
ggplot(data=dfm, 
       aes(x=Measurement, y=Centimeters, group=Cluster)) + 
  geom_point(size=3, aes(shape=Cluster, color=Cluster)) +
  geom_line(size=1, aes(color=Cluster)) +
  ggtitle("Profiles for Iris Clusters")
