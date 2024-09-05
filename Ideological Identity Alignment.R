# Import dataset---------------------------------------------------------
EVS_Trendfile <- read_dta("data/ZA7503_v2-0-0.dta") 

# Set negative values to NA----------------------------------------------
EVS_Trendfile[EVS_Trendfile < 0] <- NA  

# Transform variables--------------------------------
EVS_ideol <- EVS_Trendfile %>%
  mutate(E035 = -1 * E035 + 11) 
EVS_ideol <- EVS_ideol %>%
  mutate(E033 = -1 * E033 + 11)  # Reverse the scale for E033 (ideological identity variable) to range from 1 to 10

# Select relevant variables-----------------------------------------------
EVS_ideol = EVS_ideol %>%
  dplyr::select("S002EVS", "COW_NUM", "E033", "E035", "E036", "E037", "E038", "E039", "E042", 
                "F118", "F119", "F120", "F121", "F122", "F123", "F126", "F132", "F144_01")  

# Define variable groups-------------------------------------------------
Economic <- c("E035", "E036", "E037", "E038", "E039", "E042")  
Cultural <- c("F118", "F119", "F120", "F121", "F122", "F123", "F126", "F132", "F144_01")  

# Define country codes for filtering-------------------------------------
Countries <- c("290", "310", "316", "317", "205", "210", "211", "220", "230", "235", "255", 
               "305", "325", "338", "375", "380", "385", "390", "395")  

# Filter dataset for selected rounds--------------------------------------
EVS_ideol = EVS_ideol %>%
  filter(S002EVS > 1 & S002EVS < 6) %>%  # Keep only rounds 2 to 5
  mutate(S002EVS = as.factor(S002EVS))

# Filter dataset for selected countries-----------------------------------
EVS_ideol = EVS_ideol %>%
  filter(COW_NUM %in% Countries)  

# Convert E033 to numeric-------------------------------------------------
EVS_ideol = EVS_ideol %>%
  mutate(E033 = as.numeric(E033)) 

# Remove rows with missing E033-------------------------------------------
EVS_ideol <- EVS_ideol %>%
  filter(!is.na(E033))  


# List of Y variables-----------------------------------------------------
y_vars <- c("E035", "E036", "E037", "E038", "E039", "E042", 
            "F118", "F119", "F120", "F121", "F122", "F123", 
            "F126", "F132", "F144_01")

# Initialize an empty list to store results-------------------------------
cor_results <- list() 

# Loop through rounds (S002EVS) and countries (COW_NUM)-------------------

for (s in unique(EVS_ideol$S002EVS)) {
  for (c in unique(EVS_ideol$COW_NUM)) {
    
    # Subset the dataframe for the current round and country
    subset_df <- subset(EVS_ideol, S002EVS == s & COW_NUM == c)
    
    # Ensure E033 (ideological identity) and Y variables are numeric
    subset_df <- subset_df %>%
      mutate(across(c(E033, all_of(y_vars)), as.numeric))
    
    # Compute correlations between E033 and each Y variable
    cor_list <- list()
    for (y in y_vars) {
      # Remove rows with NA values and compute correlation
      valid_data <- subset_df %>%
        select(E033, !!sym(y)) %>%
        na.omit()
      
      if (nrow(valid_data) > 1) {  # Only compute if there's enough data
        cor_list[[y]] <- cor(valid_data$E033, valid_data[[y]], use = "complete.obs")
      } else {
        cor_list[[y]] <- NA  # If not enough data, return NA
      }
    }
    
    # Convert correlation results to data frame
    cor_df <- data.frame(
      Y_Variable = names(cor_list),
      Correlation = unlist(cor_list)
    )
    
    # Add S002EVS (round) and COW_NUM (country code) columns
    cor_df$S002EVS <- s
    cor_df$COW_NUM <- c
    
    # Store the result in the list
    cor_results[[paste(s, c, sep = "_")]] <- cor_df
  }
}

# Combine all correlation results into a single dataframe-----------------
final_results_df <- do.call(rbind, cor_results) 
rownames(final_results_df) <- NULL

# Add domain information (economic vs cultural)---------------------------
final_results_df <- final_results_df %>%
  mutate(domain = case_when(Y_Variable %in% Economic ~ "Economic",
                            Y_Variable %in% Cultural ~ "Cultural"))

# Add country names based on COW_NUM---------------------------------------
final_results_df <- final_results_df %>%
  mutate(Country = case_when(
    COW_NUM == 305 ~ "Austria",
    COW_NUM == 211 ~ "Belgium",
    COW_NUM == 316 ~ "Czech Republic",
    COW_NUM == 390 ~ "Denmark",
    COW_NUM == 375 ~ "Finland",
    COW_NUM == 220 ~ "France",
    COW_NUM == 255 ~ "Germany",
    COW_NUM == 310 ~ "Hungary",
    COW_NUM == 395 ~ "Iceland",
    COW_NUM == 205 ~ "Ireland",
    COW_NUM == 325 ~ "Italy",
    COW_NUM == 338 ~ "Malta",
    COW_NUM == 210 ~ "Netherlands",
    COW_NUM == 385 ~ "Norway",
    COW_NUM == 290 ~ "Poland",
    COW_NUM == 235 ~ "Portugal",
    COW_NUM == 317 ~ "Slovakia",
    COW_NUM == 230 ~ "Spain",
    COW_NUM == 380 ~ "Sweden"
  ))

# Convert round information to factor with labels--------------------------
final_results_df <- final_results_df %>%
  mutate(round = as.character(S002EVS)) %>%
  mutate(round = ordered(round, levels = c(2, 3, 4, 5), labels = c("1990", "1999", "2008", "2017")))

# Fit linear models for each country---------------------------------------
models2 <- list(
  C2_CZ = lm(Correlation ~ domain, data = final_results_df, subset = (Country == "Czech Republic")),
  C2_SK = lm(Correlation ~ domain, data = final_results_df, subset = (Country == "Slovakia")),
  C2_HU = lm(Correlation ~ domain, data = final_results_df, subset = (Country == "Hungary")),
  C2_PL = lm(Correlation ~ domain, data = final_results_df, subset = (Country == "Poland")),
  C2_FR = lm(Correlation ~ domain, data = final_results_df, subset = (Country == "France")),
  C2_GE = lm(Correlation ~ domain, data = final_results_df, subset = (Country == "Germany")),
  C2_IR = lm(Correlation ~ domain, data = final_results_df, subset = (Country == "Ireland")),
  C2_NL = lm(Correlation ~ domain, data = final_results_df, subset = (Country == "Netherlands")),
  C2_BE = lm(Correlation ~ domain, data = final_results_df, subset = (Country == "Belgium")),
  C2_AU = lm(Correlation ~ domain, data = final_results_df, subset = (Country == "Austria")),
  C2_FI = lm(Correlation ~ domain, data = final_results_df, subset = (Country == "Finland")),
  C2_SW = lm(Correlation ~ domain, data = final_results_df, subset = (Country == "Sweden")),
  C2_NO = lm(Correlation ~ domain, data = final_results_df, subset = (Country == "Norway")),
  C2_IC = lm(Correlation ~ domain, data = final_results_df, subset = (Country == "Iceland")),
  C2_DN = lm(Correlation ~ domain, data = final_results_df, subset = (Country == "Denmark")),
  C2_IT = lm(Correlation ~ domain, data = final_results_df, subset = (Country == "Italy")),
  C2_SP = lm(Correlation ~ domain, data = final_results_df, subset = (Country == "Spain")),
  C2_PT = lm(Correlation ~ domain, data = final_results_df, subset = (Country == "Portugal")),
  C2_MT = lm(Correlation ~ domain, data = final_results_df, subset = (Country == "Malta"))
)

# Function to create a plot for each country-------------------------------
create_plot2 <- function(model, country_data, country_name) {
  country_data <- final_results_df[final_results_df$Country == country_name, ]
  
  pred <- predict(model, newdata = country_data, interval = "confidence")
  
  country_data$predicted <- pred[, "fit"]
  country_data$lower <- pred[, "lwr"]
  country_data$upper <- pred[, "upr"]
  
  ggplot(country_data, aes(x = domain, y = Correlation, color = domain, fill = domain)) +
    geom_point(position = position_jitter(width = 0.2, height = 0), size = 3, alpha = 0.1) +
    geom_point(aes(y = predicted, color = domain), size = 1.5, alpha = 0.1) +
    geom_errorbar(aes(ymin = lower, ymax = upper), width = 0.5, size = 1.2) +
    labs(title = country_name, x = "", y = "") +
    scale_color_manual(values = c("Economic" = "navy", "Cultural" = "firebrick4")) +
    scale_fill_manual(values = c("Economic" = "navy", "Cultural" = "firebrick4")) +
    theme_minimal() + 
    theme(legend.position = "none",
          plot.title = element_text(size = 11, hjust = 0.5, face = "bold"),
          axis.text.x = element_text(size = 10),
          axis.text.y = element_text(size = 9)) +
    geom_hline(yintercept = 0, size = 1) +
    scale_y_continuous(breaks = c(0, 0.2, 0.4, 0.6), limits = c(-0.1, 0.7)) +
    scale_x_discrete(limits = levels(country_data$domain)) + coord_flip()
}

# Reorder models alphabetically by country name----------------------------
reordered_models2 <- models2[order(names(models2))]

# Create plots for each country--------------------------------------------
plots2 <- lapply(seq_along(reordered_models2), function(i) {
  create_plot2(reordered_models2[[i]], final_results_df, country_names[i])
})

# Combine all plots into a grid using patchwork----------------------------
combined_plot2 <- wrap_plots(plots2, nrow = 5, ncol = 4) +
  plot_layout(guides = "collect", axes = "collect_y") &
  theme(plot.margin = margin(1, 1, 1, 1, "pt"))




# Figure 5------------------------------------
svg("Figures/IP_Description2.svg", family = "cmr10", height = 11, width = 9)
combined_plot2
dev.off()



# Merge final results with denomination data----------------------------
DAT2 <- merge(final_results_df, denom_data, by = "Country")

# Reshape HDI data and merge with main dataset---------------------------
HDIData = HDIData |> mutate(S002EVS = round)
DATA2 <- merge(DAT2, HDIData, by = c("Country", "S002EVS"))
DATA2 %<>% filter(domain != "Across Domains")

# Clean up 'round' column and merge with additional datasets--------------
DATA2 = DATA2 |> select(!round.y) |> rename(round = round.x)
DATA2 <- merge(DATA2, Gini, by = c("Country", "round"), all.x = TRUE)
DATA2 <- merge(DATA2, NetM, by = c("Country", "round"), all.x = TRUE)
DATA2 <- merge(DATA2, Glob, by = c("Country", "round"), all.x = TRUE)

# Split data by issue domain (Cultural and Economic)----------------------
DATAcult2 <- DATA2 %>% filter(domain == "Cultural")
DATAecon2 <- DATA2 %>% filter(domain == "Economic")

# Trichotomization of religious culture-----------------------------------
DATAcult3 <- DATAcult2 %>% mutate(religdiscrete = cut(DD, 3, labels = c("Protestant", "Mixed", "Catholic")))
DATAecon3 <- DATAecon2 %>% mutate(religdiscrete = cut(DD, 3, labels = c("Protestant", "Mixed", "Catholic")))

# Trichotomization of HDI by round for Cultural data----------------------
round1 <- DATAcult3 %>% subset(S002EVS == 2) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
round2 <- DATAcult3 %>% subset(S002EVS == 3) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
round3 <- DATAcult3 %>% subset(S002EVS == 4) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
round4 <- DATAcult3 %>% subset(S002EVS == 5) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
DATAcult3 <- bind_rows(round1, round2, round3, round4)

# Trichotomization of HDI by round for Economic data----------------------
round1 <- DATAecon3 %>% subset(S002EVS == 2) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
round2 <- DATAecon3 %>% subset(S002EVS == 3) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
round3 <- DATAecon3 %>% subset(S002EVS == 4) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
round4 <- DATAecon3 %>% subset(S002EVS == 5) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
DATAecon3 <- bind_rows(round1, round2, round3, round4)

# Clean up intermediate variables-----------------------------------------
rm(round1, round2, round3, round4)

# Fit linear mixed-effects models-----------------------------------------
NewC <- lmer(Correlation ~ religdiscrete + HDI + NetMper1000 + GINI + KOFGI +  (1 | Country), data = DATAcult3)
NewE <- lmer(Correlation ~ religdiscrete + HDI + NetMper1000 + GINI + KOFGI + (1 | Country), data = DATAecon3)

# Summary for the Cultural and Economic domain model-----------------
sjPlot::tab_model(NewC, show.se = T)
sjPlot::tab_model(NewE)
