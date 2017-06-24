#
# R in action (2 ed)
#

# data
mydata<-data.frame(x1 = c(2, 2, 6, 4), 
                   x2 = c(3, 4, 2, 8))


# 1st approach
mydata$sumx  <-  mydata$x1 + mydata$x2
mydata$meanx <- (mydata$x1 + mydata$x2)/2

# 2nd approach
attach(mydata)
  mydata$sumx  <-  x1 + x2
  mydata$meanx <- (x1 + x2)/2
detach(mydata)

# 3rd approach (The Best Approach)
mydata <- transform(mydata,
                    sumx  =  x1 + x2,
                    meanx = (x1 + x2)/2)

