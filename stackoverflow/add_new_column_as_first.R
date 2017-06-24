#
# Q: How to add new column to an dataframe (to the front not end)?
# https://stackoverflow.com/questions/19508256/how-to-add-new-column-to-an-dataframe-to-the-front-not-end
#
# My answer:
# https://stackoverflow.com/a/44694646/4393334
#


# Data set
df <- data.frame(b = c(1, 1, 1), c = c(2, 2, 2), d = c(3, 3, 3))
df

# Methods -----------------------------------------------------------------

# 1. Create a new data frame
df <- data.frame(b = c(1, 1, 1), c = c(2, 2, 2), d = c(3, 3, 3))
df <- data.frame(a = c(0, 0, 0), df)
df

# 2. Use "cbind"
df <- data.frame(b = c(1, 1, 1), c = c(2, 2, 2), d = c(3, 3, 3))
cbind(a = 0, df)

# 3. Add column "a", and sort by column using colum name or index
df <- data.frame(b = c(1, 1, 1), c = c(2, 2, 2), d = c(3, 3, 3))
df["a"] <- 0
df <- df[c('a', 'b', 'c', 'd')]
df

# 4. Use "cbind" and "rename" approach

# 4.1. Create data frame
df <- data.frame(b = c(1, 1, 1), c = c(2, 2, 2), d = c(3, 3, 3))

# 4.2. Get values for "new" column
new_column = c(0, 0, 0)

# 4.3. Combine "new" column with existed
df <- cbind(new_column, df)

# 4.4. Rename "new" column name
colnames(df)[1] <- "a"
