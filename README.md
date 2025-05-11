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
