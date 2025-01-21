source("Issue Alignment - Data Transformation.R")
source("Issue Alignment - Main Analysis.R")
library(purrr)
library(Hmisc)

#####
#Appendix 2
#####

# Corrplots Prepare----------------------

Catholic_countries <- c(305, 211, 220, 310, 325, 338, 205, 235, 317, 230)

Protestant_countries <- c(375, 380, 385, 390, 395)

  
variables <- c("Income equality", "Private / State business", "Government responsibility", "Job taking of the unemployed", "Competition good or harmful",
                 "Firms and freedom", "Justifiable: Homosexuality", "Justifiable: Prostitution", "Justifiable: Abortion", 
                 "Justifiable: Divorce", "Justifiable: Euthanasia", "Justifiable: Suicide", "Justifiable: Taking soft drugs",
                 "Justifiable: Having casual sex", "Justifiable: Invitro fertilization")


ProtestantData <- EVS %>% filter(COW_NUM %in% Protestant_countries) %>% dplyr::select(E035:F144_01)
CatholicData <- EVS %>% filter(COW_NUM %in% Catholic_countries) %>% dplyr::select(E035:F144_01)  
  
# Figure 1----------------------

arm::corrplot(ProtestantData, variables, cex.var = 0.8, color = FALSE, digits = 2,
              cutpts = c(0, 0.05, 0.1, 0.15, 0.2, 0.25, 0.3, 0.35, 0.4, 0.45, 0.5, 0.55, 0.6, 0.65, 0.7, 0.75))


# Figure 2----------------------

arm::corrplot(CatholicData, variables, cex.var = 0.8, color = FALSE, digits = 2, 
                cutpts = c(0, 0.05, 0.1, 0.15, 0.2, 0.25, 0.3, 0.35, 0.4, 0.45, 0.5, 0.55, 0.6, 0.65, 0.7, 0.75))


#remove euthanasia and suicide
CDATAcult <- DATAcult3 |>
  filter(!str_detect(issue, "F122|F123"))


CDATAecon <-  DATAecon3 |>
  filter(!str_detect(issue, "F122|F123"))

CM0C <- lmer(cor ~ religdiscrete + HDI +  (round | Country), data = CDATAcult)
CM0E <- lmer(cor ~ religdiscrete + HDI + (round | Country), data = CDATAecon)

# Figure 3----------------------

svg("Figures/Deleted Corrplots.svg", width = 8, height = 6, family = "cmr10")
plot_models(MC, CM0C, ME, CM0E, rm.terms = c("NetMper1000", "GINI", "KOFGI"),
            m.labels = c("Culture Wars Original", "Culture Wars Only Consistent", "Economy Original", "Economy Only Consistent"),
            legend.title = "Models", colors = c("deepskyblue1", "deepskyblue4", "seagreen2", "seagreen4"), grid.breaks = c(-0.3, 0.3), axis.labels = c("Human Development[Highest]", "Human Development[Middle]", "Religious Culture[Catholic]", "Religious Culture [Mixed]")) +
  theme(text = element_text(size = 14))
dev.off()


#####
#Appendix 3
#####

# Rewriting Functions for Spearman Correlation----------------------


flattenCorrMatrix <- function(cormat, pmat) {
  ut <- upper.tri(cormat)
  data.frame(
    row = rownames(cormat)[row(cormat)[ut]],
    column = rownames(cormat)[col(cormat)[ut]],
    cor  =(cormat)[ut],
    p = pmat[ut]
  )
}



compute_correlation <- function(data, round, country_code, country_name, method = "spearman") {
  subset_data <- data %>%
    filter(S002EVS == round, COW_NUM == country_code) %>%
    dplyr::select(E035:F144_01)
  
  # Check if sufficient data exists
  if (nrow(subset_data) < 5) {
    return(data.frame(row = character(), column = character(), cor = numeric(), p = numeric(),
                      round = integer(), Country = character()))
  }
  
  # Compute correlation and flatten
  res <- rcorr(as.matrix(subset_data), type = method)
  flattenCorrMatrix(res$r, res$P) %>%
    mutate(round = round, Country = country_name)
}


# Define countries and rounds
countries <- data.frame(
  code = c(205, 210, 211, 220, 230, 235, 255, 290, 305, 310, 316, 317, 325, 338, 375, 380, 385, 390, 395),
  name = c("Ireland", "Netherlands", "Belgium", "France", "Spain", "Portugal", "Germany", "Poland", 
           "Austria", "Hungary", "Czech Republic", "Slovakia", "Italy", "Malta", "Finland", "Sweden", 
           "Norway", "Denmark", "Iceland")
)

rounds <- c(2, 3, 4, 5)

# Compute correlations for all combinations
correlation_results <- purrr::map_dfr(rounds, function(r) {
  purrr::map_dfr(seq_len(nrow(countries)), function(i) {
    compute_correlation(EVS, r, countries$code[i], countries$name[i])
  })
})

# Add domain information
RCountries_IsAlD <- correlation_results %>%
  mutate(domain = case_when(
    (row %in% Economic) & (column %in% Economic) ~ "Economic",
    (row %in% Cultural) & (column %in% Cultural) ~ "Cultural",
    TRUE ~ "Mixed"
  ))

# Create the final structure
RCountries_IsAlC <- RCountries_IsAlD %>%
  unite("issue", row:column, remove = FALSE, sep = "-") %>%
  dplyr::select("issue", "cor", "domain", "round", "Country") %>%
  mutate(round = factor(round, levels = c(2, 3, 4, 5), labels = c("1990", "1999", "2008", "2017")))

RDAT <- merge(RCountries_IsAlC, denom_data, by = "Country")
HDIData2 <- HDIData |> mutate(round = case_when(round == 2 ~ 1990,
                                                round == 3 ~ 1999,
                                                round == 4 ~ 2008,
                                                round == 5 ~ 2017))

RDATA <- merge(RDAT, HDIData2, by = c("Country", "round"))
RDATA %<>% filter(domain != "Across Domains")

RDATAcult <- RDATA %>% filter(domain == "Cultural")
RDATAcult %<>% mutate(round = case_when(round == 1990 ~ 1,
                                        round == 1999 ~ 2,
                                        round == 2008 ~ 3,
                                        round == 2017 ~ 4))
RDATAcult %<>% mutate(round = as.factor(round))


RDATAecon <- RDATA %>% filter(domain == "Economic")
RDATAecon %<>% mutate(round = case_when(round == 1990 ~ 1,
                                        round == 1999 ~ 2,
                                        round == 2008 ~ 3,
                                        round == 2017 ~ 4))
RDATAecon %<>% mutate(round = as.factor(round))

#trichotomization religious culture
RDATAcult2 <- RDATAcult %>% mutate(round = as.integer(round)) %>% mutate(religdiscrete = cut(DD, 3, labels = c("Protestant", "Mixed", "Catholic")))
RDATAecon2 <- RDATAecon %>% mutate(round = as.integer(round)) %>% mutate(religdiscrete = cut(DD, 3, labels = c("Protestant", "Mixed", "Catholic")))

#trichotomization HDI
round1 <- RDATAcult2 %>% subset(round == 1) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
round2 <- RDATAcult2 %>% subset(round == 2) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
round3 <- RDATAcult2 %>% subset(round == 3) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
round4 <- RDATAcult2 %>% subset(round == 4) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
RDATAcult3 <- bind_rows(round1, round2, round3, round4)

round1 <- RDATAecon2 %>% subset(round == 1) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
round2 <- RDATAecon2 %>% subset(round == 2) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
round3 <- RDATAecon2 %>% subset(round == 3) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
round4 <- RDATAecon2 %>% subset(round == 4) %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
RDATAecon3 <- bind_rows(round1, round2, round3, round4)
rm(round1, round2, round3, round4)


RM0C <- lmer(cor ~ religdiscrete + HDI +  (round | Country), data = RDATAcult3)
RM0E <- lmer(cor ~ religdiscrete + HDI + (round | Country), data = RDATAecon3)

# Figure 4----------------------

svg("Figures/Spearman.svg", width = 8, height = 6, family = "cmr10")
plot_models(MC, RM0C, ME, RM0E, rm.terms = c("NetMper1000", "GINI", "KOFGI"),
            m.labels = c("Culture Wars Original", "Culture Wars Spearman", "Economy Original", "Economy Spearman"),
            legend.title = "Models", colors = c("deepskyblue1", "deepskyblue4", "seagreen2", "seagreen4"), grid.breaks = c(-0.3, 0.3), axis.labels = c("Human Development[Highest]", "Human Development[Middle]", "Religious Culture[Catholic]", "Religious Culture [Mixed]")) +
  theme(text = element_text(size = 14))
dev.off()


#####
#Appendix 4
#####

#remove firms & freedom, justifiable: casual sex and IVF

DDATAcult <- DATAcult3 |>
  filter(!str_detect(issue, "E042|F132|F144_1"))


DDATAecon <-  DATAecon3 |>
  filter(!str_detect(issue, "E042|F132|F144_1"))

DM0C <- lmer(cor ~ religdiscrete + HDI +  (round | Country), data = DDATAcult)
DM0E <- lmer(cor ~ religdiscrete + HDI + (round | Country), data = DDATAecon)

# Figure 5----------------------

svg("Figures/Deleted.svg", width = 8, height = 6, family = "cmr10")
plot_models(MC, DM0C, ME, DM0E, rm.terms = c("NetMper1000", "GINI", "KOFGI"),
            m.labels = c("Culture Wars Original", "Culture Wars Deleted", "Economy Original", "Economy Deleted"),
            legend.title = "Models", colors = c("deepskyblue1", "deepskyblue4", "seagreen2", "seagreen4"), grid.breaks = c(-0.3, 0.3), axis.labels = c("Human Development[Highest]", "Human Development[Middle]", "Religious Culture[Catholic]", "Religious Culture [Mixed]")) +
  theme(text = element_text(size = 14))
dev.off()


#####
#Appendix 5
#####


# Table 1: Model Estimates with GDP per capita----------------------

GDP <- read.csv("data/API_NY.GDP.PCAP.CD_DS2_en_csv_v2_5839616.csv", sep = ";")
DAT2 <- DAT |> mutate(round = case_when(round == 2 ~ 1990,
                                        round == 3 ~ 1999,
                                        round == 4 ~ 2008,
                                        round == 5 ~ 2017,))
DATArep <- merge(DAT2, GDP, by = c("Country", "round"))
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

# Display Table 1----------------------

arm::display(RepM0C)
arm::display(RepM0E)

# Table 2: Model Estimates with Denomination Differences among Respondents----------------------
countries <- c(205, 210, 211, 220, 230, 235, 255, 290, 305, 310, 316, 317, 325, 338, 375, 380, 385, 390, 395)

EVS2 <- EVS |> filter(COW_NUM %in% Countries)
EVS2 %<>% mutate(catholic = case_when(F025 == 1 ~ 1,
                                      TRUE ~ 0),
                 protestant = case_when(F025 == 2 ~ 1,
                                        TRUE ~ 0))

denominations <- EVS2 %>% group_by(COW_NUM, S002EVS) %>% dplyr::summarize(denomratio = sum(catholic)/n() - sum(protestant)/n())
denominations <- denominations |> ungroup()
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

denominations %<>% mutate(round = case_when(round == 1 ~ 2,
                                            round == 2 ~ 3,
                                            round == 3 ~ 4,
                                            round == 4 ~ 5)) %>% select(Country, round, denomratio)

DATArep4 <- merge(DATA, denominations, by = c("Country", "round"), all.x = TRUE)

Rep4cult <- DATArep4 %>% filter(domain == "Cultural")
Rep4cult %<>% mutate(round = case_when(round == 2 ~ 1,
                                       round == 3 ~ 2,
                                       round == 4 ~ 3,
                                       round == 5 ~ 4))
Rep4cult %<>% mutate(round = as.integer(round))


Rep4econ <- DATArep4 %>% filter(domain == "Economic")
Rep4econ %<>% mutate(round = case_when(round == 2 ~ 1,
                                       round == 3 ~ 2,
                                       round == 4 ~ 3,
                                       round == 5 ~ 4))

Rep4econ %<>% mutate(round = as.integer(round))


Rep2M0C <- lmer(cor ~ scale(denomratio, center = TRUE) + scale(HDI, center = TRUE) +  (round | Country), data = Rep4cult, control=lmerControl(optimizer="bobyqa",
                                                                                                                                              optCtrl=list(maxfun=2e5)))


Rep2M0E <- lmer(cor ~ scale(denomratio, center = TRUE) + scale(HDI, center = TRUE) + (round | Country), data = Rep4econ, control=lmerControl(optimizer="bobyqa",
                                                                                                                                             optCtrl=list(maxfun=2e5)))

# Display Table 2----------------------


arm::display(Rep2M0C)
arm::display(Rep2M0E)




#####
#Appendix 6
#####

# Create Figure 6----------------------


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

# Save Figure 6----------------------


svg("Figures/Mixed.svg", family = "cmr10", height = 12, width = 9)
combined_plot
dev.off()


#####
#Appendix 7
#####

# Prepare subsets of the data----------------------
#Here instead of looping through, all the lines are spelled out


#reverse code so higher values reflect more liberal attitudes
EVSWith <- EVS_Trendfile %>% mutate(E035 = -1*E035 + 11)

#reducing the dataset to studied variables
EVSWith %<>% dplyr::select("E035", "E036", "E037", "E038", "E039", "E042", "F118", "F119", "F120",
                           "F121", "F122", "F123", "F126", "F132", "F144_01", "F028", "S002EVS", "F034", "COW_NUM")

EVSWithout <- EVSWith %>% subset(F034 == 2 | F034 == 3)

# Four Countries: Pooled data----------------------

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

# Four Countries: Without Religious----------------------


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

# Four Countries: Merging datasets----------------------

With_out <- bind_rows(With_IsAlC, Without_IsAlC)
rm(With_IsAlC, Without_IsAlC)
With_out <- With_out %>% mutate(round = as.character(round))
With_out$round <- ordered(With_out$round,
                          levels = c("2","3","4","5"),
                          labels = c("1990", "1999", "2008", "2017"))
With_out = With_out |> mutate(with = as.character(with))
With_out = With_out |> filter(domain == "Cultural")

# Creating Figure 7----------------------


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

# Saving Figure 7----------------------

svg("Figures/WithoutRelig.svg", family = "cmr10", height = 5, width = 6)
combined_plot
dev.off()



#####
#Appendix 8
#####
#import dataset
EVS_Trendfile <- read_dta("data/ZA7503_v2-0-0.dta")

#set negative values (missing in EVS) to NA
EVS_Trendfile[EVS_Trendfile < 0] <- NA
#reverse code so higher values reflect more liberal attitudes
EVSAge <- EVS_Trendfile %>% mutate(E035 = -1*E035 + 11)


#reducing the dataset to studied variables
EVSAge %<>% dplyr::select("E035", "E036", "E037", "E038", "E039", "E042", "F118", "F119", "F120",
                            "F121", "F122", "F123", "F126", "F132", "F144_01", "F028", "S002EVS", "X003R", "COW_NUM")

#Splitting the sample by age groups-----------------
Age_EVSB1 <- EVSAge %>% subset(X003R == 1)
Age_EVSB2 <- EVSAge %>% subset(X003R == 2)
Age_EVSB3 <- EVSAge %>% subset(X003R == 3)
Age_EVSB4 <- EVSAge %>% subset(X003R == 4)
Age_EVSB5 <- EVSAge %>% subset(X003R == 5)
Age_EVSB6 <- EVSAge %>% subset(X003R == 6)


# Define function to compute correlations and flatten the results
process_cohort <- function(dataset, rounds, countries, cultural_vars, economic_vars) {
  # Compute correlations for each round and country
  results <- expand.grid(round = rounds, country = countries) %>%
    mutate(
      corr_result = map2(round, country, ~{
        data_subset <- dataset %>%
          filter(S002EVS == .x, COW_NUM == .y) %>%
          dplyr::select(E035:F144_01)
        if (nrow(data_subset) > 4) {
          tryCatch(rcorr(as.matrix(data_subset)), error = function(e) NULL)
        } else {
          NULL
        }
      })
    ) %>%
    filter(!map_lgl(corr_result, is.null))  # Remove failed computations
  
  # Flatten the results and annotate
  flat_results <- pmap_dfr(
    list(results$corr_result, results$round, results$country),
    ~ {
      flattenCorrMatrix(..1$r, ..1$P) %>%
        mutate(
          round = ..2,
          Country = case_when(
            ..3 == 205 ~ "Ireland", ..3 == 210 ~ "Netherlands", ..3 == 211 ~ "Belgium",
            ..3 == 220 ~ "France", ..3 == 230 ~ "Spain", ..3 == 235 ~ "Portugal",
            ..3 == 255 ~ "Germany", ..3 == 290 ~ "Poland", ..3 == 305 ~ "Austria",
            ..3 == 310 ~ "Hungary", ..3 == 316 ~ "Czech Republic", ..3 == 317 ~ "Slovakia",
            ..3 == 325 ~ "Italy", ..3 == 338 ~ "Malta", ..3 == 375 ~ "Finland",
            ..3 == 380 ~ "Sweden", ..3 == 385 ~ "Norway", ..3 == 390 ~ "Denmark",
            ..3 == 395 ~ "Iceland"
          )
        )
    }
  )
  
  
  # Add domain information and clean up
  flat_results %>%
    mutate(domain = case_when(
      (row %in% cultural_vars) & (column %in% cultural_vars) ~ "Cultural",
      (row %in% economic_vars) & (column %in% economic_vars) ~ "Economic",
      TRUE ~ "Across Domains"
    )) %>%
    unite("issue", row:column, remove = FALSE, sep = "-") %>%
    dplyr::select("issue", "cor", "domain", "round", "Country")

  
  
}


# Define rounds, countries, and variable sets
rounds <- 2:5
countries <- c(205, 210, 211, 220, 230, 235, 255, 290, 305, 310, 316, 317, 325, 338, 375, 380, 385, 390, 395)
cultural_vars <- c("F118", "F119", "F120", "F121", "F122", "F123", "F126", "F132", "F144_01")
economic_vars <- c("E035", "E036", "E037", "E038", "E039", "E042")
age_labels <- c("15-24", "25-34", "35-44", "45-54", "55-64", "65+")

# Process cohorts using the function
age_results <- map2_dfr(
  list(Age_EVSB1, Age_EVSB2, Age_EVSB3, Age_EVSB4, Age_EVSB5, Age_EVSB6), 
  age_labels, 
  ~ suppressWarnings(
    process_cohort(.x, rounds, countries, cultural_vars, economic_vars) %>%
      mutate(Age = .y)
  )
)

age_results <- merge(age_results, HDIData, by = c("Country", "round"))
age_results <- merge(age_results, denom_data, by = c("Country"))

age_results <- purrr::map_dfr(rounds, function(r) {
  age_results %>%
    filter(round == r) %>%
    mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
})

age_results <- age_results %>% mutate(round = as.character(round))
age_results$round <- ordered(age_results$round,
                                 levels = c(2,3,4,5),
                                 labels = c("1990", "1999", "2008", "2017"))

age_results$Age <- ordered(age_results$Age,
                                  levels = c("15-24", "25-34", "35-44", "45-54", "55-64", "65+"),
                                  labels = c("15-24", "25-34", "35-44", "45-54", "55-64", "65+"))

CohBCult = age_results |> filter(domain == "Cultural")

T1 <- lmer(cor ~ Age + round + Age*round*HDI + (1|Country), data = CohBCult)

new_data <- expand.grid(
  Age = unique(CohBCult$Age),
  round = unique(CohBCult$round),
  HDI = unique(CohBCult$HDI),
  Country = unique(CohBCult$Country)
)

pred <- predict(T1, newdata = new_data, re.form = NA, se.fit = TRUE)
new_data$predicted <- pred$fit
new_data$se.fit <- pred$se.fit
new_data <- new_data %>%
  mutate(
    lower = predicted - 1.96 * se.fit,
    upper = predicted + 1.96 * se.fit
  )
new_data = new_data |> mutate(HDI = case_when(HDI == "highest" ~ "Most Developed",
                                              HDI == "lowest" ~ "Least Developed",
                                              HDI == "middle" ~ "middle"))

svg("Figures/IP Cohorts.svg", height = 4, width = 8, family = "cmr10")
ggplot(new_data |> filter(round == "2017" | round == "1990") |> filter(!HDI == "middle"), aes(x = Age, y = predicted, color = round)) +
  geom_point(size = 2) +
  geom_line(aes(y = predicted, group = round), size = .9) +
  geom_ribbon(aes(ymin = lower, ymax = upper, group = round, fill = round), alpha = 0.2) +
  facet_wrap(~HDI) +
  labs(title = "",
       x = "Age Cohort",
       y = "",
       color = "Round") +
  scale_color_manual(values = c("2017" = "navy", "1990" = "firebrick4")) +
  scale_fill_manual(values = c("2017" = "navy", "1990" = "firebrick4")) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 14, face = "bold", hjust = 0.5),
    axis.title.x = element_text(size = 12),
    axis.title.y = element_text(size = 12),
    axis.text.x = element_text(size = 10),
    axis.text.y = element_text(size = 10),
    strip.text = element_text(size = 10),
    legend.position = "none",
    legend.title = element_text(size = 10),
    legend.text = element_text(size = 9)
  )
dev.off()


CohBCult <- CohBCult |>
  mutate(religdiscrete = cut(DD, 3, labels = c("Protestant", "Mixed", "Catholic")))

T2 <- lmer(cor ~ Age + round + Age*round*religdiscrete + (1|Country), data = CohBCult)

new_data <- expand.grid(
  Age = unique(CohBCult$Age),
  round = unique(CohBCult$round),
  religdiscrete = unique(CohBCult$religdiscrete),
  Country = unique(CohBCult$Country)
)

pred <- predict(T2, newdata = new_data, re.form = NA, se.fit = TRUE)
new_data$predicted <- pred$fit
new_data$se.fit <- pred$se.fit
new_data <- new_data %>%
  mutate(
    lower = predicted - 1.96 * se.fit,
    upper = predicted + 1.96 * se.fit
  )

svg("Figures/IP Cohorts2.svg", height = 4, width = 8, family = "cmr10")
ggplot(new_data |> filter(round == "2017" | round == "1990") |> filter(!religdiscrete == "Mixed"), aes(x = Age, y = predicted, color = round)) +
  geom_point(size = 2) +
  geom_line(aes(y = predicted, group = round), size = .9) +
  geom_ribbon(aes(ymin = lower, ymax = upper, group = round, fill = round), alpha = 0.2) +
  facet_wrap(~religdiscrete) +
  labs(title = "",
       x = "Age Cohort",
       y = "",
       color = "Round") +
  scale_color_manual(values = c("2017" = "navy", "1990" = "firebrick4")) +
  scale_fill_manual(values = c("2017" = "navy", "1990" = "firebrick4")) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 14, face = "bold", hjust = 0.5),
    axis.title.x = element_text(size = 12),
    axis.title.y = element_text(size = 12),
    axis.text.x = element_text(size = 10),
    axis.text.y = element_text(size = 10),
    strip.text = element_text(size = 10),
    legend.position = "none",
    legend.title = element_text(size = 10),
    legend.text = element_text(size = 9)
  )
dev.off()
