#
# R in action (2 ed.)
#

#
# 4 plots in one window
#

attach(mtcars)
  opar <- par(no.readonly=TRUE)

  # 4 plots in 2x2 matrix
  par(mfrow = c(2,2))

  plot(wt, mpg, main="Scatterplot of wt vs. mpg") #1
  plot(wt, disp, main="Scatterplot of wt vs. disp") #2
  hist(wt, main = "Histogram of wt") #3
  boxplot(wt, main="Boxplot of wt") #4

  par(opar)
detach(mtcars)

#
#  3  plots  in  3  rows  &  1  column
#

attach(mtcars)
  opar <- par(no.readonly=TRUE)

  # 3 rows, 1 column
  par(mfrow = c(3, 1)) 

  hist(wt)
  hist(mpg)
  hist(disp)

  par(opar)
detach(mtcars)


#
# layout
# 

attach(mtcars)
  layout(matrix(c(1,1,2,3), 2, 2, byrow = TRUE))

  hist(wt)
  hist(mpg)
  
  hist(disp)
detach(mtcars)


#
# scale figures
#

attach(mtcars)
  layout(matrix(c(1, 1, 2, 3), 2, 2, byrow = TRUE), widths=c(3, 1), heights=c(1, 2))
  hist(wt)
  hist(mpg)
  hist(disp)
detach(mtcars)

#
# Fine placement of figures in a graph
#

opar <- par(no.readonly=TRUE)
par(fig=c(0, 0.8, 0, 0.8))    

plot(mtcars$wt, mtcars$mpg,                      
     xlab="Miles Per Gallon",                               
     ylab="Car Weight")

par(fig=c(0, 0.8, 0.55, 1), new=TRUE)                                   
boxplot(mtcars$wt, horizontal=TRUE, axes=FALSE) 

par(fig=c(0.65, 1, 0, 0.8), new=TRUE)          
boxplot(mtcars$mpg, axes=FALSE)             
mtext("Enhanced Scatterplot", side=3, outer=TRUE, line=-3)

par(opar)