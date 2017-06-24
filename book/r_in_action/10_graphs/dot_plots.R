#
# R in action (2 ed.)
#

#
# Dot plots
#

# 1
dotchart(mtcars$mpg, 
         labels=row.names(mtcars), cex=.7,
         main="Gas Mileage for Car Models", 
         xlab="Miles Per Gallon")

# 2: Dot plot grouped, sorted, and colored

x <- mtcars[order(mtcars$mpg),]

x$cyl <- factor(x$cyl)

x$color[x$cyl==4] <- "red"
x$color[x$cyl==6] <- "blue" 
x$color[x$cyl==8] <- "darkgreen"

dotchart(x$mpg,
         labels = row.names(x),
         cex=.7,
         groups = x$cyl,
         gcolor = "black",
         color = x$color,
         pch=19,
         main = "Gas Mileage for Car Models\ngrouped by cylinder",
         xlab = "Miles Per Gallon")

# Hmisc package offers a dot-plot function 
# (aptly named dotchart2()) with a number of additional features
