#
# R in action (2 ed.)
#

#
# ARIMA forecasting models
# AutoRegressive  Integrated Moving  Average  (ARIMA) 
#

# 1. Transforming the time series and assessing stationarity

library(forecast)
library(forecast)

plot(Nile)
ndiffs(Nile)

dNile <- diff(Nile)
plot(dNile)
adf.test(dNile)


# 2. IDENTIFYING ONE OR MORE REASONABLE MODELS
Acf(dNile)
Pacf(dNile)

# 3. FITTING THE MODEL(S)

fit <- arima(Nile, order=c(0,1,1)) 
fit
accuracy(fit)

# 4. Evaluating the model fit
qqnorm(fit$residuals)
qqline(fit$residuals)
Box.test(fit$residuals, type="Ljung-Box")

# 5. Forecasting with an ARIMA model

forecast(fit, 3)
plot(forecast(fit, 3), xlab="Year", ylab="Annual Flow")

#
# Automated ARIMA forecasting
# ---------------------------
#

fit <- auto.arima(sunspots)
forecast(fit, 3)
accuracy(fit)
