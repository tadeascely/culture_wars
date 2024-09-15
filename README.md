# New Threat of Culture Wars

**The data come from the European Values Study**:
[European Values Survey Integrated Dataset (EVS 1981-2008)](https://doi.org/10.4232/1.14021). The version I worked with is uploaded to the data folder via git LFS.

This dataset is too large to be uploaded on GitHub.

The code for this analysis was, in some cases, simplified and comes from the following sources:

- **World Bank**: Gini index, Globalization indices, and Migration data
- **UNDP**: Human Development Index
- **World Christian Encyclopedia**: Data on denominations
- **European Values Survey Integrated Trendfile**: Survey data

For more information on the measurements used, please refer to the main paper.

**Note**: Before running the code to analyze the data and generate plots, it is required that you run the **data transformation file** for each of the main analyses:
- Issue alignment
- Cohort analysis

## Producing Figures from the Main Paper

To generate the figures for the main paper, refer to the following files:

- *Issue Alignment - Main Analysis.R*: Contains code for **Figure 3**, **Figure 4**, and **Figure 6**
- *diagrams.R*: Contains code for **Figure 1** and **Figure 2**
- *Ideological Identity Alignment.R*: Contains code for **Figure 5**
- *Cohort Analysis.R*: Contains code for **Figure 7**

The transformation and analysis were performed using **R version 4.3.2 (2023-10-31 ucrt)**.

## Troubleshooting

If you encounter issues when attempting to reproduce the analysis, ensure that:

1. The working directory is set correctly.
2. All required data files are located in the appropriate folders (e.g., the `data` folder).