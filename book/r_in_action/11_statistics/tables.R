#
# R in action (2 ed.)
#

#
# Frequency and contingency tables
#

library(vcd)
head(Arthritis)

# Generating frequency tables

# 1: One-way table
mytable <- with(Arthritis, table(Improved))

mytable
prop.table(mytable)
prop.table(mytable)*100

# 2: Two-way table

mytable <- xtabs(~ Treatment+Improved, data=Arthritis)

mytable

prop.table(mytable, 1)
margin.table(mytable, 1)

margin.table(mytable, 2)
prop.table(mytable, 2)

prop.table(mytable)

addmargins(mytable)
addmargins(prop.table(mytable))
addmargins(prop.table(mytable))

addmargins(prop.table(mytable, 1), 2) # alone
addmargins(prop.table(mytable, 2), 1)

# useNA="ifany" to include NA values

# 3: Two-way table using CrossTable

library(gmodels)
CrossTable(Arthritis$Treatment, Arthritis$Improved)

#
# 4: MULTIDIMENSIONAL TABLES
#

# 4.1: Three-way contingency table

mytable <- xtabs(~ Treatment+Sex+Improved, data=Arthritis)
#mytable

ftable(mytable) 

margin.table(mytable, 1) 
margin.table(mytable, 2)
margin.table(mytable, 3)

margin.table(mytable, c(1, 3)) 

ftable(prop.table(mytable, c(1, 2))) 
ftable(addmargins(prop.table(mytable, c(1, 2)), 3))
