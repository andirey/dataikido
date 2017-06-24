#
# R in action (2 ed.)
#

#
# Line charts
#

#
# 1. Creating side-by-side scatter and line plots
#

opar <- par(no.readonly=TRUE)
par(mfrow = c(1,2))
t1 <- subset(Orange, Tree==1)

plot(t1$age, t1$circumference, 
     xlab="Age (days)", 
     ylab="Circumference (mm)", 
     main="Orange Tree 1 Growth")

plot(t1$age, t1$circumference, 
     xlab="Age (days)",
     ylab="Circumference (mm)",
     main="Orange Tree 1 Growth", 
     type="b")
par(opar)

#
# 2. Line chart displaying the growth of five orange trees over time
#

Orange$Tree <- as.numeric(Orange$Tree)  
ntrees <- max(Orange$Tree)

xrange <- range(Orange$age)                               
yrange <- range(Orange$circumference)

plot(xrange, yrange,                                     
     type="n",                                                  
     xlab="Age (days)",                                   
     ylab="Circumference (mm)"                          
) 

colors <- rainbow(ntrees)                                 
linetype <- c(1:ntrees)                                    
plotchar <- seq(18, 18+ntrees, 1)

for (i in 1:ntrees) {                 
  tree <- subset(Orange, Tree==i)                      
  lines(tree$age, tree$circumference,                  
        type="b",                                     
        lwd=2,                                         
        lty=linetype[i],                                
        col=colors[i],                                  
        pch=plotchar[i]                                
  )                                                     
}   

title("Tree Growth", "example of line plot")  

legend(xrange[1], yrange[2],                          
       1:ntrees,                              
       cex=0.8,                            
       col=colors,                        
       pch=plotchar,                      
       lty=linetype,                   
       title="Tree"                       
) 
