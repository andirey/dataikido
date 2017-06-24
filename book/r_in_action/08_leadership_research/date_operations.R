#
# R in action (2 ed.)
#

# Date operations

startdate <- as.Date("2004-02-13")
enddate   <- as.Date("2011-01-22")
days      <- enddate - startdate
days

# How old am I ?
today <- Sys.Date()
birthday <- as.Date("1971-02-2")
difftime(today, birthday, units="weeks")
difftime(today, birthday, units="days")
difftime(today, birthday, units="days")/365

# Date convertion
myformat <- "%m/%d/%y"
leadership$date <- as.Date(leadership$date, myformat)

# date functions Sys.Date(), date()
today <- Sys.Date()
format(today, format="%B %d %Y")
format(today, format="%A")

