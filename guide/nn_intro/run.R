#
# A Beginner’s Guide to Neural Networks with R
# http://www.kdnuggets.com/2016/08/begineers-guide-neural-networks-r.html/ 
#

# Install libraries if not exist
# install.packages('ISLR')
# install.packages('neuralnet')

# 1. Load library
library(ISLR)
library(caTools)
library(neuralnet)

# 2. Check data
View(College)
print(head(College, 2))

# 3. Data Preprocessing

# 3.1. Create Vector of Column Max and Min Values
maxs <- apply(College[,2:18], 2, max)
mins <- apply(College[,2:18], 2, min)

# 3.2. Use scale() and convert the resulting matrix to a data frame
scaled.data <- as.data.frame(scale(College[,2:18], center = mins, scale = maxs - mins))

# 3.3. Check out results
print(head(scaled.data,2))

# 4. Train and Test Split

# 4.1. Convert Private column from Yes/No to 1/0
Private <-  as.numeric(College$Private)-1
data <-  cbind(Private, scaled.data)

# 4.2. # Create Split (any column is fine)
set.seed(101)
split <-  sample.split(data$Private, SplitRatio = 0.70)

# 5. Neural Network Function

# 5.1. Split based off of split Boolean Vector
train <-  subset(data, split == TRUE)
test <-  subset(data, split == FALSE)

# 5.2. Features
feats <- names(scaled.data)

# 5.3. Concatenate strings
f <- paste(feats,collapse=' + ')
f <- paste('Private ~',f)

# 5.4. Convert to formula
f <- as.formula(f)

# 6. Neural Net
nn <- neuralnet(f, train, hidden = c(10,10,10), linear.output=FALSE)

# 7. Predictions and Evaluations

# 7.1. Compute Predictions off Test Set
predicted.nn.values <- compute(nn, test[2:18])

# 7.2. Check out net.result
print(head(predicted.nn.values$net.result))

# 7.3. Round to 0/1
predicted.nn.values$net.result <- sapply(predicted.nn.values$net.result, round, digits=0)

# 8. Simple confusion matrix
table(test$Private, predicted.nn.values$net.result)

# 9. Visualizing the Neural Net
plot(nn)
