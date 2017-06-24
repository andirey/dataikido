#
# R in action (2 ed.)
#

#
# Selecting observations
#

source("data.R")

# 1
new_data <- leadership[1:3, ]

# 2
new_data <- leadership[ (leadership$gender=="M") & (leadership$age > 30), ]

# 3=2
attach(leadership)
  new_data <- leadership[ (gender == "M") & (age > 30), ]
detach(leadership)

# subset()

new_data <- subset(leadership, 
                   (age >= 35) | (age < 24),                   
                   select = gender:q4) #select = c(q1, q2, q4))

new_data
