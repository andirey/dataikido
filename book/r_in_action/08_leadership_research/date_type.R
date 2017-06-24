#
# R in action (2 ed.)
#

#
# How work with Date type ?
#
# lubridate, timeDate packages

# default format

mydates <- as.Date(c("2007-06-22", "2004-02-13"))
str(mydates)

# convert by format

mydates <- as.Date(c("2007-06-22", "2004-02-13"))
dates <- as.Date(mydates, "%m/%d/%Y")
str(dates)


