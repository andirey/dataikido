#
# R in action (2 ed.)
#

# Scales

#  1. size=disp generates a scale for the continuous variable disp

ggplot(mtcars, aes(x=wt, y=mpg, size=disp)) + 
  geom_point(shape=21, color="black", fill="cornsilk") + 
  labs(x="Weight", y="Miles Per Gallon", 
       title="Bubble Chart", size="Engine\nDisplacement")

# 2.  set  the  point  colors  for  the  three  academic ranks

data(Salaries, package="car")
ggplot(data=Salaries, aes(x=yrs.since.phd, y=salary, color=rank)) +
  scale_color_manual(values=c("orange", "olivedrab", "navy")) +
  geom_point(size=2)

# 3. with a color set

ggplot(data=Salaries, aes(x=yrs.since.phd, y=salary, color=rank)) +
  scale_color_brewer(palette="Set1") + geom_point(size=2)

# 4. available color sets
library(RColorBrewer)
display.brewer.all()
