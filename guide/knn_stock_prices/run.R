#
# Code snippets (my edition)
#

# 1. Libraries
library(class)
library(dplyr)
library(lubridate)

# 2. Settings
set.seed(100)

# 3. Read data set
df_stocks <- read.csv('stocks.csv')

# 4. Feature engineering

# 4.1. Low-case features names
colnames(df_stocks) <- tolower(colnames(df_stocks))

# 4.2. Convert type of 'Date' feature from 'Factor' to 'Date'
df_stocks$date <- ymd(df_stocks$date)

# 4.3. Create boolean vector to check observations 'before' 2014 year
is_stocks_before_2014 <-  year(df_stocks$date) < 2014

# 5. Create 'train' and 'test' sets

predictors <- cbind(lag(df_stocks$apple, default = 210.73), 
                    lag(df_stocks$google, default = 619.98), 
                    lag(df_stocks$msft, default = 30.48))

# 6. Create baseline model
fit_knn <- knn(predictors[is_stocks_before_2014, ], 
               predictors[!is_stocks_before_2014, ], 
               df_stocks$increase[is_stocks_before_2014], k = 1)

# 7. Check accuracy

# 7.1. Confusion matrix
table(fit_knn, df_stocks$increase[!is_stocks_before_2014])

# 7.2. Mean
mean(fit_knn == df_stocks$increase[!is_stocks_before_2014])

# 8. Improve accuracy by changing 'k' parameter

# 8.1. Settings
accuracy <- rep(0, 10)
k <- 1:10

# 8.2. Calculations
for(x in k){
  # 8.2.1. Create model with 'x' value of 'k' parameter
  fit_knn <- knn(predictors[is_stocks_before_2014, ], 
                 predictors[!is_stocks_before_2014, ], 
                 df_stocks$increase[is_stocks_before_2014], k = x)
  
  accuracy[x] <- mean(fit_knn == df_stocks$increase[!is_stocks_before_2014])
}

# 8.3. Plot results
plot(k, accuracy, type = 'b')

