#
# R in action (2 ed.)
#

# Data input

mydata <- data.frame(age=numeric(0), gender=character(0), weight=numeric(0))
mydata <- edit(mydata)
mydata

# from the code
mydatatxt <- "
age gender weight
25 m 166
30 f 115
18 f 120
"
mydata <- read.table(header=TRUE, text=mydatatxt)

# from file

grades <- read.table("06_data_input/studentgrades.csv", header=TRUE, 
                     row.names="StudentID", sep=",") 
str(grades)

grades <- read.table("06_data_input/studentgrades.csv", header=TRUE,
                     row.names="StudentID", sep=",",
                     colClasses=c("character", "character", "character",  
                                  "numeric", "numeric", "numeric"))
str(grades)

