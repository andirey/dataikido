#
# R in action (2 ed.)
#

#
# Seasonal decomposition
# > trend  component    ... captures changes in level over time
# > seasonal  component ... captures cyclical effects due to the time of year
# > irregular component ... captures those influences not described by the trend and seasonal effects
#

library(forecast)

# Decomposing a time series into trend, seasonal, and irregular components
# is "Seasonal Decomposition by loess  smoothing"

# Example: Seasonal decomposition using stl()

# 1. Plots the time series
plot(AirPassengers)
lAirPassengers <- log(AirPassengers)
plot(lAirPassengers, ylab="log(AirPassengers)")

# 2.Decomposes the time series
fit <- stl(lAirPassengers, s.window="period")
plot(fit)

# 3. Components for each observation
fit$time.series
exp(fit$time.series)

# 4. Visualize a seasonal decomposition
par(mfrow=c(2,1))

monthplot(AirPassengers, xlab="",  ylab="")  
seasonplot(AirPassengers, year.labels="TRUE", main="")
