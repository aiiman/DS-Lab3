# Basic Imputation Methods

# Create data frame with product labels and prices (including NA)
df <- data.frame(Product = c('A', 'B', 'C', 'D', 'E'), Price = c(612, 447, NA, 374, 831))
# Display the initial data frame
df
# Replace NA values in 'Price' with 0
df$Price[is.na(df$Price)] <- 0
# Display the updated data frame
df
# Replace NA values in 'Price' with the mean of non-NA prices
df$Price[is.na(df$Price)] <- mean(df$Price, na.rm = TRUE)
# Replace NA values in 'Price' with the median of non-NA prices
df$Price[is.na(df$Price)] <- median(df$Price, na.rm = TRUE)

# Install 'titanic' packages
install.packages('titanic')
library(titanic)
# Load the 'Titanic' dataset from R's built-in datasets
data("Titanic")
# The 'Titanic' dataset is a table, convert it to a data frame for
summary
titanic_df <- as.data.frame(Titanic)
# Summarize the 'titanic_df' data frame
summary(titanic_df)
titanic_train$Age

# View Age distibution using historgram
library(ggplot2)
library(dplyr)
install.packages('cowplot')
library(cowplot)
ggplot(titanic_train, aes(Age)) +
  geom_histogram(color = "#000000", fill = "#0099F8") +
  ggtitle("Variable distribution") +
  theme_classic() +
  theme(plot.title = element_text(size = 18))

# Perform simple value imputation
value_imputed <- data.frame(
  original = titanic_train$Age,
  imputed_zero = replace(titanic_train$Age,
                         is.na(titanic_train$Age), 0),
  imputed_mean = replace(titanic_train$Age,
                         is.na(titanic_train$Age), mean(titanic_train$Age, na.rm = TRUE)),
  imputed_median = replace(titanic_train$Age,
                           is.na(titanic_train$Age), median(titanic_train$Age, na.rm =
                                                              TRUE))
)
value_imputed

# Visualising imputed data using histograms
h1 <- ggplot(value_imputed, aes(x = original)) +
  geom_histogram(fill = "#ad1538", color = "#000000", position =
                   "identity") +
  ggtitle("Original distribution") +
  theme_classic()
h2 <- ggplot(value_imputed, aes(x = imputed_zero)) +
  geom_histogram(fill = "#15ad4f", color = "#000000", position =
                   "identity") +
  ggtitle("Zero-imputed distribution") +
  theme_classic()
h3 <- ggplot(value_imputed, aes(x = imputed_mean)) +
  geom_histogram(fill = "#1543ad", color = "#000000", position =
                   "identity") +
  ggtitle("Mean-imputed distribution") +
  theme_classic()
h4 <- ggplot(value_imputed, aes(x = imputed_median)) +
  geom_histogram(fill = "#ad8415", color = "#000000", position =
                   "identity") +
  ggtitle("Median-imputed distribution") +
  theme_classic()
plot_grid(h1, h2, h3, h4, nrow = 2, ncol = 2)
