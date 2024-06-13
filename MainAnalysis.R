##############
#Predictors, Transformation
##############
denom_data <- read.csv("Denom_data.csv", sep = ";")
DAT <- merge(Countries_IsAlC, denom_data, by = "Country")
HDI <- read.csv("HDR21-22_Composite_indices_complete_time_series.csv", sep = ";")

#Reshaping data on HDI
HDI1990 <- HDI %>% select(country, hdi_1990) %>% mutate(round = 2) %>% rename(HDI = hdi_1990)
HDI1999 <- HDI %>% select(country, hdi_1999) %>% mutate(round = 3) %>% rename(HDI = hdi_1999)
HDI2008 <- HDI %>% select(country, hdi_2008) %>% mutate(round = 4) %>% rename(HDI = hdi_2008)
HDI2017 <- HDI %>% select(country, hdi_2017) %>% mutate(round = 5) %>% rename(HDI = hdi_2017)
HDIData <- rbind(HDI1990, HDI1999, HDI2008, HDI2017)
rm(HDI1990, HDI1999, HDI2008, HDI2017)
HDIData %<>% rename(Country = country)
DATA <- merge(DAT, HDIData, by = c("Country", "round"))
DATA %<>% filter(domain != "Across Domains")

#Spliting data by issue domain
DATAcult <- DATA %>% filter(domain == "Cultural")
DATAcult %<>% mutate(round = as.factor(round))


DATAecon <- DATA %>% filter(domain == "Economic")
DATAecon %<>% mutate(round = as.factor(round))

#trichotomization religious culture
DATAcult2 <- DATAcult %>% mutate(round = as.integer(round)) %>% mutate(religdiscrete = cut(DD, 3, labels = c("Protestant", "Mixed", "Catholic")))
DATAecon2 <- DATAecon %>% mutate(round = as.integer(round)) %>% mutate(religdiscrete = cut(DD, 3, labels = c("Protestant", "Mixed", "Catholic")))

#trichotomization HDI
round1 <- DATAcult2 %>% subset(round == 1) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
round2 <- DATAcult2 %>% subset(round == 2) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
round3 <- DATAcult2 %>% subset(round == 3) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
round4 <- DATAcult2 %>% subset(round == 4) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
DATAcult3 <- bind_rows(round1, round2, round3, round4)

round1 <- DATAecon2 %>% subset(round == 1) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
round2 <- DATAecon2 %>% subset(round == 2) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
round3 <- DATAecon2 %>% subset(round == 3) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
round4 <- DATAecon2 %>% subset(round == 4) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
DATAecon3 <- bind_rows(round1, round2, round3, round4)
rm(round1, round2, round3, round4)




#####
#Predictors distribution
#####

DATA2D <- DATA %>% group_by(Country) %>% dplyr::summarize(DD = mean(DD), HDI = mean(HDI))

hist_top <- ggplot(DATA, aes(HDI)) + geom_histogram(fill = "gray70", colour = "gray60", alpha = 0.5,
                                                    binwidth = 0.02)  + xlim(0.66, 1)  + theme_classic() + 
  scale_y_continuous(breaks = NULL) +
  labs(x = "", y = "")
#hist_top

empty <- ggplot()+geom_point(aes(1,1), colour="white")+
  theme(axis.ticks=element_blank(),
        panel.background=element_blank(),
        axis.text.x=element_blank(), axis.text.y=element_blank(),
        axis.title.x=element_blank(), axis.title.y=element_blank())

scatter <- ggplot(DATA2D, aes(HDI, DD)) + geom_point(alpha = 0.5) +
  ylab("Religious Culture") + xlab("Human Development Index") + ggrepel::geom_text_repel(aes(label = Country), size = 5) +
  theme(axis.text.x = element_text(size = 16),
        axis.text.y = element_text(size = 16),
        text = element_text(size = 14)) + theme_minimal() + xlim(0.7, 1) + ylim(-1.2, 1.2)


hist_right <- ggplot(DATA, aes(DD)) + geom_histogram(fill = "gray70", colour = "gray60", alpha = 0.5,
                                                     binwidth = 0.15) + xlim(-1.05, 1.2)  + theme_classic() + scale_y_continuous(breaks = NULL) +
  labs(x = "", y = "") + coord_flip()
#hist_right

svg("Figures/predictors.svg", height = 7, width = 8, family = "cmr10")
grid.arrange(hist_top, empty, scatter, hist_right, ncol=2, nrow=2, widths=c(4, 1), heights=c(1, 4))
dev.off()

#cor(DATA2D$DD, DATA2D$HDI)


#2D Density
#ggplot(DATA2D, aes(HDI, DD)) + geom_point(alpha = 0.5) +
#  ylab("Religious Culture") + xlab("HDI") + ggrepel::geom_text_repel(aes(label = Country), size = 5) +
#  ylim(-1.25, 1.25) + xlim(0.75, 0.93) + theme(text = element_text(size = 14)) +
#  geom_histogram(data = DATA, inherit.aes = FALSE, aes(x = HDI, y = ..count../1000),
#                 fill = "gray70", colour = "gray60", alpha = 0.25, position = position_nudge(y = -1.25),
#                 binwidth = 0.02) + geom_histogram(data = DATA, inherit.aes = FALSE, aes(x = DD, y = ..count../1000),
#                                                   fill = "gray70", colour = "gray60", alpha = 0.25, position = position_nudge(y = -1.25),
#                                                   binwidth = 0.05) + coord_flip()



#####
#Country Differences
#####

#defining variable for eastern (postcommunist) Europe and western Europe
#LabCentral <- c("Czech Republic", "Slovakia", "Hungary", "Poland")
#LabWestern <- c("France", "Germany", "Ireland", "Netherlands", "Belgium", "Austria")
#LabNordic <- c("Finland", "Sweden", "Norway", "Iceland", "Denmark")
#LabSouthern <- c("Italy", "Spain", "Portugal", "Malta")

#Countries_IsAlC <- Countries_IsAlC %>% mutate(Region = case_when(Countries_IsAlC$Country %in% LabCentral ~ " Post-communist Central",
#                                                                 Countries_IsAlC$Country %in% LabWestern ~ "Western",
#                                                                 Countries_IsAlC$Country %in% LabNordic ~ "Nordic",
#                                                                 Countries_IsAlC$Country %in% LabSouthern ~ "Southern"))

Countries_IsAlC <- Countries_IsAlC %>% mutate(round = as.character(round))
Countries_IsAlC$round <- ordered(Countries_IsAlC$round,
                                 levels = c(2,3,4,5),
                                 labels = c("1990", "1999", "2008", "2017"))

country_names <- c("Austria", "Belgium", "Czech Republic", "Denmark", "Finland", "France", "Germany", "Hungary", "Iceland", 
                   "Ireland", "Italy", "Malta", "Netherlands", "Norway", "Poland", "Portugal", "Slovakia", "Spain", "Sweden")


create_plot <- function(model, country_data, country_name) {
  country_filtered <- country_data %>%
    filter(Country == country_name) %>%
    dplyr::filter(domain == "Economic" | domain == "Cultural")
  
  pred <- predict(model, newdata = country_filtered, interval = "confidence")
  
  country_filtered <- country_filtered %>%
    mutate(
      fit = pred[, "fit"],
      lwr = pred[, "lwr"],
      upr = pred[, "upr"]
    )
  
  ggplot(country_filtered, aes(x = round, y = cor, color = domain)) +
    geom_point(position = position_jitter(width = 0.2, height = 0), size = 2, alpha = 0.1) +
    geom_line(aes(y = fit, group = domain), size = .9) +
    geom_ribbon(aes(ymin = lwr, ymax = upr, group = domain, fill = domain), alpha = 0.4) +
    labs(title = country_name,
         x = "",
         y = "") + 
    scale_color_manual(values = c("Economic" = "navy", "Cultural" = "firebrick4")) +
    scale_fill_manual(values = c("Economic" = "navy", "Cultural" = "firebrick4")) +
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

models <- list(
  C_CZ = lm(cor ~ round*domain, data = Countries_IsAlC|> dplyr::filter(domain =="Economic" | domain =="Cultural"), subset=(Country == "Czech Republic")),
  C_SK = lm(cor ~ round*domain, data = Countries_IsAlC|> dplyr::filter(domain =="Economic" | domain =="Cultural"), subset=(Country == "Slovakia")),
  C_HU = lm(cor ~ round * domain, data = Countries_IsAlC|> dplyr::filter(domain =="Economic" | domain =="Cultural"), subset = (Country == "Hungary")),
  C_PL = lm(cor ~ round * domain, data = Countries_IsAlC|> dplyr::filter(domain =="Economic" | domain =="Cultural"), subset = (Country == "Poland")),
  C_FR = lm(cor ~ round * domain, data = Countries_IsAlC|> dplyr::filter(domain =="Economic" | domain =="Cultural"), subset = (Country == "France")),
  C_GE = lm(cor ~ round * domain, data = Countries_IsAlC|> dplyr::filter(domain =="Economic" | domain =="Cultural"), subset = (Country == "Germany")),
  C_IR = lm(cor ~ round * domain, data = Countries_IsAlC|> dplyr::filter(domain =="Economic" | domain =="Cultural"), subset = (Country == "Ireland")),
  C_NL = lm(cor ~ round * domain, data = Countries_IsAlC|> dplyr::filter(domain =="Economic" | domain =="Cultural"), subset = (Country == "Netherlands")),
  C_BE = lm(cor ~ round * domain, data = Countries_IsAlC|> dplyr::filter(domain =="Economic" | domain =="Cultural"), subset = (Country == "Belgium")),
  C_AU = lm(cor ~ round * domain, data = Countries_IsAlC|> dplyr::filter(domain =="Economic" | domain =="Cultural"), subset = (Country == "Austria")),
  C_FI = lm(cor ~ round * domain, data = Countries_IsAlC|> dplyr::filter(domain =="Economic" | domain =="Cultural"), subset = (Country == "Finland")),
  C_SW = lm(cor ~ round * domain, data = Countries_IsAlC|> dplyr::filter(domain =="Economic" | domain =="Cultural"), subset = (Country == "Sweden")),
  C_NO = lm(cor ~ round * domain, data = Countries_IsAlC|> dplyr::filter(domain =="Economic" | domain =="Cultural"), subset = (Country == "Norway")),
  C_IC = lm(cor ~ round * domain, data = Countries_IsAlC|> dplyr::filter(domain =="Economic" | domain =="Cultural"), subset = (Country == "Iceland")),
  C_DN = lm(cor ~ round * domain, data = Countries_IsAlC|> dplyr::filter(domain =="Economic" | domain =="Cultural"), subset = (Country == "Denmark")),
  C_IT = lm(cor ~ round * domain, data = Countries_IsAlC|> dplyr::filter(domain =="Economic" | domain =="Cultural"), subset = (Country == "Italy")),
  C_SP = lm(cor ~ round * domain, data = Countries_IsAlC|> dplyr::filter(domain =="Economic" | domain =="Cultural"), subset = (Country == "Spain")),
  C_PT = lm(cor ~ round * domain, data = Countries_IsAlC|> dplyr::filter(domain =="Economic" | domain =="Cultural"), subset = (Country == "Portugal")),
  C_MT = lm(cor ~ round * domain, data = Countries_IsAlC|> dplyr::filter(domain =="Economic" | domain =="Cultural"), subset = (Country == "Malta"))
)

reordered_models <- models[order(names(models))]

plots <- lapply(seq_along(reordered_models), function(i) {
  create_plot(reordered_models[[i]], Countries_IsAlC, country_names[i])
})



# Combine all plots using patchwork
combined_plot <- wrap_plots(plots, nrow = 5, ncol = 4) +
  plot_layout(guides = "collect") &
  theme(
    plot.margin = margin(1, 1, 1, 1, "pt")  # Reduce margins to minimize space between plots
  )
combined_plot

# Save the combined plot as an SVG file
svg("Figures/IP_Description.svg", family = "cmr10", height = 12, width = 9)
print(combined_plot)
dev.off()



#####
#Models
#####

#Cross-sectional differences
M0C <- lmer(cor ~ religdiscrete + HDI +  (round | Country), data = DATAcult3)
M0E <- lmer(cor ~ religdiscrete + HDI + (round | Country), data = DATAecon3)

sjPlot::tab_model(M0C)
sjPlot::tab_model(M0E)

arm::display(M0C)
arm::display(M0E)

?display
MC <- lmer(cor ~ round + scale(DD) + scale(HDI) + scale(DD)*round + scale(HDI)*round + (round | Country), data = DATAcult)
ME <- lmer(cor ~ round + scale(DD) + scale(HDI) + scale(DD)*round + scale(HDI)*round + (round | Country), data = DATAecon)

arm::display(MC)
#lower SD country example: Hungary
#higher SD country example: France
arm::display(ME)

MC2 <- lmer(cor ~ round + DD + HDI + DD*round + HDI*round + (round | Country), data = DATAcult)






svg("ReligintCult.svg", family = "cmr10", height = 6, width = 8)
interflex::interflex(estimator = "binning", Y = "cor", D = "religdiscrete", X = "round", data = DATAcult2, theme.bw = TRUE,
                     show.grid = TRUE, na.rm = TRUE, treat.type = "discrete", pool = TRUE, base = "Protestant",
                     ylab = "Effect on Polarization (Culture)", xlab = "Change in nine-year intervals", legend.title = "Religious culture",
                     Xdistr = "none", color = c("blue", "gray2"), bin.labs = FALSE,
                     cex.lab = 1.5, cex.axis = 1.5, cex.sub = 1.6, ylim = c(-0.2, 0.2), show.subtitles = FALSE)
dev.off()

svg("ReligintEcon.svg", family = "cmr10", height = 6, width = 8)
interflex::interflex(estimator = "binning", Y = "cor", D = "religdiscrete", X = "round", data = DATAecon2, theme.bw = TRUE,
                     show.grid = TRUE, na.rm = TRUE, treat.type = "discrete", pool = TRUE, base = "Protestant",
                     ylab = "Effect on Polarization (Economy)", xlab = "Change in nine-year intervals", legend.title = "Religious culture",
                     Xdistr = "none", color = c("blue", "gray2"), bin.labs = FALSE,
                     cex.lab = 1.5, cex.axis = 1.5, cex.sub = 1.6, ylim = c(-0.2, 0.2), show.subtitles = FALSE)
dev.off()


svg("HDIintCult.svg", family = "cmr10", height = 6, width = 8)
interflex::interflex(estimator = "binning", Y = "cor", D = "HDI", X = "round", data = DATAcult3, theme.bw = TRUE,
                     show.grid = TRUE, na.rm = TRUE, treat.type = "discrete", base = "lowest", pool = TRUE,
                     ylab = "Effect on Polarization (Culture)", xlab = "Change in nine-year intervals",
                     Xdistr = "none", bin.labs = FALSE, color = c("blue", "gray2"), legend.title = "Human Development Index",
                     cex.lab = 1.5, cex.axis = 1.5, cex.sub = 1.6, ylim = c(-0.2, 0.2), show.subtitles = FALSE)
dev.off()

svg("HDIintEcon.svg", family = "cmr10", height = 6, width = 8)
interflex::interflex(estimator = "binning", Y = "cor", D = "HDI", X = "round", data = DATAecon3, theme.bw = TRUE,
                     show.grid = TRUE, na.rm = TRUE, treat.type = "discrete", base = "lowest", pool = TRUE,
                     ylab = "Effect on Polarization (Economy)", xlab = "Change in nine-year intervals",
                     Xdistr = "none", bin.labs = FALSE, color = c("blue", "gray2"), legend.title = "Human Development Index",
                     cex.lab = 1.5, cex.axis = 1.5, cex.sub = 1.6, ylim = c(-0.2, 0.2), show.subtitles = FALSE)
dev.off()





