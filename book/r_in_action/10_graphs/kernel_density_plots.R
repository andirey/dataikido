#
# R in action (2 ed.)
#

#
# Kernel density plots
#

par(mfrow=c(2,1))

# simple
d <- density(mtcars$mpg)
plot(d)

# with titles
d <- density(mtcars$mpg)                                   
plot(d, main="Kernel Density of Miles Per Gallon") 
polygon(d, col="red", border="blue") 
rug(mtcars$mpg, col="brown")

#
# Comparative kernel density plots
#

library(sm)   

attach(mtcars)
  # Creates a grouping factor
  cyl.f <- factor(mtcars$cyl, levels= c(4,6,8),      
                labels = c("4 cylinder", "6 cylinder", "8 cylinder"))
  
  # Plots the densities
  sm.density.compare(mpg, cyl, xlab="Miles Per Gallon") 
  title(main="MPG Distribution by Car Cylinders")

  # Adds a legend via mouse click
  colfill<-c(2:(1+length(levels(cyl.f))))        
  legend(locator(1), levels(cyl.f), fill=colfill)

detach(mtcars)

