
# Mean Predictor values across countries-----------------------------------


# Summarize data by 'Country', calculating the mean of 'DD' and 'HDI'
DATA2D <- DATA %>% group_by(Country) %>% dplyr::summarize(DD = mean(DD), HDI = mean(HDI))

# Create a histogram of 'HDI' (Human Development Index)-------------------
hist_top <- ggplot(DATA, aes(HDI)) + 
  geom_histogram(fill = "gray70", colour = "gray60", alpha = 0.5, binwidth = 0.02) + 
  xlim(0.66, 1) + theme_classic() + scale_y_continuous(breaks = NULL) + labs(x = "", y = "")

# Create an empty placeholder plot----------------------------------------
empty <- ggplot() + geom_point(aes(1,1), colour = "white") + 
  theme(axis.ticks = element_blank(), panel.background = element_blank(), axis.text.x = element_blank(),
        axis.text.y = element_blank(), axis.title.x = element_blank(), axis.title.y = element_blank())

# Create a scatter plot of 'HDI' vs 'DD' with country labels--------------
scatter <- ggplot(DATA2D, aes(HDI, DD)) + 
  geom_point(alpha = 0.5) + ylab("Religious Culture") + xlab("Human Development Index") + 
  ggrepel::geom_text_repel(aes(label = Country), size = 4) + theme(text = element_text(size = 14)) + 
  theme_minimal() + xlim(0.7, 1) + ylim(-1.2, 1.2)

# Create a horizontal histogram of 'DD' (Religious Culture)---------------
hist_right <- ggplot(DATA, aes(DD)) + 
  geom_histogram(fill = "gray70", colour = "gray60", alpha = 0.5, binwidth = 0.15) + 
  xlim(-1.05, 1.2) + theme_classic() + scale_y_continuous(breaks = NULL) + labs(x = "", y = "") + coord_flip()

# Figure 3--------------------------
svg("Figures/predictors.svg", height = 5, width = 6, family = "cmr10")
grid.arrange(hist_top, empty, scatter, hist_right, ncol = 2, nrow = 2, widths = c(4, 1), heights = c(1, 4))
dev.off()





# Modify 'round' column to be a factor with specific order and labels---------
Countries_IsAlC <- Countries_IsAlC %>% mutate(round = as.character(round))
Countries_IsAlC$round <- ordered(Countries_IsAlC$round,
                                 levels = c(2,3,4,5),
                                 labels = c("1990", "1999", "2008", "2017"))

# Define a vector of country names------------------------------------------
country_names <- c("Austria", "Belgium", "Czech Republic", "Denmark", "Finland", "France", 
                   "Germany", "Hungary", "Iceland", "Ireland", "Italy", "Malta", 
                   "Netherlands", "Norway", "Poland", "Portugal", "Slovakia", "Spain", 
                   "Sweden")

# Create a function to generate plots for each country-----------------------
create_plot <- function(model, country_data, country_name) {
  country_filtered <- country_data %>%
    filter(Country == country_name) %>%
    dplyr::filter(domain == "Economic" | domain == "Cultural")  # Filter for relevant domains
  
  pred <- predict(model, newdata = country_filtered, interval = "confidence")  # Predict values
  
  country_filtered <- country_filtered %>%
    mutate(
      fit = pred[, "fit"],
      lwr = pred[, "lwr"],
      upr = pred[, "upr"]
    )  # Add fitted values and confidence intervals to data
  
  ggplot(country_filtered, aes(x = round, y = cor, color = domain)) +
    geom_point(position = position_jitter(width = 0.2, height = 0), size = 2, alpha = 0.1) +
    geom_line(aes(y = fit, group = domain), size = .9) +
    geom_ribbon(aes(ymin = lwr, ymax = upr, group = domain, fill = domain), alpha = 0.4) +
    labs(title = country_name, x = "", y = "") +
    scale_color_manual(values = c("Economic" = "navy", "Cultural" = "firebrick4")) +
    scale_fill_manual(values = c("Economic" = "navy", "Cultural" = "firebrick4")) +
    theme_minimal() +
    theme(legend.position = "none", plot.title = element_text(size = 11, hjust = 0.5, face = "bold"),
          axis.text.x = element_text(size = 9), axis.text.y = element_text(size = 9)) +
    scale_y_continuous(breaks = c(0, 0.2, 0.4, 0.6), limits = c(-0.1, 0.7)) +
    scale_x_discrete(limits = levels(country_filtered$round))  # Return the plot
}

# Fit linear models for multiple countries and domains----------------------
models <- list(
  C_CZ = lm(cor ~ round*domain, data = Countries_IsAlC |> dplyr::filter(domain =="Economic" | domain =="Cultural"), subset = (Country == "Czech Republic")),
  C_SK = lm(cor ~ round*domain, data = Countries_IsAlC |> dplyr::filter(domain =="Economic" | domain =="Cultural"), subset = (Country == "Slovakia")),
  C_HU = lm(cor ~ round * domain, data = Countries_IsAlC |> dplyr::filter(domain =="Economic" | domain =="Cultural"), subset = (Country == "Hungary")),
  C_PL = lm(cor ~ round * domain, data = Countries_IsAlC |> dplyr::filter(domain =="Economic" | domain =="Cultural"), subset = (Country == "Poland")),
  C_FR = lm(cor ~ round * domain, data = Countries_IsAlC |> dplyr::filter(domain =="Economic" | domain =="Cultural"), subset = (Country == "France")),
  C_GE = lm(cor ~ round * domain, data = Countries_IsAlC |> dplyr::filter(domain =="Economic" | domain =="Cultural"), subset = (Country == "Germany")),
  C_IR = lm(cor ~ round * domain, data = Countries_IsAlC |> dplyr::filter(domain =="Economic" | domain =="Cultural"), subset = (Country == "Ireland")),
  C_NL = lm(cor ~ round * domain, data = Countries_IsAlC |> dplyr::filter(domain =="Economic" | domain =="Cultural"), subset = (Country == "Netherlands")),
  C_BE = lm(cor ~ round * domain, data = Countries_IsAlC |> dplyr::filter(domain =="Economic" | domain =="Cultural"), subset = (Country == "Belgium")),
  C_AU = lm(cor ~ round * domain, data = Countries_IsAlC |> dplyr::filter(domain =="Economic" | domain =="Cultural"), subset = (Country == "Austria")),
  C_FI = lm(cor ~ round * domain, data = Countries_IsAlC |> dplyr::filter(domain =="Economic" | domain =="Cultural"), subset = (Country == "Finland")),
  C_SW = lm(cor ~ round * domain, data = Countries_IsAlC |> dplyr::filter(domain =="Economic" | domain =="Cultural"), subset = (Country == "Sweden")),
  C_NO = lm(cor ~ round * domain, data = Countries_IsAlC |> dplyr::filter(domain =="Economic" | domain =="Cultural"), subset = (Country == "Norway")),
  C_IC = lm(cor ~ round * domain, data = Countries_IsAlC |> dplyr::filter(domain =="Economic" | domain =="Cultural"), subset = (Country == "Iceland")),
  C_DN = lm(cor ~ round * domain, data = Countries_IsAlC |> dplyr::filter(domain =="Economic" | domain =="Cultural"), subset = (Country == "Denmark")),
  C_IT = lm(cor ~ round * domain, data = Countries_IsAlC |> dplyr::filter(domain =="Economic" | domain =="Cultural"), subset = (Country == "Italy")),
  C_SP = lm(cor ~ round * domain, data = Countries_IsAlC |> dplyr::filter(domain =="Economic" | domain =="Cultural"), subset = (Country == "Spain")),
  C_PT = lm(cor ~ round * domain, data = Countries_IsAlC |> dplyr::filter(domain =="Economic" | domain =="Cultural"), subset = (Country == "Portugal")),
  C_MT = lm(cor ~ round * domain, data = Countries_IsAlC |> dplyr::filter(domain =="Economic" | domain =="Cultural"), subset = (Country == "Malta"))
)

# Reorder the models alphabetically by country name------------------------
reordered_models <- models[order(names(models))]

# Create a plot for each country using the create_plot function------------
plots <- lapply(seq_along(reordered_models), function(i) {
  create_plot(reordered_models[[i]], Countries_IsAlC, country_names[i])
})

# Combine all plots into a grid layout using patchwork---------------------
combined_plot <- wrap_plots(plots, nrow = 5, ncol = 4) +
  plot_layout(guides = "collect") & theme(
    plot.margin = margin(1, 1, 1, 1, "pt")  # Reduce space between plots
  )

# Figure 4 ----------------------

svg("Figures/IP_Description.svg", family = "cmr10", height = 12, width = 9)
print(combined_plot)
dev.off()


# Fit a mixed-effects model for the Cultural domain----------------------
MC <- lmer(
  cor ~ religdiscrete + HDI + NetMper1000 + GINI + KOFGI + (round | Country),  # Fixed effects for predictors and random slope for 'round' across countries
  data = DATAcult3  # Data for the cultural domain
)

# Fit a mixed-effects model for the Economic domain----------------------
ME <- lmer(
  cor ~ religdiscrete + HDI + NetMper1000 + GINI + KOFGI + (round | Country),  # Fixed effects for predictors and random slope for 'round' across countries
  data = DATAecon3  # Data for the economic domain
)

# Summary for the Cultural domain model-----------------
tab_model(MC) 

# Summary for the Economic domain model-----------------
tab_model(ME)



# Figure 6 ----------------------

# The following code generates SVG figures using the 'interflex' package to visualize the interaction effects 
# between religious culture, HDI, and polarization (cor) over time in both the Cultural and Economic domains.
# The figures are saved in the "Figures" folder in SVG format, ensuring scalability and high-quality output.

# Figure: Interaction effect between religious culture and polarization in the Cultural domain---------------
svg("Figures/ReligintCult.svg", family = "cmr10", height = 6, width = 8)
interflex::interflex(estimator = "binning", Y = "cor", D = "religdiscrete", X = "round", data = DATAcult2, theme.bw = TRUE,
                     show.grid = TRUE, na.rm = TRUE, treat.type = "discrete", pool = TRUE, base = "Protestant",
                     ylab = "Effect on Polarization (Culture)", xlab = "Change in nine-year intervals", legend.title = "Religious culture",
                     Xdistr = "none", color = c("black", "navy", "firebrick4"), bin.labs = FALSE,
                     cex.lab = 1.5, cex.axis = 1.5, cex.sub = 1.6, ylim = c(-0.2, 0.2), show.subtitles = FALSE)
dev.off()

# Figure: Interaction effect between religious culture and polarization in the Economic domain--------------
svg("Figures/ReligintEcon.svg", family = "cmr10", height = 6, width = 8)
interflex::interflex(estimator = "binning", Y = "cor", D = "religdiscrete", X = "round", data = DATAecon2, theme.bw = TRUE,
                     show.grid = TRUE, na.rm = TRUE, treat.type = "discrete", pool = TRUE, base = "Protestant",
                     ylab = "Effect on Polarization (Economy)", xlab = "Change in nine-year intervals", legend.title = "Religious culture",
                     Xdistr = "none", color = c("black", "navy", "firebrick4"), bin.labs = FALSE,
                     cex.lab = 1.5, cex.axis = 1.5, cex.sub = 1.6, ylim = c(-0.2, 0.2), show.subtitles = FALSE)
dev.off()

# Figure: Interaction effect between HDI and polarization in the Cultural domain----------------------------
svg("Figures/HDIintCult.svg", family = "cmr10", height = 6, width = 8)
interflex::interflex(estimator = "binning", Y = "cor", D = "HDI", X = "round", data = DATAcult3, theme.bw = TRUE,
                     show.grid = TRUE, na.rm = TRUE, treat.type = "discrete", base = "lowest", pool = TRUE,
                     ylab = "Effect on Polarization (Culture)", xlab = "Change in nine-year intervals",
                     Xdistr = "none", bin.labs = FALSE, color = c("black", "navy", "firebrick4"), legend.title = "Human Development Index",
                     cex.lab = 1.5, cex.axis = 1.5, cex.sub = 1.6, ylim = c(-0.2, 0.2), show.subtitles = FALSE)
dev.off()

# Figure: Interaction effect between HDI and polarization in the Economic domain----------------------------

svg("Figures/HDIintEcon.svg", family = "cmr10", height = 6, width = 8)
interflex::interflex(estimator = "binning", Y = "cor", D = "HDI", X = "round", data = DATAecon3, theme.bw = TRUE,
                     show.grid = TRUE, na.rm = TRUE, treat.type = "discrete", base = "lowest", pool = TRUE,
                     ylab = "Effect on Polarization (Economy)", xlab = "Change in nine-year intervals",
                     Xdistr = "none", bin.labs = FALSE, color = c("black", "navy", "firebrick4"), legend.title = "Human Development Index",
                     cex.lab = 1.5, cex.axis = 1.5, cex.sub = 1.6, ylim = c(-0.2, 0.2), show.subtitles = FALSE)
dev.off()





