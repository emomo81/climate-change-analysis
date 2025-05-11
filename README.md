# climate-change-analysis
Climate Change Indicators – Exploratory Data Analysis

This project explores the Climate Change Indicators dataset obtained from the Food and Agriculture Organization of the United Nations (FAO) via FAOSTAT. The goal is to understand temperature anomalies over time, identify global warming trends, and prepare the data for further analysis or modeling.

Dataset Source
[FAOSTAT - Environment Indicators](https://www.fao.org/faostat/en/ #data/ET)

Dataset Name: climate_change_indicators.csv
Description: Contains annual temperature change values (in °C) relative to the 1951–1980 baseline period, across multiple countries.

Project Structure:
climate_change_analysis/
│
├── data/
│   ├── climate_change_indicators.csv
│   └── cleaned_climate_data.csv
│
├── reports/
│   ├── climate_change_analysis_report.docx
│   └── climate_change_analysis_report.pdf
│
├── presentations/
│   ├── climate_change_presentation.pptx
│   └── figures/
│       ├── histogram_F1961.png
│       ├── boxplot_F1961_by_Country.png
│       ├── scatter_F1961_vs_F1970.png
│       ├── heatmap_correlation_matrix.png
│       └── line_plot_over_time.png
│
├── code/
│   ├── climate_analysis.R
│
├── visualizations/
│   ├── F1961_histogram.png
│   ├── F1961_boxplot.png
│   ├── F1961_F1970_scatter.png
│   ├── correlation_heatmap.png
│   └── line_plot_over_time.png
│
├── documentation/
│   ├── README.md
│
└── .gitignore
Requirements
To run the R script (climate_analysis.R), ensure you have the following packages installed:
install.packages(c("readr", "dplyr", "tidyr", "ggplot2"))
 Overview of Analysis
1. Data Loading
Loaded the dataset using read_csv() from the readr package.
Inspected basic structure using dim(), head(), tail(), summary(), and str().
2. Data Inspection
Identified missing values using is.na() and colSums().
Checked for duplicate rows using duplicated() and sum().
3. Data Cleaning
Imputed missing numeric values using column means.
Removed duplicate rows with unique().
Reshaped data from wide to long format for time series visualization.
4. Data Visualization
Using ggplot2, created:

Histograms of temperature anomalies (e.g., year 1961)
Boxplots grouped by decade
Scatter plots comparing early vs. recent years
Bar charts showing country representation
Correlation heatmap of yearly temperature changes
🧠 Key Insights
Global Warming Trend : Median temperature anomalies increased steadily from the 1960s onward.
Positive Correlations : Earlier and later years show strong positive relationships, indicating persistent warming patterns.
Missing Data : Some earlier years and small countries had many missing values, requiring imputation or exclusion.
Outliers : Extreme values were observed, particularly in recent decades, suggesting possible climatic extremes or measurement inconsistencies.
🚀 Future Work
Potential machine learning and statistical tasks:

Forecasting future temperature anomalies using ARIMA or LSTM networks
Clustering countries based on similar temperature trends
Detecting anomalies or extreme weather events
Investigating factors influencing regional warming (economic, geographic, etc.)
