#
# R in action (2 ed.)
#

#
# Corrgrams
# *********
# A useful way to examine large numbers of bivariate relationships
# among quantitative variables
#

options(digits=2)
cor(mtcars)

library(corrgram)

# 1
corrgram(mtcars, order=TRUE, lower.panel=panel.shade,
         upper.panel=panel.pie, text.panel=panel.txt,
         main="Corrgram of mtcars intercorrelations")

# blue color - positive correlation
# red color - negative

# 2
corrgram(mtcars, order=TRUE, lower.panel=panel.ellipse,
         upper.panel=panel.pts, text.panel=panel.txt,
         diag.panel=panel.minmax, 
         main="Corrgram of mtcars data using scatter plots and ellipses")

# 3 -- unsorted
corrgram(mtcars, lower.panel=panel.shade,
         upper.panel=NULL, text.panel=panel.txt,
         main="Car Mileage Data (unsorted)")

# 4 -- control colors
cols <- colorRampPalette(c("darkgoldenrod4", "burlywood1",
                           "darkkhaki", "darkgreen"))

corrgram(mtcars, order=TRUE, col.regions=cols,
         lower.panel=panel.shade, 
         upper.panel=panel.conf, text.panel=panel.txt,
         main="A Corrgram (or Horse) of a Different Color")
