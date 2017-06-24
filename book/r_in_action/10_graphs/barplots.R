#
# R in action (2 ed.)
#

#
# Graphs
#

library(vcd)

# 1
counts <- table(Arthritis$Improved)
counts

barplot(counts, 
        main="Simple Bar Plot", 
        xlab="Improvement", 
        ylab="Frequency",
        horiz=TRUE)

# 2
counts <- table(Arthritis$Improved, Arthritis$Treatment)
counts

# Stacked bar plot
barplot(counts,                  
        main="Stacked Bar Plot",    
        xlab="Treatment", ylab="Frequency",     
        col=c("red", "yellow","green"),    
        legend=rownames(counts)) 

# Grouped bar plot
barplot(counts,                     
        main="Grouped Bar Plot", 
        xlab="Treatment", ylab="Frequency",       
        col=c("red", "yellow", "green"),    
        legend=rownames(counts), beside=TRUE)

# Bar plot for sorted mean values
states <- data.frame(state.region, state.x77)
means <- aggregate(states$Illiteracy, by=list(state.region), FUN=mean)
means <- means[order(means$x),] 

barplot(means$x, names.arg=means$Group.1) 
title("Mean Illiteracy Rate")
means

