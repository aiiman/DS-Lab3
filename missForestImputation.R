# Imputation with missForest package

# Install 'missForest' library
install.packages('missForest')
library(missForest)
# Impute missing values in Age attribute
missForest_imputed <- data.frame(
  original = titanic_numeric$Age,
  imputed_missForest = missForest(titanic_numeric)$ximp$Age
)
missForest_imputed

# Visualising imputed data distribution
ggplot(missForest_imputed, aes(imputed_missForest)) +
  geom_histogram(color = "#000000", fill = "#0099F8") +
  ggtitle("Variable distribution") +
  theme_classic() +
  theme(plot.title = element_text(size = 18))
