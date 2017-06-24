#
# R in action (2 ed.)
#

# Examples

library(ggplot2)

# 1 ---
ggplot(data = mtcars, aes(x=wt, y=mpg)) + 
       geom_point() + 
       labs(title="Automobile Data", x="Weight", y="Miles Per Gallon")

# 2 ---
ggplot(data=mtcars, aes(x=wt, y=mpg)) + 
  geom_point(pch=17, color="blue", size=2) + 
  geom_smooth(method="lm", color="red", linetype=2) +
  labs(title="Automobile Data", x="Weight", y="Miles Per Gallon")

# 3 ---
data(singer, package="lattice")
ggplot(singer, aes(x=height)) + geom_histogram()
ggplot(singer, aes(x=voice.part, y=height)) + geom_boxplot()

data(singer, package="lattice")
ggplot(singer, aes(x=voice.part, y=height)) +   
  geom_violin(fill="lightblue") + 
  geom_boxplot(fill="lightgreen", width=.2)

# 4 ----
data(Salaries, package="car")
library(ggplot2)
ggplot(Salaries, aes(x=rank, y=salary)) +
  geom_boxplot(fill="cornflowerblue", 
               color="black", notch=TRUE)+ 
  geom_point(position="jitter", color="blue", alpha=.5)+
  geom_rug(side="l", color="black")
