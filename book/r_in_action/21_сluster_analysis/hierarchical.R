#
# R in action (2 ed.)
#

#
# Hierarchical Cluster Analysis
#  > single linkage
#  > complete linkage
#  > average linkage
#  > centroid
#  > Ward’s method
#  * The primary difference among hierarchical clustering algorithms 
#    is their definitions of cluster distances 
#
# It is difficult to apply in large samples, 
# where there may be hundreds or even thousands of observations.
# Partitioning methods can work well in these situations.

# --------------------------------------------------
# 1. Average-linkage clustering of the nutrient data
# --------------------------------------------------

data(nutrient, package="flexclust")
row.names(nutrient) <- tolower(row.names(nutrient))

# Standardize to mean=0, standard deviation=1
nutrient.scaled <- scale(nutrient)         

# calculta distances
d <- dist(nutrient.scaled)

# clustering
fit.average <- hclust(d, method="average")                          

# polt dendogram
plot(fit.average, hang=-1, cex=.8, main="Average Linkage Clustering")

# -----------------------------------
# 2. Selecting the number of clusters
# -----------------------------------

library(NbClust)

devAskNewPage(ask=TRUE)
nc <- NbClust(nutrient.scaled, distance="euclidean", 
              min.nc=2, max.nc=15, method="average")
table(nc$Best.n[1,])

barplot(table(nc$Best.n[1,]), 
        xlab="Numer of Clusters", ylab="Number of Criteria",
        main="Number of Clusters Chosen by 26 Criteria")

# ---------------------------------------
# 3. Obtaining the final cluster solution
# ---------------------------------------

# Assigns cases
clusters <- cutree(fit.average, k=5)
table(clusters)

# Describes clusters
aggregate(nutrient, by = list(cluster = clusters), median)
aggregate(as.data.frame(nutrient.scaled), by=list(cluster=clusters), median)

# Plots results
plot(fit.average, hang=-1, cex=.8, main="Average Linkage Clustering\n5 Cluster Solution")
rect.hclust(fit.average, k=5)
