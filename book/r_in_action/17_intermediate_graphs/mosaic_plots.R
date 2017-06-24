#
# R in action (2 ed.)
#

#
# Mosaic Plots
#
# the frequencies in a multidimensional contingency table are represented by 
# nested rectangular regions that are proportional to their cell frequency. 
# Color and/or shading can be used to represent residuals from a fitted model
#

library(vcd)

ftable(Titanic)

# 1
mosaic(Titanic, shade=TRUE, legend=TRUE)
# or
mosaic(~Class+Sex+Age+Survived, data=Titanic, shade=TRUE, legend=TRUE)
