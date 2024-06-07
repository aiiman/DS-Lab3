# Feature Encoding

# Label encoding
gender_encode <- ifelse(titanic_train$Sex == "male",1,0)
table(gender_encode)

# One-Hot encoding
new_dat = data.frame(titanic_train$Fare,titanic_train$Sex,titanic_train$Embarked)
summary(new_dat)
# Transforming the categorical variables using predict() function
library(caret)
dmy <- dummyVars(" ~ .", data = new_dat, fullRank = T)
dat_transformed <- data.frame(predict(dmy, newdata = new_dat))
glimpse(dat_transformed)

# Encoding continuous/numeric variables
summary(new_dat$titanic_train.Fare)
# Create vector of cut-off points based on 1st and 3rd quarter values
bins <- c(-Inf, 7.91, 31.00, Inf)
bin_names <- c("Low", "Mid50", "High")
# Break vector using the cut-off points with cut()
new_dat$new_Fare <- cut(new_dat$titanic_train.Fare, breaks = bins, labels = bin_names)
# Compare original Fare and binned Fare (new_Fare)
summary(new_dat$titanic_train.Fare)
summary(new_dat$new_Fare)

