#
# R in action (2 ed.)
#

#
# Exponential forecasting models
#

# -------------------------------
# 1. Simple exponential smoothing
# -------------------------------
# uses a weighted average of existing time-series values to
# make a short-term prediction of future values

library(forecast)

# nhtemp - data set
# A for additive
# M for multiplicative
# N for none
# Z for automatically selected

fit <- ets(nhtemp, model="ANN")  # A - errors are additive
                                 # NN - no trend and seasonal component
fit

# 1-step ahead forecast
forecast(fit, 1)
plot(forecast(fit, 1), xlab="Year",
     ylab=expression(paste("Temperature (", degree*F,")",)), 
     main="New Haven Annual Mean Temperature") 

accuracy(fit)

# ----------------------------------------------
# 2. Holt and Holt-Winters exponential smoothing
# ----------------------------------------------
# Exponential smoothing with level, slope, and seasonal components

fit <- ets(log(AirPassengers), model="AAA")
fit

pred <- forecast(fit, 5)
pred

plot(pred, main="Forecast for Air Travel", 
     ylab="Log(AirPassengers)", xlab="Time")

# Makes forecasts in the original scale

pred$mean <- exp(pred$mean)
pred$lower <- exp(pred$lower)
pred$upper <- exp(pred$upper)
p <- cbind(pred$mean, pred$lower, pred$upper)
dimnames(p)[[2]] <- c("mean", "Lo 80", "Lo 95", "Hi 80", "Hi 95")
p

# The ets() function and automated forecasting

# Automatic exponential forecasting with ets()
fit <- ets(JohnsonJohnson)
fit
plot(forecast(fit), main="Johnson & Johnson Forecasts", 
     ylab="Quarterly Earnings (Dollars)", xlab="Time", flty=2)
