#
# R in action (2 ed.)
#

# ------------------------------------
# 2. Partitioning Around Medoids (PAM)
# ------------------------------------
# "Medoid" is a most representative observation
# It can accommodate mixed data types and isn’t limited to continuous variables

# Partitioning around medoids for the wine data

library(cluster)

# Clusters standardized data
set.seed(1234)
fit.pam <- pam(wine[-1], k=3, stand=TRUE)

# Print & Plot
fit.pam$medoids
clusplot(fit.pam, main="Bivariate Cluster Plot")

# not good at this
ct.pam <- table(wine$Type, fit.pam$clustering)
ct.pam
randIndex(ct.pam)
