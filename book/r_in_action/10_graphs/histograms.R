#
# R in action (2 ed.)
#

#
# Histograms
#

par(mfrow=c(2,2))

# Simple

hist(mtcars$mpg)

# With specified bins and colors

hist(mtcars$mpg,                 
     breaks=12,    
     col="red",    
     xlab="Miles Per Gallon",    
     main="Colored histogram with 12 bins")
  
# With a rug plot

hist(mtcars$mpg,                     
     freq=FALSE,    
     breaks=12,    
     col="red",    
     xlab="Miles Per Gallon",    
     main="Histogram, rug plot, density curve")    
rug(jitter(mtcars$mpg))    
lines(density(mtcars$mpg), col="blue", lwd=2)  

# With a normal curve and frame

x <- mtcars$mpg                        
h<-hist(x,
        breaks=12,    
        col="red",    
        xlab="Miles Per Gallon",    
        main="Histogram with normal curve and box")    

xfit<-seq(min(x), max(x), length=40)    

yfit<-dnorm(xfit, mean=mean(x), sd=sd(x))    
yfit <- yfit*diff(h$mids[1:2])*length(x)    

lines(xfit, yfit, col="blue", lwd=2)    
box() 

