#
# R in action (2 ed.)
#

#
# Creating a time-series object
#

sales <- c(18, 33, 41,  7, 34, 35, 24, 25, 24, 21, 25, 20, 
           22, 31, 40, 29, 25, 21, 22, 54, 31, 25, 26, 35)

# create

tsales <- ts(sales, start = c(2003, 1), frequency=12)
tsales

# some info

plot(tsales)

start(tsales)
end(tsales)

frequency(tsales)

# subset

tsales.subset <- window(tsales, start = c(2003, 5), end = c(2004, 6))
tsales.subset
