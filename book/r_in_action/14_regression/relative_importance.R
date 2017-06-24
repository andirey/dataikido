#
# R in action (2 ed.)
#

#
# Relative importance
#

# obtain the standardized regression coefficients in R by standardizing each of the
# variables in your dataset to a mean of 0 and standard deviation of 1 using the scale()
# function, before submitting the dataset to a regression analysis

#
# 1. scale()
#

states <- as.data.frame(state.x77[,c("Murder", "Population", 
                                       "Illiteracy", "Income", "Frost")])

zstates <- as.data.frame(scale(states))

zfit <- lm(Murder ~ Population + Income + Illiteracy + Frost, data=zstates)

coef(zfit)

# Illiteracy is the most important predictor and Frost is the least

#
# 2. relweights() for calculating relative importance of predictors
#

relweights <- function(fit,...){                         
  R <- cor(fit$model)   
  nvar <- ncol(R)          
  rxx <- R[2:nvar, 2:nvar] 
  rxy <- R[2:nvar, 1]      
  svd <- eigen(rxx)        
  evec <- svd$vectors                           
  ev <- svd$values         
  delta <- diag(sqrt(ev))  
  lambda <- evec %*% delta %*% t(evec)
  lambdasq <- lambda ^ 2   
  beta <- solve(lambda) %*% rxy           
  rsquare <- colSums(beta ^ 2)                   
  rawwgt <- lambdasq %*% beta ^ 2    
  import <- (rawwgt / rsquare) * 100 
  import <- as.data.frame(import)
  row.names(import) <- names(fit$model[2:nvar])   
  names(import) <- "Weights"
  import <- import[order(import),1, drop=FALSE]
  dotchart(import$Weights, labels=row.names(import),
           xlab="% of R-Square", pch=19,
           main="Relative Importance of Predictor Variables", 
           sub=paste("Total R-Square=", round(rsquare, digits=3)),
           ...)  
  return(import)
}

# using

states <- as.data.frame(state.x77[,c("Murder", "Population", 
                                     "Illiteracy", "Income", "Frost")])
fit <- lm(Murder ~ Population + Illiteracy + Income + Frost, data=states)
relweights(fit, col="blue")