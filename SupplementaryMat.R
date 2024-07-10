Gini <- read.csv("gini.csv")
#Gini %<>%rename(Country = ď.żCountry)
NetM <- read.csv("API_SM.POP.NETM_DS2_en_excel_v2_5336229.csv", sep = ";")
Glob <- read.csv("glob.csv")

DATArep1 <- merge(DATA, Gini, by = c("Country", "round"), all.x = TRUE)
DATArep2 <- merge(DATArep1, NetM, by = c("Country", "round"), all.x = TRUE)
DATArep3 <- merge(DATArep2, Glob, by = c("Country", "round"), all.x = TRUE)

Rep3cult <- DATArep3 %>% filter(domain == "Cultural")
Rep3cult %<>% mutate(round = case_when(round == 1990 ~ 1,
                                       round == 1999 ~ 2,
                                       round == 2008 ~ 3,
                                       round == 2017 ~ 4))
Rep3cult %<>% mutate(round = as.factor(round))

Rep3econ <- DATArep3 %>% filter(domain == "Economic")
Rep3econ %<>% mutate(round = case_when(round == 1990 ~ 1,
                                       round == 1999 ~ 2,
                                       round == 2008 ~ 3,
                                       round == 2017 ~ 4))
Rep3econ %<>% mutate(round = as.factor(round))

#trichotomization religious culture
Rep1DATAcult2 <- Rep3cult %>% mutate(round = as.integer(round)) %>% mutate(religdiscrete = cut(DD, 3, labels = c("Protestant", "Mixed", "Catholic")))
Rep1DATAecon2 <- Rep3econ %>% mutate(round = as.integer(round)) %>% mutate(religdiscrete = cut(DD, 3, labels = c("Protestant", "Mixed", "Catholic")))

#trichotomization GDPpc
round1 <- Rep1DATAcult2 %>% subset(round == 1) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
round2 <- Rep1DATAcult2 %>% subset(round == 2) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
round3 <- Rep1DATAcult2 %>% subset(round == 3) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
round4 <- Rep1DATAcult2 %>% subset(round == 4) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
Rep1DATAcult3 <- bind_rows(round1, round2, round3, round4)

round1 <- Rep1DATAecon2 %>% subset(round == 1) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
round2 <- Rep1DATAecon2 %>% subset(round == 2) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
round3 <- Rep1DATAecon2 %>% subset(round == 3) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
round4 <- Rep1DATAecon2 %>% subset(round == 4) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
Rep1DATAecon3 <- bind_rows(round1, round2, round3, round4)
rm(round1, round2, round3, round4)

Rep1DATAcult3 = Rep1DATAcult3 |> mutate(NetMper1000 = scale(NetMper1000, center = TRUE, scale = TRUE),
                                        GINI = scale(GINI, center = TRUE, scale = TRUE),
                                        KOFGI = scale(KOFGI, center = TRUE, scale = TRUE))

Rep1DATAecon3 = Rep1DATAecon3 |> mutate(NetMper1000 = scale(NetMper1000, center = TRUE, scale = TRUE),
                                        GINI = scale(GINI, center = TRUE, scale = TRUE),
                                        KOFGI = scale(KOFGI, center = TRUE, scale = TRUE))


Rep3MC <- lmer(cor ~ religdiscrete + HDI + NetMper1000 + GINI + KOFGI + (round | Country), data = Rep1DATAcult3)
Rep3ME <- lmer(cor ~ religdiscrete + HDI + NetMper1000 + GINI + KOFGI + (round | Country), data = Rep1DATAecon3)#, control=lmerControl(optimizer="bobyqa",
#optCtrl=list(maxfun=2e5)))
summary(Rep3MC)

arm::display(Rep3MC)

arm::display(Rep3ME)



#####
#Replication with different predictors
#####
GDP <- read.csv("API_NY.GDP.PCAP.CD_DS2_en_csv_v2_5839616.csv", sep = ";")
#GDP %<>%rename(Country = ď.żCountry)
DATArep <- merge(DAT, GDP, by = c("Country", "round"))
DATArep %<>% filter(domain != "Across Domains")

DATArep %<>% mutate(logGDPpc = log(GDPpc))

Repcult <- DATArep %>% filter(domain == "Cultural")
Repcult %<>% mutate(round = case_when(round == 1990 ~ 1,
                                      round == 1999 ~ 2,
                                      round == 2008 ~ 3,
                                      round == 2017 ~ 4))
Repcult %<>% mutate(round = as.factor(round))


Repecon <- DATArep %>% filter(domain == "Economic")
Repecon %<>% mutate(round = case_when(round == 1990 ~ 1,
                                      round == 1999 ~ 2,
                                      round == 2008 ~ 3,
                                      round == 2017 ~ 4))
Repecon %<>% mutate(round = as.factor(round))

#trichotomization religious culture
RepDATAcult2 <- Repcult %>% mutate(round = as.integer(round)) %>% mutate(religdiscrete = cut(DD, 3, labels = c("Protestant", "Mixed", "Catholic")))
RepDATAecon2 <- Repecon %>% mutate(round = as.integer(round)) %>% mutate(religdiscrete = cut(DD, 3, labels = c("Protestant", "Mixed", "Catholic")))

#trichotomization GDPpc
round1 <- RepDATAcult2 %>% subset(round == 1) %>% mutate(GDPpc = cut(GDPpc, 3, labels = c("lowest", "middle", "highest")))
round2 <- RepDATAcult2 %>% subset(round == 2) %>% mutate(GDPpc = cut(GDPpc, 3, labels = c("lowest", "middle", "highest")))
round3 <- RepDATAcult2 %>% subset(round == 3) %>% mutate(GDPpc = cut(GDPpc, 3, labels = c("lowest", "middle", "highest")))
round4 <- RepDATAcult2 %>% subset(round == 4) %>% mutate(GDPpc = cut(GDPpc, 3, labels = c("lowest", "middle", "highest")))
RepDATAcult3 <- bind_rows(round1, round2, round3, round4)

round1 <- RepDATAecon2 %>% subset(round == 1) %>% mutate(GDPpc = cut(GDPpc, 3, labels = c("lowest", "middle", "highest")))
round2 <- RepDATAecon2 %>% subset(round == 2) %>% mutate(GDPpc = cut(GDPpc, 3, labels = c("lowest", "middle", "highest")))
round3 <- RepDATAecon2 %>% subset(round == 3) %>% mutate(GDPpc = cut(GDPpc, 3, labels = c("lowest", "middle", "highest")))
round4 <- RepDATAecon2 %>% subset(round == 4) %>% mutate(GDPpc = cut(GDPpc, 3, labels = c("lowest", "middle", "highest")))
RepDATAecon3 <- bind_rows(round1, round2, round3, round4)
rm(round1, round2, round3, round4)

RepM0C <- lmer(cor ~ religdiscrete + GDPpc +  (round | Country), data = RepDATAcult3)
RepM0E <- lmer(cor ~ religdiscrete + GDPpc + (round | Country), data = RepDATAecon3)

arm::display(RepM0C)
arm::display(RepM0E)

#denominations with survey respondents

EVS2 <- EVS[!is.na(EVS$AREA),]
EVS2 %<>% mutate(catholic = case_when(F025 == 1 ~ 1,
                                      TRUE ~ 0),
                 protestant = case_when(F025 == 2 ~ 1,
                                        TRUE ~ 0))
#table(EVS2$protestant)

#explore <- EVS2 %>% group_by(COW_NUM, S002EVS) %>% dplyr::summarize(sumcat = sum(catholic)/n(catholic), sumprot = sum(protestant)/n(protestant))
#ireland <- EVS2 %>% subset(COW_NUM == 205)
#table(ireland$protestant, ireland$S002EVS)

denominations <- EVS2 %>% group_by(COW_NUM, S002EVS) %>% dplyr::summarize(denomratio = sum(catholic)/n() - sum(protestant)/n())
denominations %<>% mutate(Country = case_when(COW_NUM == 205 ~ "Ireland",
                                              COW_NUM == 210 ~ "Netherlands",
                                              COW_NUM == 211 ~ "Belgium",
                                              COW_NUM == 220 ~ "France",
                                              COW_NUM == 230 ~ "Spain",
                                              COW_NUM == 235 ~ "Portugal",
                                              COW_NUM == 255 ~ "Germany",
                                              COW_NUM == 290 ~ "Poland",
                                              COW_NUM == 305 ~ "Austria",
                                              COW_NUM == 310 ~ "Hungary",
                                              COW_NUM == 316 ~ "Czech Republic",
                                              COW_NUM == 317 ~ "Slovakia",
                                              COW_NUM == 325 ~ "Italy",
                                              COW_NUM == 338 ~ "Malta",
                                              COW_NUM == 375 ~ "Finland",
                                              COW_NUM == 380 ~ "Sweden",
                                              COW_NUM == 385 ~ "Norway",
                                              COW_NUM == 390 ~ "Denmark",
                                              COW_NUM == 395 ~ "Iceland"),
                          round = S002EVS)
denominations %<>% mutate(round = case_when(round == 1 ~ 1990,
                                            round == 2 ~ 1999,
                                            round == 3 ~ 2008,
                                            round == 4 ~ 2017)) %>% select(Country, round, denomratio)
DATArep4 <- merge(DATA, denominations, by = c("Country", "round"), all.x = TRUE)

Rep4cult <- DATArep4 %>% filter(domain == "Cultural")
Rep4cult %<>% mutate(round = case_when(round == 1990 ~ 1,
                                       round == 1999 ~ 2,
                                       round == 2008 ~ 3,
                                       round == 2017 ~ 4))
Rep4cult %<>% mutate(round = as.factor(round))


Rep4econ <- DATArep4 %>% filter(domain == "Economic")
Rep4econ %<>% mutate(round = case_when(round == 1990 ~ 1,
                                       round == 1999 ~ 2,
                                       round == 2008 ~ 3,
                                       round == 2017 ~ 4))
Rep4econ %<>% mutate(round = as.factor(round))

Rep4cult %<>% mutate(round = as.integer(round))
Rep4econ %<>% mutate(round = as.integer(round))

#trichotomization religious culture
#Rep2DATAcult2 <- Rep4cult %>% mutate(round = as.integer(round))
#Rep2DATAecon2 <- Rep4econ %>% mutate(round = as.integer(round))

#trichotomization HDI and denomratio
#round1 <- Rep2DATAcult2 %>% subset(round == 1) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")),
#                                                          denomratio = cut(denomratio, 3, labels = c("Protestant", "Mixed", "Catholic")))
#round2 <- Rep2DATAcult2 %>% subset(round == 2) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")),
#                                                          denomratio = cut(denomratio, 3, labels = c("Protestant", "Mixed", "Catholic")))
#round3 <- Rep2DATAcult2 %>% subset(round == 3) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")),
#                                                          denomratio = cut(denomratio, 3, labels = c("Protestant", "Mixed", "Catholic")))
#round4 <- Rep2DATAcult2 %>% subset(round == 4) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")),
#                                                          denomratio = cut(denomratio, 3, labels = c("Protestant", "Mixed", "Catholic")))
#Rep2DATAcult3 <- bind_rows(round1, round2, round3, round4)

#round1 <- Rep2DATAecon2 %>% subset(round == 1) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")),
#                                                                                  denomratio = cut(denomratio, 3, labels = c("Protestant", "Mixed", "Catholic")))
#round2 <- Rep2DATAecon2 %>% subset(round == 2) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")),
#                                                                                  denomratio = cut(denomratio, 3, labels = c("Protestant", "Mixed", "Catholic")))
#round3 <- Rep2DATAecon2 %>% subset(round == 3) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")),
#                                                                                  denomratio = cut(denomratio, 3, labels = c("Protestant", "Mixed", "Catholic")))
#round4 <- Rep2DATAecon2 %>% subset(round == 4) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")),
#                                                                                  denomratio = cut(denomratio, 3, labels = c("Protestant", "Mixed", "Catholic")))
#Rep2DATAecon3 <- bind_rows(round1, round2, round3, round4)
#rm(round1, round2, round3, round4)

#Rep2M0C <- lmer(cor ~ denomratio + HDI +  (round | Country), data = Rep2DATAcult3, control=lmerControl(optimizer="bobyqa",
#                                                                                                   optCtrl=list(maxfun=2e5)))
#Rep2M0E <- lmer(cor ~ denomratio + HDI + (round | Country), data = Rep2DATAecon3, control=lmerControl(optimizer="bobyqa",
#                                                                                                  optCtrl=list(maxfun=2e5)))
#arm::display(Rep2M0C)
#arm::display(Rep2M0E)

Rep2M0C <- lmer(cor ~ scale(denomratio, center = TRUE) + scale(HDI, center = TRUE) +  (round | Country), data = Rep4cult, control=lmerControl(optimizer="bobyqa",
                                                                                                                                              optCtrl=list(maxfun=2e5)))
Rep2M0E <- lmer(cor ~ scale(denomratio, center = TRUE) + scale(HDI, center = TRUE) + (round | Country), data = Rep4econ, control=lmerControl(optimizer="bobyqa",
                                                                                                                                             optCtrl=list(maxfun=2e5)))

arm::display(Rep2M0C)
arm::display(Rep2M0E)




#####
#Mixed
#####

create_plot3 <- function(model, country_data, country_name) {
  country_filtered <- country_data %>%
    filter(Country == country_name) %>%
    dplyr::filter(domain == "Across Domains")
  
  pred <- predict(model, newdata = country_filtered, interval = "confidence")
  
  country_filtered <- country_filtered %>%
    mutate(
      fit = pred[, "fit"],
      lwr = pred[, "lwr"],
      upr = pred[, "upr"]
    )
  
  ggplot(country_filtered |> dplyr::filter(domain == "Across Domains"), aes(x = round, y = cor)) +
    geom_point(position = position_jitter(width = 0.2, height = 0), size = 2, alpha = 0.1) +
    geom_errorbar(aes(ymin = lwr, ymax = upr), width = 0.4, size = .9, color = "firebrick4") +
    labs(title = country_name,
         x = "",
         y = "") +  theme_minimal() + 
    theme(
      legend.position = "none",
      plot.title = element_text(size = 11, hjust = 0.5, face = "bold"),
      axis.text.x = element_text(size = 9),
      axis.text.y = element_text(size = 9)
    ) +
    scale_y_continuous(breaks = c(-0.3,-0.2,- 0.1, 0, 0.1, 0.2, 0.3), limits = c(-0.35, 0.35)) +
    scale_x_discrete(limits = levels(country_filtered$round))
}

models2 <- list(
  C_CZ = lm(cor ~ round, data = Countries_IsAlC|> dplyr::filter(domain == "Across Domains"), subset = (Country == "Czech Republic")),
  C_SK = lm(cor ~ round, data = Countries_IsAlC|> dplyr::filter(domain == "Across Domains"), subset = (Country == "Slovakia")),
  C_HU = lm(cor ~ round, data = Countries_IsAlC|> dplyr::filter(domain == "Across Domains"), subset = (Country == "Hungary")),
  C_PL = lm(cor ~ round, data = Countries_IsAlC|> dplyr::filter(domain == "Across Domains"), subset = (Country == "Poland")),
  C_FR = lm(cor ~ round, data = Countries_IsAlC|> dplyr::filter(domain == "Across Domains"), subset = (Country == "France")),
  C_GE = lm(cor ~ round, data = Countries_IsAlC|> dplyr::filter(domain == "Across Domains"), subset = (Country == "Germany")),
  C_IR = lm(cor ~ round, data = Countries_IsAlC|> dplyr::filter(domain == "Across Domains"), subset = (Country == "Ireland")),
  C_NL = lm(cor ~ round, data = Countries_IsAlC|> dplyr::filter(domain == "Across Domains"), subset = (Country == "Netherlands")),
  C_BE = lm(cor ~ round, data = Countries_IsAlC|> dplyr::filter(domain == "Across Domains"), subset = (Country == "Belgium")),
  C_AU = lm(cor ~ round, data = Countries_IsAlC|> dplyr::filter(domain == "Across Domains"), subset = (Country == "Austria")),
  C_FI = lm(cor ~ round, data = Countries_IsAlC|> dplyr::filter(domain == "Across Domains"), subset = (Country == "Finland")),
  C_SW = lm(cor ~ round, data = Countries_IsAlC|> dplyr::filter(domain == "Across Domains"), subset = (Country == "Sweden")),
  C_NO = lm(cor ~ round, data = Countries_IsAlC|> dplyr::filter(domain == "Across Domains"), subset = (Country == "Norway")),
  C_IC = lm(cor ~ round, data = Countries_IsAlC|> dplyr::filter(domain == "Across Domains"), subset = (Country == "Iceland")),
  C_DN = lm(cor ~ round, data = Countries_IsAlC|> dplyr::filter(domain == "Across Domains"), subset = (Country == "Denmark")),
  C_IT = lm(cor ~ round, data = Countries_IsAlC|> dplyr::filter(domain == "Across Domains"), subset = (Country == "Italy")),
  C_SP = lm(cor ~ round, data = Countries_IsAlC|> dplyr::filter(domain == "Across Domains"), subset = (Country == "Spain")),
  C_PT = lm(cor ~ round, data = Countries_IsAlC|> dplyr::filter(domain == "Across Domains"), subset = (Country == "Portugal")),
  C_MT = lm(cor ~ round, data = Countries_IsAlC|> dplyr::filter(domain == "Across Domains"), subset = (Country == "Malta"))
)

reordered_models <- models2[order(names(models2))]

plots3 <- lapply(seq_along(reordered_models), function(i) {
  create_plot3(reordered_models[[i]], Countries_IsAlC, country_names[i])
})



# Combine all plots using patchwork
combined_plot <- wrap_plots(plots3, nrow = 5, ncol = 4) +
  plot_layout(guides = "collect") &
  theme(
    plot.margin = margin(1, 1, 1, 1, "pt")  # Reduce margins to minimize space between plots
  )

svg("Figures/Mixed.svg", family = "cmr10", height = 12, width = 9)
combined_plot
dev.off()



C_PT <- lm(cor ~ round, data = Countries_IsAlC |> filter(domain == "Cultural"), subset = (Country == "Portugal"))
plot_model(C_PT, type = "pred", terms = "round")

C_PL = lm(cor ~ round, data = Countries_IsAlC|> dplyr::filter(domain == "Across Domains"), subset = (Country == "Poland"))
C_NO = lm(cor ~ round, data = Countries_IsAlC|> dplyr::filter(domain == "Across Domains"), subset = (Country == "Norway"))
C_IC = lm(cor ~ round, data = Countries_IsAlC|> dplyr::filter(domain == "Across Domains"), subset = (Country == "Iceland"))

