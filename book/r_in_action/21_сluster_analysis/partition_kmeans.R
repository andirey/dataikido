#
# R in action (2 ed.)
#

#
# Partitioning cluster analysis
#  > k-means
#  > partitioning around medoids (PAM)
#
# Observations are divided into K groups and reshuffled to form 
# the most cohesive clusters possible according to a given criterion

# ----------
# 1. k-means
# ----------
# All  variables  must  be  continuous
# Approach  can  be  severely affected by outliers

wssplot <- function(data, nc=15, seed=1234) {
  wss <- (nrow(data)-1) * sum(apply(data, 2, var))
  for (i in 2:nc) {
    set.seed(seed)
    wss[i] <- sum(kmeans(data, centers=i)$withinss) 
  }
  plot(1:nc, wss, type="b", xlab="Number of Clusters",
       ylab="Within groups sum of squares")
}

data(wine, package="rattle")
head(wine)

df <- scale(wine[-1])

# Determines the number of clusters
wssplot(df)

library(NbClust)
set.seed(1234)
devAskNewPage(ask=TRUE)
nc <- NbClust(df, min.nc=2, max.nc=15, method="kmeans")
table(nc$Best.n[1,])

barplot(table(nc$Best.n[1,]), 
        xlab="Number of Clusters", ylab="Number of Criteria",
        main="Number of Clusters Chosen by 26 Criteria") 

# Performs the k-means cluster analysis
set.seed(1234)
fit.km <- kmeans(df, 3, nstart=25)
fit.km$size
fit.km$centers 
aggregate(wine[-1], by=list(cluster=fit.km$cluster), mean)

# check quality of clustering
# 1
ct.km <- table(wine$Type, fit.km$cluster)
ct.km
# 2 Rand index
library(flexclust)
randIndex(ct.km)


