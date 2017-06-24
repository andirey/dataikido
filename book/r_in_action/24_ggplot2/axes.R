#
# R in action (2 ed.)
#

data(Salaries,package="car")

library(ggplot2)

ggplot(data=Salaries, 
       aes(x=rank, y=salary, fill=sex)) +
       geom_boxplot() +
       scale_x_discrete(breaks=c("AsstProf", "AssocProf", "Prof"),  
                        labels=c("Assistant\nProfessor", 
                                 "Associate\nProfessor", 
                                 "Full\nProfessor")) + 
       scale_y_continuous(breaks=c(50000, 100000, 150000, 200000),
                          labels=c("$50K", "$100K", "$150K", "$200K")) +    
       labs(title="Faculty Salary by Rank and Sex", x="", y="")
