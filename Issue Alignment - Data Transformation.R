
#Install all required packages

packages <- c("haven", "tidyverse", "Hmisc", "lme4", "svglite", "sjmisc", 
              "sjPlot", "influence.ME", "patchwork", "magrittr", "gridExtra")

# Check if each package is installed, install if missing, and load it
for (pkg in packages) {
  if (!require(pkg, character.only = TRUE)) {
    install.packages(pkg)
    require(pkg, character.only = TRUE)
  }
}

#Load required packages

library(haven)
library(tidyverse)
library(Hmisc)
library(lme4)
library(svglite)
library(sjmisc)
library(sjPlot)
library(influence.ME)
library(patchwork)
library(magrittr)
library(gridExtra)

#import dataset
EVS_Trendfile <- read_dta("data/ZA7503_v2-0-0.dta")

#set negative values (missing in EVS) to NA
EVS_Trendfile[EVS_Trendfile < 0] <- NA

#reverse code so higher values reflect more liberal attitudes
#There is only one instance of this
EVS <- EVS_Trendfile %>% mutate(E035 = -1*E035 + 11)

#reducing the dataset to studied variables
EVS <- EVS %>% dplyr::select("E035", "E036", "E037", "E038", "E039", "E042", "F118", "F119", "F120",
                             "F121", "F122", "F123", "F126", "F132", "F144_01", "F028", "S002EVS",
                             "X047R_EVS", "E023", "Y002", "E033", "COW_NUM", "F025", "Y002")

#defining issue domains
Economic <- c("E035", "E036", "E037", "E038", "E039", "E042")
Cultural <- c("F118", "F119", "F120", "F121", "F122", "F123", "F126", "F132", "F144_01")

# Function to calculate and flatten correlation matrix, skipping insufficient data
get_flatten_corr <- function(data, round, country_code, country_name) {
  # Subset the data
  subset_data <- data %>% filter(S002EVS == round, COW_NUM == country_code) %>% dplyr::select(E035:F144_01)
  
  # Check if the subset has enough rows (observations)
  if (nrow(subset_data) < 5) {
    # Return an empty data frame if there are not enough observations
    return(data.frame(row = character(), column = character(), cor = numeric(), p = numeric(), round = integer(), Country = character()))
  }
  
  # Compute correlation matrix and flatten it
  res <- rcorr(as.matrix(subset_data))
  flattenCorrMatrix(res$r, res$P) %>%
    mutate(round = round, Country = country_name)
}

# List of countries with country codes and names
countries <- data.frame(
  code = c(205, 210, 211, 220, 230, 235, 255, 290, 305, 310, 316, 317, 325, 338, 375, 380, 385, 390, 395),
  name = c("Ireland", "Netherlands", "Belgium", "France", "Spain", "Portugal", "Germany", "Poland", 
           "Austria", "Hungary", "Czech Republic", "Slovakia", "Italy", "Malta", "Finland", "Sweden", 
           "Norway", "Denmark", "Iceland")
)

# List of rounds
rounds <- c(2, 3, 4, 5)

# Compute flattened correlation matrices for all combinations of countries and rounds
corr_list <- purrr::map_dfr(rounds, function(r) {
  purrr::map_dfr(seq_len(nrow(countries)), function(i) {
    get_flatten_corr(EVS, r, countries$code[i], countries$name[i])
  })
})


# Assign domains across issue
Countries_IsAlD <- corr_list %>%
  mutate(domain = case_when(
    (row %in% Cultural) & (column %in% Cultural) ~ "Cultural",
    (row %in% Economic) & (column %in% Economic) ~ "Economic",
    TRUE ~ "Across Domains"
  ))

Countries_IsAlC <- Countries_IsAlD %>%
  unite("issue", row:column, remove = FALSE, sep = "-") %>%
  dplyr::select("issue", "cor", "domain", "round", "Country")

# Adding country-level predictors


# Predictors and Data Transformation------------------------------------

# Read denominational data
denom_data <- read.csv("data/Denom_data.csv", sep = ";")

# Merge denominational data with the existing dataset (Countries_IsAlC)
DAT <- merge(Countries_IsAlC, denom_data, by = "Country")

# Read HDI data
HDI <- read.csv("data/HDR21-22_Composite_indices_complete_time_series.csv", sep = ";")

# Reshaping HDI Data by Rounds------------------------------------------

# Create individual datasets for each round and assign corresponding HDI values
HDI1990 <- HDI %>% select(country, hdi_1990) %>% mutate(round = 2) %>% rename(HDI = hdi_1990)
HDI1999 <- HDI %>% select(country, hdi_1999) %>% mutate(round = 3) %>% rename(HDI = hdi_1999)
HDI2008 <- HDI %>% select(country, hdi_2008) %>% mutate(round = 4) %>% rename(HDI = hdi_2008)
HDI2017 <- HDI %>% select(country, hdi_2017) %>% mutate(round = 5) %>% rename(HDI = hdi_2017)

# Combine all HDI datasets into one
HDIData <- rbind(HDI1990, HDI1999, HDI2008, HDI2017)

# Remove individual HDI round datasets to clean up environment
rm(HDI1990, HDI1999, HDI2008, HDI2017)

# Rename country column to "Country" to match with other datasets
HDIData %<>% rename(Country = country)

# Merge the main dataset (DAT) with HDI data by Country and Round
DATA <- merge(DAT, HDIData, by = c("Country", "round"))

# Filter out rows where the domain is "Across Domains" (keep only Cultural and Economic)
DATA %<>% filter(domain != "Across Domains")


# Load the additional datasets------------------------------------------
Gini <- read.csv("data/gini.csv")
NetM <- read.csv("data/API_SM.POP.NETM_DS2_en_excel_v2_5336229.csv")
Glob <- read.csv("data/glob.csv")

# Merge controls (Gini, NetM, and Glob datasets) with the main DATA dataset---------
DATA <- merge(DATA, Gini, by = c("Country", "round"), all.x = TRUE)
DATA <- merge(DATA, NetM, by = c("Country", "round"), all.x = TRUE)
DATA <- merge(DATA, Glob, by = c("Country", "round"), all.x = TRUE)

# Splitting Data by Issue Domain (Cultural and Economic)-----------------
DATAcult <- DATA %>% filter(domain == "Cultural") %>%
  mutate(round = as.factor(round))

DATAecon <- DATA %>% filter(domain == "Economic") %>%
  mutate(round = as.factor(round))

# Trichotomization by Religious Culture (Denominational Data)------------
DATAcult2 <- DATAcult %>% 
  mutate(round = as.integer(round)) %>%
  mutate(religdiscrete = cut(DD, 3, labels = c("Protestant", "Mixed", "Catholic")))

DATAecon2 <- DATAecon %>%
  mutate(round = as.integer(round)) %>%
  mutate(religdiscrete = cut(DD, 3, labels = c("Protestant", "Mixed", "Catholic")))

# Trichotomization of HDI Data by Round----------------------------------
rounds <- c(1, 2, 3, 4)

# For Cultural Domain
DATAcult3 <- purrr::map_dfr(rounds, function(r) {
  DATAcult2 %>%
    filter(round == r) %>%
    mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
})

# For Economic Domain
DATAecon3 <- purrr::map_dfr(rounds, function(r) {
  DATAecon2 %>%
    filter(round == r) %>%
    mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
})

# Scaling NetMper1000, GINI, and KOFGI-----------------------------------
DATAcult3 <- DATAcult3 %>%
  mutate(NetMper1000 = scale(NetMper1000, center = TRUE, scale = TRUE),
         GINI = scale(GINI, center = TRUE, scale = TRUE),
         KOFGI = scale(KOFGI, center = TRUE, scale = TRUE))

DATAecon3 <- DATAecon3 %>%
  mutate(NetMper1000 = scale(NetMper1000, center = TRUE, scale = TRUE),
         GINI = scale(GINI, center = TRUE, scale = TRUE),
         KOFGI = scale(KOFGI, center = TRUE, scale = TRUE))
