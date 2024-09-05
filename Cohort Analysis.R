
#Install all required packages

packages <- c("haven", "tidyverse", "Hmisc", "lme4", "svglite", "sjmisc", 
              "sjPlot", "influence.ME", "patchwork", "magrittr", "gridExtra",
              "purr")

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
library(dplyr)
library(purrr)

#import dataset
EVS_Trendfile <- read_dta("data/ZA7503_v2-0-0.dta")

#set negative values (missing in EVS) to NA
EVS_Trendfile[EVS_Trendfile < 0] <- NA
#reverse code so higher values reflect more liberal attitudes
EVSBirth <- EVS_Trendfile %>% mutate(E035 = -1*E035 + 11)


#reducing the dataset to studied variables
EVSBirth %<>% dplyr::select("E035", "E036", "E037", "E038", "E039", "E042", "F118", "F119", "F120",
                          "F121", "F122", "F123", "F126", "F132", "F144_01", "F028", "S002EVS", "X002", "COW_NUM")



#preparing functions for data transformation---------------------

# Define rounds and countries for iteration
rounds <- 2:5
countries <- c(205, 210, 211, 220, 230, 235, 255, 290, 305, 310, 316, 317, 325, 338, 375, 380, 385, 390, 395)

# Function to compute correlation matrix for a dataset
compute_rcorr_generic <- function(dataset, round, country) {
  dataset_subset <- dataset %>%
    filter(S002EVS == round, COW_NUM == country) %>%
    dplyr::select(E035:F144_01)
  
  if (nrow(dataset_subset) > 4) {  # Ensure enough observations
    return(rcorr(as.matrix(dataset_subset)))
  } else {
    return(NULL)  # Return NULL if not enough data
  }
}

# Function to compute correlations for a dataset
compute_results_generic <- function(dataset) {
  results <- expand.grid(round = rounds, country = countries) %>%
    mutate(corr_result = map2(round, country, ~compute_rcorr_generic(dataset, .x, .y))) %>%
    filter(!map_lgl(corr_result, is.null))  # Filter out empty results
  return(results)
}

# Function to flatten correlation matrices and assign round and country
flatten_results_generic <- function(result, round, country) {
  df <- flattenCorrMatrix(result$r, result$P)
  df %>%
    mutate(round = round, Country = as.character(country))  # Assign country directly
}

# Function to process results for a dataset
process_results_generic <- function(results) {
  flat_results <- pmap_dfr(
    list(results$corr_result, results$round, results$country), 
    flatten_results_generic
  )
  
  # Add human-readable country names
  flat_results <- flat_results %>%
    mutate(Country = case_when(
      Country == "205" ~ "Ireland", Country == "210" ~ "Netherlands", Country == "211" ~ "Belgium",
      Country == "220" ~ "France", Country == "230" ~ "Spain", Country == "235" ~ "Portugal",
      Country == "255" ~ "Germany", Country == "290" ~ "Poland", Country == "305" ~ "Austria",
      Country == "310" ~ "Hungary", Country == "316" ~ "Czech Republic", Country == "317" ~ "Slovakia",
      Country == "325" ~ "Italy", Country == "338" ~ "Malta", Country == "375" ~ "Finland",
      Country == "380" ~ "Sweden", Country == "385" ~ "Norway", Country == "390" ~ "Denmark",
      Country == "395" ~ "Iceland"
    ))
  
  # Add domain information and clean up the dataset
  flat_results <- flat_results %>%
    mutate(domain = case_when(
      (row %in% Cultural) & (column %in% Cultural) ~ "Cultural",
      (row %in% Economic) & (column %in% Economic) ~ "Economic",
      TRUE ~ "Across Domains"
    )) %>%
    unite("issue", row:column, remove = FALSE, sep = "-")
  
  return(flat_results %>% select(issue, cor, domain, round, Country))
}

# Final function to compute results for a dataset and return the final cleaned dataframe
compute_cohort_results <- function(dataset) {
  results <- compute_results_generic(dataset)
  flat_results_clean <- process_results_generic(results)
  return(flat_results_clean)
}



#Splitting the sample by cohorts-----------------
EVSB1 <- EVSBirth %>% subset(X002 > 1934 & X002 < 1945)
EVSB2 <- EVSBirth %>% subset(X002 > 1944 & X002 < 1955)
EVSB3 <- EVSBirth %>% subset(X002 > 1954 & X002 < 1965)
EVSB4 <- EVSBirth %>% subset(X002 > 1964 & X002 < 1975)
EVSB5 <- EVSBirth %>% subset(X002 > 1974 & X002 < 1985)
EVSB6 <- EVSBirth %>% subset(X002 > 1984 & X002 < 1995)

#Applying functions-----------------
CohortB1_IsAlC <- compute_cohort_results(EVSB1)
CohortB2_IsAlC <- compute_cohort_results(EVSB2)
CohortB3_IsAlC <- compute_cohort_results(EVSB3)
CohortB4_IsAlC <- compute_cohort_results(EVSB4)
CohortB5_IsAlC <- compute_cohort_results(EVSB5)
CohortB6_IsAlC <- compute_cohort_results(EVSB6)

# Adding birthyear identifiers to each cohort dataset
CohortB1_IsAlC %<>% mutate(birthyear = 1)
CohortB2_IsAlC %<>% mutate(birthyear = 2)
CohortB3_IsAlC %<>% mutate(birthyear = 3)
CohortB4_IsAlC %<>% mutate(birthyear = 4)
CohortB5_IsAlC %<>% mutate(birthyear = 5)
CohortB6_IsAlC %<>% mutate(birthyear = 6)

# Combining all cohort datasets into one
CohortsBData <- bind_rows(CohortB1_IsAlC, CohortB2_IsAlC, CohortB3_IsAlC, CohortB4_IsAlC, CohortB5_IsAlC, CohortB6_IsAlC)

# Removing individual cohort datasets to free up memory
rm(CohortB1_IsAlC, CohortB2_IsAlC, CohortB3_IsAlC, CohortB4_IsAlC, CohortB5_IsAlC, CohortB6_IsAlC)

# Filtering out "Across Domains" and cleaning the dataset
CohortsBData %<>% filter(domain != "Across Domains")

# Converting round to a character variable
CohortsBData <- CohortsBData %>% mutate(round = as.character(round))

# Converting birthyear to a character variable and ordering it by birth cohorts
CohortsBData <- CohortsBData %>% mutate(birthyear = as.character(birthyear))
CohortsBData$birthyear <- ordered(CohortsBData$birthyear,
                                  levels = c(1, 2, 3, 4, 5, 6),
                                  labels = c("1935-44", "1945-54", "1955-64", "1965-74", "1975-84", "1985-94"))

# Merging with HDI data and denomination data
CohortsBData2 <- merge(CohortsBData, HDIData, by = c("Country", "round"))
CohortsBData2 <- merge(CohortsBData2, denom_data, by = c("Country"))

# Ordering the rounds by specific time intervals
CohortsBData2$round <- ordered(CohortsBData2$round,
                              levels = c(2, 3, 4, 5),
                              labels = c("1990", "1999", "2008", "2017"))


# Trichotomizing HDI for each round and combining the datasets
CohortsBData21 <- CohortsBData2 %>% subset(round == "1990") %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
CohortsBData22 <- CohortsBData2 %>% subset(round == "1999") %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
CohortsBData23 <- CohortsBData2 %>% subset(round == "2008") %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
CohortsBData24 <- CohortsBData2 %>% subset(round == "2017") %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
CohortsBData2 <- bind_rows(CohortsBData21, CohortsBData22, CohortsBData23, CohortsBData24)

# Removing intermediate datasets to free up memory
rm(CohortsBData21, CohortsBData22, CohortsBData23, CohortsBData24)

# Trichotomizing religious culture (DD) for each round and combining datasets
CohortsBData31 <- CohortsBData2 %>% subset(round == "1990") %>% mutate(DD = cut(DD, 3, labels = c("Protestant", "middle", "Catholic")))
CohortsBData32 <- CohortsBData2 %>% subset(round == "1999") %>% mutate(DD = cut(DD, 3, labels = c("Protestant", "middle", "Catholic")))
CohortsBData33 <- CohortsBData2 %>% subset(round == "2008") %>% mutate(DD = cut(DD, 3, labels = c("Protestant", "middle", "Catholic")))
CohortsBData34 <- CohortsBData2 %>% subset(round == "2017") %>% mutate(DD = cut(DD, 3, labels = c("Protestant", "middle", "Catholic")))
CohortsBData2 <- bind_rows(CohortsBData31, CohortsBData32, CohortsBData33, CohortsBData34)

# Removing intermediate datasets to free up memory
rm(CohortsBData31, CohortsBData32, CohortsBData33, CohortsBData34)

# Subsetting data for Cultural and Economic domains
CohBCult <- CohortsBData2 %>% subset(domain == "Cultural")
CohBEcon <- CohortsBData2 %>% subset(domain == "Economic")


# Figure 7 ----------------------------------------------------

#Figure 7a: Economic development

Ta <- lmer(cor ~ birthyear + round + birthyear*round*HDI + (1|Country), data = CohBCult)

# Creating a new dataset with unique combinations of birthyear, round, HDI, and Country
new_data4 <- CohBCult %>%
  select(birthyear, round, HDI, Country) %>%
  distinct()

# Predicting values and standard errors based on the fitted model
pred <- predict(Ta, newdata = new_data4, re.form = NA, se.fit = TRUE)
new_data4$predicted <- pred$fit
new_data4$se.fit <- pred$se.fit

# Adding confidence intervals to the predicted data
new_data4 <- new_data4 %>%
  mutate(
    lower = predicted - 1.96 * se.fit,
    upper = predicted + 1.96 * se.fit
  )

# Renaming HDI categories for better readability
new_data4 = new_data4 |> mutate(HDI = case_when(HDI == "highest" ~ "Most Developed",
                                                HDI == "lowest" ~ "Least Developed",
                                                HDI == "middle" ~ "middle"))


svg("Figures/IP Cohorts3.svg", height = 4, width = 8, family = "cmr10")
ggplot(new_data4 |> filter(!HDI == "middle"), aes(x = round, y = predicted, color = birthyear)) +
  geom_point(size = 3) +
  geom_line(aes(y = predicted, group = birthyear), size = 1.2) +
  geom_ribbon(aes(ymin = lower, ymax = upper, group = birthyear, fill = birthyear), alpha = 0.1, color = NA) +
  facet_wrap(~HDI) +
  labs(title = "",
       x = "",
       y = "",
       color = "Birth Cohort") +
  theme_minimal() +
  scale_x_discrete(limits = levels(CohBCult$round)) +
  guides(fill = "none") +
  theme(
    plot.title = element_text(size = 14, face = "bold", hjust = 0.5),
    axis.title.x = element_text(size = 12),
    axis.title.y = element_text(size = 12),
    axis.text.x = element_text(size = 10),
    axis.text.y = element_text(size = 10),
    strip.text = element_text(size = 10),
    legend.position = "right",
    legend.title = element_text(size = 10),
    legend.text = element_text(size = 9)
  )
dev.off()

#Figure 7b: Religious Cultures
Tb <- lmer(cor ~ birthyear + round + birthyear*round*DD + (1|Country), data = CohBCult)

# Creating a new dataset with unique combinations of birthyear, round, DD, and Country
new_data5 <- CohBCult %>%
  select(birthyear, round, DD, Country) %>%
  distinct()

# Predicting values and standard errors based on the fitted model
pred <- predict(Tb, newdata = new_data5, re.form = NA, se.fit = TRUE)
new_data5$predicted <- pred$fit
new_data5$se.fit <- pred$se.fit

# Adding confidence intervals to the predicted data
new_data5 <- new_data5 %>%
  mutate(
    lower = predicted - 1.96 * se.fit,
    upper = predicted + 1.96 * se.fit
  )

svg("Figures/IP Cohorts4.svg", height = 4, width = 8, family = "cmr10")
ggplot(new_data5 |> filter(!DD == "middle"), aes(x = round, y = predicted, color = birthyear)) +
  geom_point(size = 3) +
  geom_line(aes(y = predicted, group = birthyear), size = 1.2) +
  geom_ribbon(aes(ymin = lower, ymax = upper, group = birthyear, fill = birthyear), alpha = 0.1, color = NA) +
  facet_wrap(~DD) +
  labs(title = "",
       x = "",
       y = "",
       color = "Birth Cohort") +
  theme_minimal() +
  scale_x_discrete(limits = levels(CohBCult$round)) +
  guides(fill = "none") +
  theme(
    plot.title = element_text(size = 14, face = "bold", hjust = 0.5),
    axis.title.x = element_text(size = 12),
    axis.title.y = element_text(size = 12),
    axis.text.x = element_text(size = 10),
    axis.text.y = element_text(size = 10),
    strip.text = element_text(size = 10),
    legend.position = "right",
    legend.title = element_text(size = 10),
    legend.text = element_text(size = 9)
  )
dev.off()
