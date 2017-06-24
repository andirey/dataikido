#
# R in action (2 ed.)
#

# data

# vectors

a <- c(1, 2, 5, 3, 6, -2, 4)
b <- c("one", "two", "three")
c <- c(TRUE, TRUE, TRUE, FALSE, TRUE, FALSE)

a <- c("k", "j", "h", "a", "c", "m")
a[3]
a[c(1, 3, 5)]
a[2:6]

# Matrices
y <- matrix(1:20, nrow=5, ncol=4)
y
cells    <- c(1,26,24,68) 
rnames   <- c("R1", "R2")
cnames   <- c("C1", "C2") 

# byrow
mymatrix <- matrix(cells, 
                   nrow=2, ncol=2, byrow=TRUE,
                   dimnames=list(rnames, cnames))
mymatrix

# bycol
mymatrix <- matrix(cells, 
                   nrow=2, ncol=2, byrow=FALSE, 
                   dimnames=list(rnames, cnames))
mymatrix

# 
x <- matrix(1:10, nrow=2)
x
x[2,]
x[,2]
x[1,4]
x[1, c(4,5)]

# Arrays
dim1 <- c("A1", "A2")
dim2 <- c("B1", "B2", "B3")
dim3 <- c("C1", "C2", "C3", "C4")
z <- array(1:24, c(2, 3, 4), dimnames=list(dim1, dim2, dim3))
z

# Data frames
patientID <- c(1, 2, 3, 4)
age <- c(25, 34, 28, 52)
diabetes <- c("Type1", "Type2", "Type1", "Type1")
status <- c("Poor", "Improved", "Excellent", "Poor")
patientdata <- data.frame(patientID, age, diabetes, status)
patientdata
patientdata[1:2]
patientdata[c("diabetes", "status")]
patientdata$age

# cross-validated
table(patientdata$diabetes, patientdata$status)

# ATTACH, DETACH, AND WITH

attach(mtcars)
  summary(mpg)
  plot(mpg, disp)
  plot(mpg, wt)
detach(mtcars)

with(mtcars, {
  print(summary(mpg))
  plot(mpg, disp)
  plot(mpg, wt)
})

# >> for global env
with(mtcars, {
  nokeepstats <- summary(mpg)
  keepstats <<- summary(mpg)
})
# nokeepstats
keepstats

# case indentifier
patientdata <- data.frame(patientID, age, diabetes, 
                          status, row.names=patientID)

# Factors
diabetes <- c("Type1", "Type2", "Type1", "Type1")
diabetes  <-  factor(diabetes)
diabetes

status <- c("Poor", "Improved", "Excellent", "Poor")
status <- factor(status, ordered=TRUE)
status

# with specified order
status <- factor(status, order=TRUE,  levels=c("Poor", "Improved", "Excellent"))
status

# Lists
g <- "My First List"
h <- c(25, 26, 18, 39)
j <- matrix(1:10, nrow=5)
k <- c("one", "two", "three")
mylist <- list(title=g, ages=h, j, k) 
mylist   
mylist[[2]]
mylist[["ages"]]
