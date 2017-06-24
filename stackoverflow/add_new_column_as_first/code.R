#
# Q: How to add new column to dataframe to the front not end?
# 

# 1. Data set
df <- data.frame(b = c(1, 1, 1), c = c(2, 2, 2), d = c(3, 3, 3))

# 2. Solutions

# 2.1. By creating a new data frame
df <- data.frame(a = c(0, 0, 0), df)

# 2.2. By using "cbind"
df <- data.frame(b = c(1, 1, 1), c = c(2, 2, 2), d = c(3, 3, 3))
cbind(a = 0, df)

# 2.3. By adding column "a", and sort by column using colum name or index
df <- data.frame(b = c(1, 1, 1), c = c(2, 2, 2), d = c(3, 3, 3))
df["a"] <- 0
df <- df[c('a', 'b', 'c', 'd')]

# 2.4. Use "cbind" and "rename" approach together

# 2.4.1. Create data frame
df <- data.frame(b = c(1, 1, 1), c = c(2, 2, 2), d = c(3, 3, 3))

# 2.4.2. Get values for "new" column
new_column = c(0, 0, 0)

# 2.4.3. Combine "new" column with existed
df <- cbind(new_column, df)

# 2.4.4. Rename "new" column name
colnames(df)[1] <- "a"
