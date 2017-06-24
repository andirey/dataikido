#
# R in action (2 ed.)
#

#
# Exploratory factor analysis (EFA)
# ---------------------------------
# Collection of methods designed to uncover the latent structure in a given set 
# of variables. It looks for a smaller set of underlying or latent constructs 
# that can explain the relationships among the observed or  manifest  variables
#

options(digits=2)

covariances <- ability.cov$cov
correlations <- cov2cor(covariances)
correlations

# Deciding how many common factors to extract

library(psych)

covariances <- ability.cov$cov
correlations <- cov2cor(covariances)
fa.parallel(correlations, n.obs=112, fa="both", n.iter=100,
              main="Scree plots with parallel analysis")

# Extracting common factors
# Principal axis factoring without rotation

fa <- fa(correlations, nfactors=2, rotate="none", fm="pa")
fa

# Rotating factors
# Factor extraction with orthogonal rotation

fa.varimax <- fa(correlations, nfactors=2, rotate="varimax", fm="pa")
fa.varimax

# Factor extraction with oblique rotation
fa.promax <- fa(correlations, nfactors=2, rotate="promax", fm="pa")
fa.promax

#
fsm <- function(oblique) {
  if (class(oblique)[2]=="fa" & is.null(oblique$Phi)) {
    warning("Object doesn't look like oblique EFA")
  } else {    
    P <- unclass(oblique$loading)
    F <- P %*% oblique$Phi
    colnames(F) <- c("PA1", "PA2")
    return(F)    
  }
}
fsm(fa.promax)
factor.plot(fa.promax, labels=rownames(fa.promax$loadings))
fa.diagram(fa.promax, simple=FALSE)

# Factor scores
fa.promax$weights
