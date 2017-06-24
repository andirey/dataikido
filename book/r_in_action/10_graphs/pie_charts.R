#
# R in action (2 ed.)
#

#
# Pie charts
#

par(mfrow=c(2, 2))             

# 1
slices <- c(10, 12,4, 16, 8)    
lbls <- c("US", "UK", "Australia", "Germany", "France")   
pie(slices, labels = lbls, main="Simple Pie Chart")

# #2 : add %
pct <- round(slices/sum(slices)*100)      
lbls2 <- paste(lbls, " ", pct, "%", sep="")    
pie(slices, labels=lbls2, 
    col=rainbow(length(lbls2)),   
    main="Pie Chart with Percentages") 


# 3: 3D plot
library(plotrix)

pie3D(slices, labels=lbls, explode=0.1, main="3D Pie Chart ")


# 4 : Charts from a table
mytable <- table(state.region)       
lbls3 <- paste(names(mytable), "\n", mytable, sep="")   

pie(mytable, labels = lbls3,
    main="Pie Chart from a Table\n (with sample sizes)")

# Fan plot
library(plotrix)
slices <- c(10, 12,4, 16, 8) 
lbls <- c("US", "UK", "Australia", "Germany", "France")   
fan.plot(slices, labels = lbls, main="Fan Plot")


