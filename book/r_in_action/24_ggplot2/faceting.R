#
# R in action (2 ed.)
#

# Faceting
# --------
# Faceting creates an array of plots based on one or more categorical variables

data(singer, package="lattice")

library(ggplot2)

ggplot(data=singer, aes(x=height)) + 
  geom_histogram() + 
  facet_wrap(~voice.part, nrow=4)

unique(singer$voice.part)

