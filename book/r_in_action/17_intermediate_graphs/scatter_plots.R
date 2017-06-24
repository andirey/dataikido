#
# R in action (2 ed.)
#

#
# Scatter plots
#

# #1: A scatter plot with best-fit lines
attach(mtcars)                                                     
  plot(wt, mpg, 
     main="Basic Scatter plot of MPG vs. Weight",                    
     xlab="Car Weight (lbs/1000)", 
     ylab="Miles Per Gallon ", pch=19)  
  abline(lm(mpg ~ wt), col="red", lwd=2, lty=1)
  # lowess() - add a smoothed line
  lines(lowess(wt, mpg), col="blue", lwd=2, lty=2)
detach(mtcars)

# 2
library(car) 
scatterplot(mpg ~ wt | cyl, data=mtcars, lwd=2, span=0.75,
            main="Scatter Plot of MPG vs. Weight by # Cylinders", 
            xlab="Weight of Car (lbs/1000)", 
            ylab="Miles Per Gallon",
            legend.plot=TRUE,
            id.method="identify", 
            labels=row.names(mtcars),
            boxplots="xy"
)

# Scatter-plot matrices

pairs( ~ mpg + disp + drat + wt, data = mtcars, main = "Basic Scatter Plot Matrix")

pairs( ~ mpg + disp + drat + wt, data = mtcars, main = "Basic Scatter Plot Matrix",
       upper.panel=NULL)

# with a "car" package

library(car)

scatterplotMatrix(~ mpg + disp + drat + wt, data=mtcars, 
                  spread=FALSE, smoother.args=list(lty=2), 
                  main="Scatter Plot Matrix via car Package")

#
# High-density scatter plots
#

set.seed(1234)
n <- 10000
c1 <- matrix(rnorm(n, mean=0, sd=.5), ncol=2)
c2 <- matrix(rnorm(n, mean=3, sd=2), ncol=2)
mydata <- rbind(c1, c2)
mydata <- as.data.frame(mydata)
names(mydata) <- c("x", "y")

# 1 - simple
with(mydata, plot(x, y, pch=19, main="Scatter Plot with 10,000 Observations"))

# 2 - smoothed (!)
with(mydata, smoothScatter(x, y, main="Scatter Plot Colored by Smoothed Densities"))

# 3 - bivariate binning into hexagonal cells 
library(hexbin)
with(mydata, {
  bin <- hexbin(x, y, xbins = 50)
  plot(bin, main="Hexagonal Binning with 10,000 Observations")
})

#
# 3D scatter plots
#

# 1
library(scatterplot3d)
attach(mtcars)
  scatterplot3d(wt, disp, mpg, main="Basic 3D Scatter Plot")
detach(mtcars)

# 2
library(scatterplot3d) 
attach(mtcars) 
  scatterplot3d(wt, disp, mpg, pch=16, highlight.3d=TRUE,
              type="h", main="3D Scatter Plot with Vertical Lines")
detach(mtcars)

# 3
library(scatterplot3d) 
attach(mtcars) 
  s3d <-scatterplot3d(wt, disp, mpg, pch=16, highlight.3d=TRUE, type="h", 
                    main="3D Scatter Plot with Vertical Lines and Regression Plane")
  fit <- lm(mpg ~ wt + disp) 
  s3d$plane3d(fit)
detach(mtcars)

#
# Spinning 3D scatter plots
#

# 1

library(rgl)
attach(mtcars)
  plot3d(wt, disp, mpg, col="red", size=5)
detach(mtcars)

# 2

library(car)
with(mtcars, scatter3d(wt, disp, mpg))
