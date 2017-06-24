#
# R in action (2 ed.)
#


library("VIM")

aggr(sleep, prop=FALSE, numbers=TRUE)

marginplot(sleep[c("Gest","Dream")], pch=c(20), 
           col=c("darkgray", "red", "blue"))
