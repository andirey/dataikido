#
# R in action (2 ed.)
#

#
# SQL for data management
#

library(sqldf)

# 1
new_df <- sqldf("select * from mtcars where (carb=1)", row.names=TRUE)

# 2
new_df <- sqldf("select avg(mpg) as avg_mpg, avg(disp) as avg_disp
                from mtcars
                where (cyl in (4,6))
                group by gear")

new_df
