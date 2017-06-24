#
# R in action (2 ed.)
#

#
# Recoding variables
#

source("data.R")


# leadership$age[leadership$age  == 99] <- NA
# 
# leadership$agecat[leadership$age  > 75] <- "Elder"
# leadership$agecat[leadership$age >= 55 & leadership$age <= 75] <- "Middle Aged"
# leadership$agecat[leadership$age  < 55] <- "Young"

# more compact way
leadership <- within(leadership, {
  agecat <- NA
  agecat[agecat > 75] <- "Elder"
  agecat[age >= 55 & age <= 75] <- "Middle"
  agecat[age < 55] <- "Young"
})

leadership
