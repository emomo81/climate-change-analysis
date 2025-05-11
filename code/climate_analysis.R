library(readr)
library(dplyr)
library(ggplot2)
library(tidyr)

# -------------------------------
# Load the CSV file into a data frame
# -------------------------------
data <- read_csv("C:\\Users\\Emmanuel G. Momo\\Downloads\\climate_change_indicators.csv")

# -------------------------------
# Data Inspection
# -------------------------------
dim(data)        # Number of rows and columns
head(data)       # First 6 rows
tail(data)       # Last 6 rows
summary(data)    # Summary of each column
str(data)        # Structure of the data

# Missing values per column
colSums(is.na(data))

# Total number of missing values
sum(is.na(data))

# Duplicate rows
sum(duplicated(data))

# -------------------------------
# Data Cleaning
# -------------------------------

# Option 1: Remove rows with any NA
clean_data <- na.omit(data)

# Option 2: Remove columns with more than 50% missing values
missing_percent <- colSums(is.na(data)) / nrow(data)
cols_to_remove <- names(missing_percent[missing_percent > 0.5])
clean_data <- data %>% select(-all_of(cols_to_remove))

# Option 3: Impute numeric columns with mean (recommended if some NAs are acceptable)
clean_data <- data %>%
  mutate(across(where(is.numeric), ~ ifelse(is.na(.), mean(., na.rm = TRUE), .)))

# Remove duplicates
clean_data <- unique(clean_data)

# Optional: Focus on temperature change indicator
temperature_data <- clean_data %>%
  filter(Indicator == "Temperature change with respect to a baseline climatology, corresponding to the period 1951-1980")

# -------------------------------
# Data Visualization
# -------------------------------

# Histogram of F1961 values
ggplot(clean_data, aes(x = F1961)) +
  geom_histogram(bins = 30, fill = "steelblue", color = "black") +
  labs(title = "Distribution of F1961 Values", x = "F1961", y = "Frequency")

# Boxplot of F1961 by country
ggplot(clean_data, aes(x = Country, y = F1961)) +
  geom_boxplot() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(title = "Boxplot of F1961 by Country", y = "Value", x = "Country")

# Scatter plot between F1961 and F1970
ggplot(clean_data, aes(x = F1961, y = F1970)) +
  geom_point(alpha = 0.6) +
  labs(title = "Scatter Plot: F1961 vs F1970", x = "F1961", y = "F1970")

# Bar chart of countries
ggplot(clean_data, aes(x = Country)) +
  geom_bar() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(title = "Number of Entries per Country")

# Pair plots (only if few numeric columns)
numeric_data <- clean_data %>% select(where(is.numeric))

if(ncol(numeric_data) <= 10) {
  pairs(numeric_data, main = "Pairwise Scatter Plots")
} else {
  print("Too many numeric columns for pair plot.")
}

# Correlation matrix heatmap
cor_matrix <- cor(numeric_data, use = "pairwise.complete.obs")
cor_df <- as.data.frame(as.table(cor_matrix))

ggplot(cor_df, aes(Var1, Var2, fill = Freq)) +
  geom_tile() +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white",
                       midpoint = 0, limits = c(-1, 1), space = "Lab") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, size = 8, hjust = 1)) +
  coord_fixed() +
  labs(title = "Correlation Matrix Heatmap")

# -------------------------------
# Save cleaned dataset
# -------------------------------
write_csv(clean_data, "C:\\Users\\Emmanuel G. Momo\\Desktop\\webscrapping\\cleaned_climate_data.csv")
