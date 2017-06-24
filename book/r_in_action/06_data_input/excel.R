#
# R in action (2 ed.)
#

# Importing data from Excel

library(xlsx)

workbook <- "myworkbook.xlsx"
mydataframe <- read.xlsx(workbook, 1)
