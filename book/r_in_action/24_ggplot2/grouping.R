#
# R in action (2 ed.)
#

# Grouping
# --------
# 1. Groups are usually defined as the levels of a categorical variable (factor). 
#
# 2. Grouping is accomplished in ggplot2 graphs by associating one or more grouping 
# variables with visual characteristics such as shape, color, fill, size, line  type

library(ggplot2)

data(Salaries, package="car")

ggplot(data=Salaries, aes(x=salary, fill=rank)) +  
  geom_density(alpha=.3)

ggplot(Salaries, aes(x=yrs.since.phd, y=salary, color=rank, shape=sex)) + geom_point() 

# grouped bar chart
ggplot(Salaries, aes(x=rank, fill=sex)) + 
  geom_bar(position="stack") + labs(title='position="stack"') 

ggplot(Salaries, aes(x=rank, fill=sex)) + 
  geom_bar(position="dodge") + labs(title='position="dodge"') 

ggplot(Salaries, aes(x=rank, fill=sex)) + 
  geom_bar(position="fill") + labs(title='position="fill" (Proportion)')

# ---
ggplot(Salaries, aes(x=rank, fill=sex))+ geom_bar()
ggplot(Salaries, aes(x=rank)) + geom_bar(fill="red")
ggplot(Salaries, aes(x=rank, fill="red")) + geom_bar()

# In  general,  variables  should  go  inside  aes(),  and  assigned  constants
# should go outside aes().

