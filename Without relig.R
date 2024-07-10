#reverse code so higher values reflect more liberal attitudes
EVSWith <- EVS_Trendfile %>% mutate(E035 = -1*E035 + 11)
table(EVS_Trendfile$F034)/223099

#reducing the dataset to studied variables
EVSWith %<>% dplyr::select("E035", "E036", "E037", "E038", "E039", "E042", "F118", "F119", "F120",
                          "F121", "F122", "F123", "F126", "F132", "F144_01", "F028", "S002EVS", "F034", "COW_NUM")

EVSWithout <- EVSWith %>% subset(F034 == 2 | F034 == 3)

#####
#EVS With
#####

res2_235 <- rcorr(as.matrix(EVSWith %>% filter(S002EVS == 2) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res2_290 <- rcorr(as.matrix(EVSWith %>% filter(S002EVS == 2) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res2_385 <- rcorr(as.matrix(EVSWith %>% filter(S002EVS == 2) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))
res2_395 <- rcorr(as.matrix(EVSWith %>% filter(S002EVS == 2) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))
res3_235 <- rcorr(as.matrix(EVSWith %>% filter(S002EVS == 3) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res3_290 <- rcorr(as.matrix(EVSWith %>% filter(S002EVS == 3) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res3_395 <- rcorr(as.matrix(EVSWith %>% filter(S002EVS == 3) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))
res4_235 <- rcorr(as.matrix(EVSWith %>% filter(S002EVS == 4) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res4_290 <- rcorr(as.matrix(EVSWith %>% filter(S002EVS == 4) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res4_395 <- rcorr(as.matrix(EVSWith %>% filter(S002EVS == 4) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))
res4_385 <- rcorr(as.matrix(EVSWith %>% filter(S002EVS == 4) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))
res5_235 <- rcorr(as.matrix(EVSWith %>% filter(S002EVS == 5) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res5_290 <- rcorr(as.matrix(EVSWith %>% filter(S002EVS == 5) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res5_395 <- rcorr(as.matrix(EVSWith %>% filter(S002EVS == 5) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))
res5_385 <- rcorr(as.matrix(EVSWith %>% filter(S002EVS == 5) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))

#dataframes - round 2
df2_235 <- flattenCorrMatrix(res2_235$r, res2_235$P) %>% mutate(round = 2) %>% mutate(Country = "Portugal")
df2_290 <- flattenCorrMatrix(res2_290$r, res2_290$P) %>% mutate(round = 2) %>% mutate(Country = "Poland")
df2_385 <- flattenCorrMatrix(res2_385$r, res2_385$P) %>% mutate(round = 2) %>% mutate(Country = "Norway")
df2_395 <- flattenCorrMatrix(res2_395$r, res2_395$P) %>% mutate(round = 2) %>% mutate(Country = "Iceland")

#dataframes - round 3
df3_235 <- flattenCorrMatrix(res3_235$r, res3_235$P) %>% mutate(round = 3) %>% mutate(Country = "Portugal")
df3_290 <- flattenCorrMatrix(res3_290$r, res3_290$P) %>% mutate(round = 3) %>% mutate(Country = "Poland")
df3_395 <- flattenCorrMatrix(res3_395$r, res3_395$P) %>% mutate(round = 3) %>% mutate(Country = "Iceland")

#dataframes - round 4
df4_235 <- flattenCorrMatrix(res4_235$r, res4_235$P) %>% mutate(round = 4) %>% mutate(Country = "Portugal")
df4_290 <- flattenCorrMatrix(res4_290$r, res4_290$P) %>% mutate(round = 4) %>% mutate(Country = "Poland")
df4_395 <- flattenCorrMatrix(res4_395$r, res4_395$P) %>% mutate(round = 4) %>% mutate(Country = "Iceland")
df4_385 <- flattenCorrMatrix(res4_385$r, res4_385$P) %>% mutate(round = 4) %>% mutate(Country = "Norway")

#dataframes - round 5
df5_235 <- flattenCorrMatrix(res5_235$r, res5_235$P) %>% mutate(round = 5) %>% mutate(Country = "Portugal")
df5_290 <- flattenCorrMatrix(res5_290$r, res5_290$P) %>% mutate(round = 5) %>% mutate(Country = "Poland")
df5_395 <- flattenCorrMatrix(res5_395$r, res5_395$P) %>% mutate(round = 5) %>% mutate(Country = "Iceland")
df5_385 <- flattenCorrMatrix(res5_385$r, res5_385$P) %>% mutate(round = 5) %>% mutate(Country = "Norway")

#combine datasets
With_IsAl <- bind_rows(df2_235, df2_290, df2_385, df2_395, df3_235, df3_290, df3_395,
                       df4_235, df4_290, df4_395, df4_385, df5_235, df5_290, df5_395,
                       df5_385, .id = NULL)

rm(res2_235, res2_290, res2_385, res2_395, res3_235, res3_290, res3_395,
   res4_235, res4_290, res4_395, res4_385, res5_235, res5_290, res5_395,
   res5_385)

rm(df2_235, df2_290, df2_385, df2_395, df3_235, df3_290, df3_395,
   df4_235, df4_290, df4_395, df4_385, df5_235, df5_290, df5_395,
   df5_385)

With_IsAlD <- With_IsAl %>% mutate(domain = case_when((row %in% Cultural) & (column %in% Cultural) ~ "Cultural",
                                                            (row %in% Economic) & (column %in% Economic) ~ "Economic",
                                                            TRUE ~ "Across Domains"))

With_IsAlC <- With_IsAlD %>% unite("issue", row:column, remove = FALSE, sep = "-") %>% dplyr::select("issue", "cor", "domain", "round", "Country")

rm(With_IsAlD, With_IsAl)

#####
#Without
#####

res2_235 <- rcorr(as.matrix(EVSWithout %>% filter(S002EVS == 2) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res2_290 <- rcorr(as.matrix(EVSWithout %>% filter(S002EVS == 2) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res2_385 <- rcorr(as.matrix(EVSWithout %>% filter(S002EVS == 2) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))
res2_395 <- rcorr(as.matrix(EVSWithout %>% filter(S002EVS == 2) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))
res3_235 <- rcorr(as.matrix(EVSWithout %>% filter(S002EVS == 3) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res3_290 <- rcorr(as.matrix(EVSWithout %>% filter(S002EVS == 3) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res3_395 <- rcorr(as.matrix(EVSWithout %>% filter(S002EVS == 3) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))
res4_235 <- rcorr(as.matrix(EVSWithout %>% filter(S002EVS == 4) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res4_290 <- rcorr(as.matrix(EVSWithout %>% filter(S002EVS == 4) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res4_395 <- rcorr(as.matrix(EVSWithout %>% filter(S002EVS == 4) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))
res4_385 <- rcorr(as.matrix(EVSWithout %>% filter(S002EVS == 4) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))
res5_235 <- rcorr(as.matrix(EVSWithout %>% filter(S002EVS == 5) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res5_290 <- rcorr(as.matrix(EVSWithout %>% filter(S002EVS == 5) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res5_395 <- rcorr(as.matrix(EVSWithout %>% filter(S002EVS == 5) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))
res5_385 <- rcorr(as.matrix(EVSWithout %>% filter(S002EVS == 5) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))

#dataframes - round 2
df2_235 <- flattenCorrMatrix(res2_235$r, res2_235$P) %>% mutate(round = 2) %>% mutate(Country = "Portugal")
df2_290 <- flattenCorrMatrix(res2_290$r, res2_290$P) %>% mutate(round = 2) %>% mutate(Country = "Poland")
df2_385 <- flattenCorrMatrix(res2_385$r, res2_385$P) %>% mutate(round = 2) %>% mutate(Country = "Norway")
df2_395 <- flattenCorrMatrix(res2_395$r, res2_395$P) %>% mutate(round = 2) %>% mutate(Country = "Iceland")

#dataframes - round 3
df3_235 <- flattenCorrMatrix(res3_235$r, res3_235$P) %>% mutate(round = 3) %>% mutate(Country = "Portugal")
df3_290 <- flattenCorrMatrix(res3_290$r, res3_290$P) %>% mutate(round = 3) %>% mutate(Country = "Poland")
df3_395 <- flattenCorrMatrix(res3_395$r, res3_395$P) %>% mutate(round = 3) %>% mutate(Country = "Iceland")

#dataframes - round 4
df4_235 <- flattenCorrMatrix(res4_235$r, res4_235$P) %>% mutate(round = 4) %>% mutate(Country = "Portugal")
df4_290 <- flattenCorrMatrix(res4_290$r, res4_290$P) %>% mutate(round = 4) %>% mutate(Country = "Poland")
df4_395 <- flattenCorrMatrix(res4_395$r, res4_395$P) %>% mutate(round = 4) %>% mutate(Country = "Iceland")
df4_385 <- flattenCorrMatrix(res4_385$r, res4_385$P) %>% mutate(round = 4) %>% mutate(Country = "Norway")

#dataframes - round 5
df5_235 <- flattenCorrMatrix(res5_235$r, res5_235$P) %>% mutate(round = 5) %>% mutate(Country = "Portugal")
df5_290 <- flattenCorrMatrix(res5_290$r, res5_290$P) %>% mutate(round = 5) %>% mutate(Country = "Poland")
df5_395 <- flattenCorrMatrix(res5_395$r, res5_395$P) %>% mutate(round = 5) %>% mutate(Country = "Iceland")
df5_385 <- flattenCorrMatrix(res5_385$r, res5_385$P) %>% mutate(round = 5) %>% mutate(Country = "Norway")

#combine datasets
Without_IsAl <- bind_rows(df2_235, df2_290, df2_385, df2_395, df3_235, df3_290, df3_395,
                       df4_235, df4_290, df4_395, df4_385, df5_235, df5_290, df5_395,
                       df5_385, .id = NULL)

rm(res2_235, res2_290, res2_385, res2_395, res3_235, res3_290, res3_395,
   res4_235, res4_290, res4_395, res4_385, res5_235, res5_290, res5_395,
   res5_385)

rm(df2_235, df2_290, df2_385, df2_395, df3_235, df3_290, df3_395,
   df4_235, df4_290, df4_395, df4_385, df5_235, df5_290, df5_395,
   df5_385)

Without_IsAlD <- Without_IsAl %>% mutate(domain = case_when((row %in% Cultural) & (column %in% Cultural) ~ "Cultural",
                                                      (row %in% Economic) & (column %in% Economic) ~ "Economic",
                                                      TRUE ~ "Across Domains"))

Without_IsAlC <- Without_IsAlD %>% unite("issue", row:column, remove = FALSE, sep = "-") %>% dplyr::select("issue", "cor", "domain", "round", "Country")

rm(Without_IsAlD, Without_IsAl)

With_IsAlC %<>% mutate(with = 1)
Without_IsAlC %<>% mutate(with = 0)


With_out <- bind_rows(With_IsAlC, Without_IsAlC)
rm(With_IsAlC, Without_IsAlC)
With_out <- With_out %>% mutate(round = as.character(round))
With_out$round <- ordered(With_out$round,
                                 levels = c("2","3","4","5"),
                                 labels = c("1990", "1999", "2008", "2017"))
With_out = With_out |> mutate(with = as.character(with))
With_out = With_out |> filter(domain == "Cultural")

models3 <- list(
C_PT = lm(cor ~ round*with, data = With_out |> dplyr::filter(domain == "Cultural"), subset = (Country == "Portugal")),
C_PL = lm(cor ~ round*with, data = With_out |> dplyr::filter(domain == "Cultural"), subset = (Country == "Poland")),
C_NO = lm(cor ~ round*with, data = With_out |> dplyr::filter(domain == "Cultural"), subset = (Country == "Norway")),
C_IC = lm(cor ~ round*with, data = With_out |> dplyr::filter(domain == "Cultural"), subset = (Country == "Iceland"))
)

country_names2 <- c("Iceland", "Norway", "Poland", "Portugal")

create_plot4 <- function(model, country_data, country_name) {
  country_filtered <- country_data %>%
    filter(Country == country_name) %>%
    dplyr::filter(domain == "Cultural")
  
  pred <- predict(model, newdata = country_filtered, interval = "confidence")
  
  country_filtered <- country_filtered %>%
    mutate(
      fit = pred[, "fit"],
      lwr = pred[, "lwr"],
      upr = pred[, "upr"]
    )
  
  country_filtered$round <- factor(country_filtered$round, levels = c("1990", "1999", "2008", "2017"))
  
  ggplot(country_filtered, aes(x = round, y = cor, color = with)) +
    geom_point(position = position_jitter(width = 0.2, height = 0), size = 2, alpha = 0.1) +
    geom_errorbar(aes(ymin = lwr, ymax = upr, group = with), width = 0.4, size = .9) +
    labs(title = country_name,
         x = "",
         y = "") + 
    scale_color_manual(values = c("1" = "navy", "0" = "firebrick4")) +
    scale_fill_manual(values = c("1" = "navy", "0" = "firebrick4")) +
    theme_minimal() + 
    theme(
      legend.position = "none",
      plot.title = element_text(size = 11, hjust = 0.5, face = "bold"),
      axis.text.x = element_text(size = 9),
      axis.text.y = element_text(size = 9)
    ) +
    scale_y_continuous(breaks = c(0, 0.2, 0.4, 0.6), limits = c(-0.1, 0.7)) +
    scale_x_discrete(limits = levels(country_filtered$round))
}

reordered_models <- models3[order(names(models3))]


plots4 <- lapply(seq_along(reordered_models), function(i) {
  create_plot4(reordered_models[[i]], With_out, country_names2[i])
})



# Combine all plots using patchwork
combined_plot <- wrap_plots(plots4, nrow = 2, ncol = 2) +
  plot_layout(guides = "collect") &
  theme(
    plot.margin = margin(1, 1, 1, 1, "pt")  # Reduce margins to minimize space between plots
  )

svg("Figures/WithoutRelig.svg", family = "cmr10", height = 5, width = 6)
combined_plot
dev.off()
