#
# R in action (2 ed.)
#

# Grouping and Faceting

# 1. Transformations

mtcars$am <- factor(mtcars$am, levels=c(0,1), 
                    labels=c("Automatic", "Manual"))
mtcars$vs <- factor(mtcars$vs, levels=c(0,1), 
                    labels=c("V-Engine", "Straight Engine"))
mtcars$cyl <- factor(mtcars$cyl)

# 2. Generate plot
# "am", "vs" are the faceting variables
# "cyl" is the grouping variable

library(ggplot2)
ggplot(data=mtcars, aes(x=hp, y=mpg, shape=cyl, color=cyl)) +
  geom_point(size=3) + 
  facet_grid(am~vs) +
  labs(title="Automobile Data by Engine Type", 
       x="Horsepower", y="Miles Per Gallon")

# 3. Grouping & Faceting
# 3.1
ggplot(Salaries, aes(x=yrs.since.phd, y=salary, color=rank, shape=rank)) + 
                 geom_point() + 
                 facet_grid(.~sex)
# 3.2
data(singer, package="lattice")
library(ggplot2)
ggplot(data=singer, aes(x=height, fill=voice.part)) +
                    geom_density() + 
                    facet_grid(voice.part~.)
