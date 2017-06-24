#
# R in action (2 ed.)
#

#
# * Corrective measures *
# Four approaches to dealing with violations of regression assumptions
# 1. Deleting observations
# 2. Transforming variables
# 3. Adding or deleting variables
# 4. Using another regression approach
#

# 2. Transforming variables
# Box–Cox transformation to normality

library(car)
summary(powerTransform(states$Murder))

boxTidwell(Murder~Population+Illiteracy,data=states)

# 3. Adding or deleting variables

# 4. Using another regression approach


