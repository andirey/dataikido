#
# M.J. Crawley "The R Book", 2007
# 1. Getting Started
#

# 1. Packages used in the book
source("lib_load.R")

# 2. List of current contributors
citation()

# 3. Help about function
?read.table

# 4. Find function by name
help.search("data input")

# 5. Find package by function
find("lowess")

# 6. Names of all objects in the search list
apropos("lm")

# 7. Example of function
example("lm")

# 8. Demo of function
demo(persp())

# 9. Call library package
library(spatial)

# 10. Content of package
library(help=spatial)

# 11. Objects in package

# 11.1. List of attached packages
search()

# 11.2. Find package
objects(grep("spatial", search()))

# 12. How to use function
?toupper

# 13. View data set 'mtcars'
View(mtcars)

# 14. Names of columns
names(mtcars)

# 15. Example of analysis of covariance

# 15.1. Attach data set
attach(mtcars)

# 15.2. Model
model <- lm(mpg ~ cyl + disp)

# 15.3. Result review
model
summary(model)

# 15.4. Turn off "*"
options(show.signif.stars = FALSE)
summary(model)

# 15.5. Detach data set
detach(mtcars)

# 16. Variables in session
objects()

# 17. Clean space
rm(list = ls())
