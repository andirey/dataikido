#
# R in action (2 ed.)
#

#
# Cluster Analysis
#

# 1. hierarchical agglomerative clustering
# 2. partitioning clustering

library(cluster)
library(ggplot2)
library(rattle)
library(fMultivar)
library(flexclust)
library(NbClust)

data(nutrient, package="flexclust")
head(nutrient, 4)

d <- dist(nutrient)
as.matrix(d)[1:4, 1:4]
