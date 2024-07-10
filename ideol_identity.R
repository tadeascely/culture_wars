
EVS_ideol <- EVS_Trendfile %>% mutate(E035 = -1*E035 + 11)
EVS_ideol <- EVS_ideol %>% mutate(E033 = -1*E033 + 11)

EVS_ideol = EVS_ideol %>% dplyr::select("S002EVS", "COW_NUM", "E033",
                                        "E035", "E036", "E037",
                                        "E038", "E039", "E042",
                                        "F118", "F119", "F120",
                                        "F121", "F122", "F123",
                                        "F126", "F132", "F144_01")

Economic <- c("E035", "E036", "E037", "E038", "E039", "E042")
Cultural <- c("F118", "F119", "F120", "F121", "F122", "F123", "F126", "F132", "F144_01")

Countries <- c("290", "310", "316", "317", "205", "210", "211",
             "220", "230", "235", "255", "305", "325", "338",
             "375", "380", "385", "390", "395")

EVS_ideol = EVS_ideol |> filter(S002EVS > 1 & S002EVS < 6) |>
  mutate(S002EVS = as.factor(S002EVS))

EVS_ideol = EVS_ideol |> filter(COW_NUM %in% Countries)

EVS_ideol = EVS_ideol |> mutate(E033 = as.numeric(E033))

EVS_ideol <- EVS_ideol %>%
  filter(!is.na(E033))

# List of Y variables
y_vars <- c("E035", "E036", "E037", "E038", "E039", "E042",
            "F118", "F119", "F120", "F121", "F122", "F123",
            "F126", "F132", "F144_01")

# Initialize an empty list to store results
cor_results <- list()

#for (s in unique(EVS_ideol$S002EVS)) {
for (s in unique(EVS_ideol$S002EVS)) {
  for (c in unique(EVS_ideol$COW_NUM)) {
    # Subset the dataframe
    subset_df <- subset(EVS_ideol, S002EVS == s & COW_NUM == c)
    
    # Ensure E033 and Y variables are numeric
    subset_df <- subset_df %>%
      mutate(across(c(E033, all_of(y_vars)), as.numeric))
    
    # Compute correlations for the subset
    cor_list <- list()
    for (y in y_vars) {
      # Remove rows with NA values in the current pair of variables
      valid_data <- subset_df %>%
        select(E033, !!sym(y)) %>%
        na.omit()
      
      if (nrow(valid_data) > 1) {  # Ensure there are enough data points to compute correlation
        cor_list[[y]] <- cor(valid_data$E033, valid_data[[y]], use = "complete.obs")
      } else {
        cor_list[[y]] <- NA  # Handle cases where correlation cannot be computed
      }
    }
    
    # Convert to data frame
    cor_df <- data.frame(
      Y_Variable = names(cor_list),
      Correlation = unlist(cor_list)
    )
    
    # Add S002EVS and COW_NUM columns
    cor_df$S002EVS <- s
    cor_df$COW_NUM <- c
    
    # Store the result in the list
    cor_results[[paste(s, c, sep = "_")]] <- cor_df
  }
}


# Combine all results into one large dataframe
final_results_df <- do.call(rbind, cor_results)
rownames(final_results_df) <- NULL  # Reset row names

final_results_df = final_results_df |> 
  mutate(domain = case_when(Y_Variable %in% Economic ~ "Economic",
                            Y_Variable %in% Cultural ~ "Cultural"))


final_results_df = final_results_df |>
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

final_results_df <- final_results_df %>% mutate(round = as.character(S002EVS))
final_results_df$round <- ordered(final_results_df$round,
                                 levels = c(2,3,4,5),
                                 labels = c("1990", "1999", "2008", "2017"))

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

#country_names <- c("Austria", "Belgium", "Czech Republic", "Denmark", "Finland", "France", "Germany", "Hungary", "Iceland", 
#                   "Ireland", "Italy", "Malta", "Netherlands", "Norway", "Poland", "Portugal", "Slovakia", "Spain", "Sweden")

summary(models2$C2_CZ)


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
    labs(title = country_name,
         x = "",
         y = "") + 
    scale_color_manual(values = c("Economic" = "navy", "Cultural" = "firebrick4")) +
    scale_fill_manual(values = c("Economic" = "navy", "Cultural" = "firebrick4")) +
    theme_minimal() + 
    theme(
      legend.position = "none",
      plot.title = element_text(size = 11, hjust = 0.5, face = "bold"),
      axis.text.x = element_text(size = 10),
      axis.text.y = element_text(size = 9)
    ) +
    geom_hline(yintercept = 0, size = 1) +
    scale_y_continuous(breaks = c(0, 0.2, 0.4, 0.6), limits = c(-0.1, 0.7)) +
    scale_x_discrete(limits = levels(country_data$domain)) + coord_flip()
}


reordered_models2 <- models2[order(names(models2))]

plots2 <- lapply(seq_along(reordered_models2), function(i) {
  create_plot2(reordered_models2[[i]], final_results_df, country_names[i])
})



# Combine all plots using patchwork
combined_plot <- wrap_plots(plots2, nrow = 5, ncol = 4) +
  plot_layout(guides = "collect", axes = "collect_y") &
  theme(
    plot.margin = margin(1, 1, 1, 1, "pt")  # Reduce margins to minimize space between plots
  )


svg("Figures/IP_Description2.svg", family = "cmr10", height = 11, width = 9)
combined_plot
dev.off()

# Combine all plots using patchwork
combined_plot_pres <- wrap_plots(plots2, nrow = 4) +
  plot_layout(guides = "collect", axes = "collect_y") &
  theme(
    plot.margin = margin(1, 1, 1, 1, "pt")  # Reduce margins to minimize space between plots
  )


svg("Figures/IP_Description2_pres.svg", family = "cmr10", height = 6, width = 10)
combined_plot_pres
dev.off()


final_results_df$S002EVS

DAT2 <- merge(final_results_df, denom_data, by = "Country")

#Reshaping data on HDI

HDIData = HDIData |> mutate(S002EVS = round)

DATA2 <- merge(DAT2, HDIData, by = c("Country", "S002EVS"))
DATA2 %<>% filter(domain != "Across Domains")

DATA2 = DATA2 |> select(!round.y) |> rename(round = round.x)
DATA2 <- merge(DATA2, Gini, by = c("Country", "round"), all.x = TRUE)

DATA2 <- merge(DATA2, NetM, by = c("Country", "round"), all.x = TRUE)
DATA2 <- merge(DATA2, Glob, by = c("Country", "round"), all.x = TRUE)


#Spliting data by issue domain
DATAcult2 <- DATA2 %>% filter(domain == "Cultural")
DATAecon2 <- DATA2 %>% filter(domain == "Economic")

#trichotomization religious culture
DATAcult3 <- DATAcult2 %>% mutate(religdiscrete = cut(DD, 3, labels = c("Protestant", "Mixed", "Catholic")))
DATAecon3 <- DATAecon2 %>% mutate(religdiscrete = cut(DD, 3, labels = c("Protestant", "Mixed", "Catholic")))

#trichotomization HDI
round1 <- DATAcult3 %>% subset(S002EVS == 2) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
round2 <- DATAcult3 %>% subset(S002EVS == 3) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
round3 <- DATAcult3 %>% subset(S002EVS == 4) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
round4 <- DATAcult3 %>% subset(S002EVS == 5) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
DATAcult3 <- bind_rows(round1, round2, round3, round4)

round1 <- DATAecon3 %>% subset(S002EVS == 2) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
round2 <- DATAecon3 %>% subset(S002EVS == 3) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
round3 <- DATAecon3 %>% subset(S002EVS == 4) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
round4 <- DATAecon3 %>% subset(S002EVS == 5) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
DATAecon3 <- bind_rows(round1, round2, round3, round4)
rm(round1, round2, round3, round4)




NewC <- lmer(Correlation ~ religdiscrete + HDI + NetMper1000 + GINI + KOFGI +  (1 | Country), data = DATAcult3)
NewE <- lmer(Correlation ~ religdiscrete + HDI + NetMper1000 + GINI + KOFGI + (1 | Country), data = DATAecon3)

sjPlot::tab_model(NewC, show.se = T)
sjPlot::tab_model(NewE)
