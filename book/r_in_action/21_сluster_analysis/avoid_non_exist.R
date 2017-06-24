#
# R in action (2 ed.)
#

#
# Avoiding nonexistent clusters
#

library(fMultivar)
library(NbClust)

set.seed(1234)
df <- rnorm2d(1000, rho=.5)
df <- as.data.frame(df)
plot(df, main="Bivariate Normal Distribution with rho=0.5")

# finding clusters
wssplot(df)
nc <- NbClust(df, min.nc=2, max.nc=15, method="kmeans")
dev.new()
barplot(table(nc$Best.n[1,]), 
        xlab="Number of Clusters", ylab="Number of Criteria",
        main="Number of Clusters Chosen by 26 Criteria")

# 2-cluster analysis with PMA
library(ggplot2)
library(cluster)

fit <- pam(df, k=2)
df$clustering <- factor(fit$clustering)
ggplot(data=df, aes(x=V1, y=V2, color=clustering, shape=clustering)) +
  geom_point() + ggtitle("Clustering of Bivariate Normal Data")

# Cubic Cluster Criteria (CCC) reported by NbClust can often help to uncover 
# situations where no structure exists

plot(nc$All.index[,4], type="o", ylab="CCC",
     xlab="Number of clusters", col="blue")
