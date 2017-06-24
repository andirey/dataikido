#
# R in action (2 ed.)
#

#
# Principal components analysis (PCA)
# -----------------------------------
# Data-reduction technique that transforms a larger number of correlated 
# variables into a much smaller set of uncorrelated variables called 
# principal components
#

# Example 1

library(psych)

# 1. Selecting the number of components to extract

fa.parallel(USJudgeRatings[, -1], 
            fa          = "pc", 
            n.iter      = 100, 
            show.legend = FALSE, 
            main        = "Scree plot with parallel analysis")

# 2. Extracting principal components

pc <- principal(USJudgeRatings[, -1], nfactors = 1)
pc

# Example 2

fa.parallel(Harman23.cor$cov, 
            n.obs       = 302, 
            fa          = "pc",
            n.iter      = 100,
            show.legend = FALSE,
            main        = "Scree plot with parallel analysis")

# Principal components analysis of body measurements

pc <- principal(Harman23.cor$cov, nfactors=2, rotate="none")
pc

# Rotating principal components
# Principal components analysis with varimax rotation
rc <- principal(Harman23.cor$cov, nfactors=2, rotate="varimax")
rc

# Obtaining principal components scores
pc <- principal(USJudgeRatings[,-1], nfactors=1, score=TRUE)
head(pc$scores)
cor(USJudgeRatings$CONT, pc$score)

# Obtaining principal component scoring coefficients
rc <- principal(Harman23.cor$cov, nfactors=2, rotate="varimax")
round(unclass(rc$weights), 2)
