#
# R in action (2 ed.)
#

# Read .xls file
#

Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jre7')

library(xlsx)

excelData <-read.xlsx("data.xls", sheetName="sheetOne")
excelData
