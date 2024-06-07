# Normalize data with scaling methods

# Normalize data using Log Transformation
log_scale = log(as.data.frame(titanic$Fare))
# Normalize data using Min-Max Scaling (Install 'caret' package)
library(caret)
process <- preProcess(as.data.frame(titanic_train$Fare),
                      method=c("range"))
norm_scale <- predict(process, as.data.frame(titanic_train$Fare))
# Normalize data using standard scaling in R.
scale_data <- as.data.frame(scale(titanic_train$Fare))
