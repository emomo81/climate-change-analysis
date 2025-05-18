# Load necessary libraries
library(readr)
library(dplyr)
library(tidyr)
library(ggplot2)

# Step 1: Load the cleaned dataset
clean_data <- read.csv("C:/Users/Emmanuel G. Momo/Desktop/climate_change_analysis/data/cleaned_climate_data.csv")

# Step 2: Inspect structure and summary
str(clean_data)
summary(clean_data)

# Step 3: Pivot wider data to long format
long_data <- clean_data %>%
  pivot_longer(cols = starts_with("F"),
               names_to = "Year",
               values_to = "temp_anomaly")

# Step 4: Convert year to numeric
long_data$Year <- as.numeric(sub("F", "", long_data$Year))

# Step 5: View structure
View(long_data)
glimpse(long_data)

# Step 6: Filter two countries (replace with any pair you like)
selected_countries <- c("Sudan", "Rwanda")

filtered_data <- long_data %>%
  filter(Country %in% selected_countries) %>%
  drop_na(temp_anomaly)  # Remove rows with missing values

filtered_data$Country <- droplevels(as.factor(filtered_data$Country))

# Step 7: Plot temperature trends
ggplot(filtered_data, aes(x = Year, y = temp_anomaly, color = Country)) +
  geom_line(size = 1) +
  labs(title = "Temperature Anomaly Trend: Sudan vs Rwanda",
       x = "Year", y = "Anomaly (°C)")

# Step 8: Boxplot of anomalies by country
ggplot(filtered_data, aes(x = Country, y = temp_anomaly, fill = Country)) +
  geom_boxplot() +
  labs(title = "Temperature Anomaly Distribution (All Years)",
       x = "Country", y = "Anomaly (°C)")
# Correlation between early and recent year anomalies
result <- cor.test(clean_data$F1961, clean_data$F2022)
print(result)

# View the correlation coefficient and p-value
cat("Correlation coefficient:", result$estimate, "\n")
cat("p-value:", result$p.value, "\n")



# Step 9: Run t-test
t_test_result <- t.test(temp_anomaly ~ Country, data = filtered_data)
print(t_test_result)

# Step 10: Run ANOVA
anova_result <- aov(temp_anomaly ~ Country, data = filtered_data)
anova_result
summary(anova_result)
