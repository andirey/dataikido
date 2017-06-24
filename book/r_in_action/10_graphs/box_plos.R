#
# R in action (2 ed.)
#

#
# Box plots
#

# 1: mpg
boxplot(mtcars$mpg, main="Box plot", ylab="Miles per Gallon")

#boxplot.stats(mtcars$mpg)
summary(mtcars$mpg)

# 2: cyl

boxplot(mpg ~ cyl, data=mtcars,
        main="Car Mileage Data", 
        xlab="Number of Cylinders", 
        ylab="Miles Per Gallon")

# 3: notched box plots for the mpg
boxplot(mpg ~ cyl, data=mtcars, 
        notch=TRUE, 
        varwidth=TRUE,
        col="red",
        main="Car Mileage Data", 
        xlab="Number of Cylinders", 
        ylab="Miles Per Gallon")

# 4: Box plots for two crossed factors

# number of cylinders
mtcars$cyl.f <- factor(mtcars$cyl,       
                       levels=c(4,6,8),    
                       labels=c("4","6","8"))
# transmission type
mtcars$am.f <- factor(mtcars$am,              
                      levels=c(0,1),    
                      labels=c("auto", "standard"))

# Generates the box plot
boxplot(mpg ~ am.f * cyl.f,     
        data=mtcars,    
        varwidth=TRUE,    
        col=c("gold","darkgreen"),    
        main="MPG Distribution by Auto Type",    
        xlab="Auto Type", ylab="Miles Per Gallon") 
