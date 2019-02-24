#
# Feature Engineering - Handling Cyclical Features
# Post: http://blog.davidkaleko.com/feature-engineering-cyclical-features.html
# Data: https://archive.ics.uci.edu/ml/machine-learning-databases/00275/Bike-Sharing-Dataset.zip
#

# 1. Packages
import pandas as pd
import numpy as np
from sklearn.preprocessing import StandardScaler
from sklearn.neural_network import MLPRegressor
from sklearn.pipeline import Pipeline
from sklearn.model_selection import KFold
from sklearn.model_selection import cross_val_score

# Supress warnings
import warnings
warnings.filterwarnings('ignore')

# 2. Load data
df = pd.read_csv("data/hour.csv")

# 3. EDA
print(df.columns.values)

# 4. Extract 'hour' and 'month' features
df = df[['mnth', 'hr', 'cnt']].copy()

# 5. Number of unique values
print("Unique values of month: ", df.mnth.unique())
print('Unique values of hour:', df.hr.unique())

# 6. Magic
df['hr_sin'] = np.sin(df.hr * (2. * np.pi/24))
df['hr_cos'] = np.cos(df.hr * (2. * np.pi/24))
df['mnth_sin'] = np.sin((df.mnth-1) * (2. * np.pi/12))
df['mnth_cos'] = np.cos((df.mnth-1) * (2. * np.pi/12))

# 7. Impact on Model Performance

# 7.1. 'Non-cyclic' features

# 7.1.1. Construct the pipeline with a standard scaler and a small neural network
estimators = []
estimators.append(('standardize', StandardScaler()))
estimators.append(('nn', MLPRegressor(hidden_layer_sizes=(5, ), max_iter = 1000)))
model = Pipeline(estimators)

# 7.1.2. To begin, let's use only these two features to predict 'cnt' (bicycle count)
features = ['mnth', 'hr']
X = df[features].values
y = df.cnt

# 7.1.3. We'll use 5-fold cross validation. That is, a random 80% of the data will be used
# to train the model, and the prediction score will be computed on the remaining 20%.
# This process is repeated five times such that the training sets in each "fold"
# are mutually orthogonal.
kfold = KFold(n_splits=5)

# 7.1.4. Train model
results = cross_val_score(model, X, y, cv = kfold, scoring = 'neg_mean_squared_error')

# 7.1.5. Result
print('CV Scoring Result: mean=', np.mean(results), 'std=', np.std(results))

# 7.2. 'Cyclic' features

# 7.2.1. Features
features = ['mnth_sin', 'mnth_cos', 'hr_sin', 'hr_cos']
X = df[features].values

# 7.2.2. Train model
results = cross_val_score(model, X, y, cv=kfold, scoring='neg_mean_squared_error')

# 7.2.3. Results
print('CV Scoring Result: mean=', np.mean(results), 'std=', np.std(results))

# 8. Improvement
22678/31401
