##########
#LIBRARIES
##########
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

##########
#ESV Modifications
##########

#import dataset
EVS_Trendfile <- read_dta("ZA7503_v2-0-0.dta")

#set negative values (missing in EVS) to NA
EVS_Trendfile[EVS_Trendfile < 0] <- NA

##########
#Transforming Variables
##########

#reverse code so higher values reflect more liberal attitudes
EVS <- EVS_Trendfile %>% mutate(E035 = -1*E035 + 11)


#Political Interest from 4 to 2 categories
EVS <- EVS %>% mutate(Interest = E023)
EVS <- EVS %>% mutate(E023 = case_when(E023 == 1 | E023 == 2 ~ 1,
                                       E023 == 3 | E023 == 4 ~ 2))

#Education into 3 categories
EVS <- EVS %>% mutate(X025 = case_when(X025 == 2 ~ "Elementary compulsory education",
                                       X025 == 4 | X025 == 6 ~ "Secondary school education",
                                       X025 == 8 ~ "University degree"))

#filters for countries - COW_NUM variable
Central <- c("290", "310", "316", "317")
Western <- c("205", "210", "211", "220", "230", "235", "255", "305", "325", "338")
Nordic <- c("375", "380", "385", "390", "395")

#reducing the dataset to studied variables
EVS <- EVS %>% dplyr::select("E035", "E036", "E037", "E038", "E039", "E042", "F118", "F119", "F120",
                             "F121", "F122", "F123", "F126", "F132", "F144_01", "F028", "S002EVS",
                             "X047R_EVS", "E023", "Y002", "E033", "COW_NUM", "F025", "Y002")

#defining variable for eastern (postcommunist) Europe and western Europe
EVS <- EVS %>% mutate(AREA = case_when(EVS$COW_NUM %in% Central ~ 0,
                                       EVS$COW_NUM %in% Western ~ 1 ,
                                       EVS$COW_NUM %in% Nordic ~ 2))

#defining issue domains
Economic <- c("E035", "E036", "E037", "E038", "E039", "E042")
Cultural <- c("F118", "F119", "F120", "F121", "F122", "F123", "F126", "F132", "F144_01")

#function to flatten correlation matrix
flattenCorrMatrix <- function(cormat, pmat) {
  ut <- upper.tri(cormat)
  data.frame(
    row = rownames(cormat)[row(cormat)[ut]],
    column = rownames(cormat)[col(cormat)[ut]],
    cor  =(cormat)[ut],
    p = pmat[ut]
  )
}

##############
#Countries
##############
#Creating dataset
#Round 2
res2_205 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 2) %>% filter(COW_NUM == 205) %>% dplyr::select(E035:F144_01)))
res2_210 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 2) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res2_211 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 2) %>% filter(COW_NUM == 211) %>% dplyr::select(E035:F144_01)))
res2_220 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 2) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res2_230 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 2) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res2_235 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 2) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res2_255 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 2) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res2_290 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 2) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res2_305 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 2) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res2_310 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 2) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res2_316 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 2) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res2_317 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 2) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res2_325 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 2) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res2_338 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 2) %>% filter(COW_NUM == 338) %>% dplyr::select(E035:F144_01)))
res2_375 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 2) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res2_380 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 2) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res2_385 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 2) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))
res2_390 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 2) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res2_395 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 2) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))

#Round 3
res3_205 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 3) %>% filter(COW_NUM == 205) %>% dplyr::select(E035:F144_01)))
res3_210 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 3) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res3_211 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 3) %>% filter(COW_NUM == 211) %>% dplyr::select(E035:F144_01)))
res3_220 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 3) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res3_230 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 3) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res3_235 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 3) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res3_255 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 3) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res3_290 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 3) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res3_305 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 3) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res3_310 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 3) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res3_316 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 3) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res3_317 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 3) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res3_325 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 3) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res3_338 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 3) %>% filter(COW_NUM == 338) %>% dplyr::select(E035:F144_01)))
res3_375 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 3) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res3_380 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 3) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res3_390 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 3) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res3_395 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 3) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))

#Round 4
res4_205 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 4) %>% filter(COW_NUM == 205) %>% dplyr::select(E035:F144_01)))
res4_210 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 4) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res4_211 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 4) %>% filter(COW_NUM == 211) %>% dplyr::select(E035:F144_01)))
res4_220 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 4) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res4_230 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 4) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res4_235 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 4) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res4_255 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 4) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res4_290 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 4) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res4_305 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 4) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res4_310 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 4) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res4_316 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 4) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res4_317 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 4) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res4_325 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 4) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res4_338 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 4) %>% filter(COW_NUM == 338) %>% dplyr::select(E035:F144_01)))
res4_375 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 4) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res4_380 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 4) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res4_390 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 4) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res4_395 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 4) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))
res4_385 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 4) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))

#Round 5
res5_210 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 5) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res5_220 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 5) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res5_230 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 5) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res5_235 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 5) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res5_255 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 5) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res5_290 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 5) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res5_305 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 5) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res5_310 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 5) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res5_316 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 5) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res5_317 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 5) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res5_325 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 5) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res5_375 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 5) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res5_380 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 5) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res5_390 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 5) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res5_395 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 5) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))
res5_385 <- rcorr(as.matrix(EVS %>% filter(S002EVS == 5) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))



#dataframes - round 2
df2_205 <- flattenCorrMatrix(res2_205$r, res2_205$P) %>% mutate(round = 2) %>% mutate(Country = "Ireland")
df2_210 <- flattenCorrMatrix(res2_210$r, res2_210$P) %>% mutate(round = 2) %>% mutate(Country = "Netherlands")
df2_211 <- flattenCorrMatrix(res2_211$r, res2_211$P) %>% mutate(round = 2) %>% mutate(Country = "Belgium")
df2_220 <- flattenCorrMatrix(res2_220$r, res2_220$P) %>% mutate(round = 2) %>% mutate(Country = "France")
df2_230 <- flattenCorrMatrix(res2_230$r, res2_230$P) %>% mutate(round = 2) %>% mutate(Country = "Spain")
df2_235 <- flattenCorrMatrix(res2_235$r, res2_235$P) %>% mutate(round = 2) %>% mutate(Country = "Portugal")
df2_255 <- flattenCorrMatrix(res2_255$r, res2_255$P) %>% mutate(round = 2) %>% mutate(Country = "Germany")
df2_290 <- flattenCorrMatrix(res2_290$r, res2_290$P) %>% mutate(round = 2) %>% mutate(Country = "Poland")
df2_305 <- flattenCorrMatrix(res2_305$r, res2_305$P) %>% mutate(round = 2) %>% mutate(Country = "Austria")
df2_310 <- flattenCorrMatrix(res2_310$r, res2_310$P) %>% mutate(round = 2) %>% mutate(Country = "Hungary")
df2_316 <- flattenCorrMatrix(res2_316$r, res2_316$P) %>% mutate(round = 2) %>% mutate(Country = "Czech Republic")
df2_317 <- flattenCorrMatrix(res2_317$r, res2_317$P) %>% mutate(round = 2) %>% mutate(Country = "Slovakia")
df2_325 <- flattenCorrMatrix(res2_325$r, res2_325$P) %>% mutate(round = 2) %>% mutate(Country = "Italy")
df2_338 <- flattenCorrMatrix(res2_338$r, res2_338$P) %>% mutate(round = 2) %>% mutate(Country = "Malta")
df2_375 <- flattenCorrMatrix(res2_375$r, res2_375$P) %>% mutate(round = 2) %>% mutate(Country = "Finland")
df2_380 <- flattenCorrMatrix(res2_380$r, res2_380$P) %>% mutate(round = 2) %>% mutate(Country = "Sweden")
df2_385 <- flattenCorrMatrix(res2_385$r, res2_385$P) %>% mutate(round = 2) %>% mutate(Country = "Norway")
df2_390 <- flattenCorrMatrix(res2_390$r, res2_390$P) %>% mutate(round = 2) %>% mutate(Country = "Denmark")
df2_395 <- flattenCorrMatrix(res2_395$r, res2_395$P) %>% mutate(round = 2) %>% mutate(Country = "Iceland")

#dataframes - round 3
df3_205 <- flattenCorrMatrix(res3_205$r, res3_205$P) %>% mutate(round = 3) %>% mutate(Country = "Ireland")
df3_210 <- flattenCorrMatrix(res3_210$r, res3_210$P) %>% mutate(round = 3) %>% mutate(Country = "Netherlands")
df3_211 <- flattenCorrMatrix(res3_211$r, res3_211$P) %>% mutate(round = 3) %>% mutate(Country = "Belgium")
df3_220 <- flattenCorrMatrix(res3_220$r, res3_220$P) %>% mutate(round = 3) %>% mutate(Country = "France")
df3_230 <- flattenCorrMatrix(res3_230$r, res3_230$P) %>% mutate(round = 3) %>% mutate(Country = "Spain")
df3_235 <- flattenCorrMatrix(res3_235$r, res3_235$P) %>% mutate(round = 3) %>% mutate(Country = "Portugal")
df3_255 <- flattenCorrMatrix(res3_255$r, res3_255$P) %>% mutate(round = 3) %>% mutate(Country = "Germany")
df3_290 <- flattenCorrMatrix(res3_290$r, res3_290$P) %>% mutate(round = 3) %>% mutate(Country = "Poland")
df3_305 <- flattenCorrMatrix(res3_305$r, res3_305$P) %>% mutate(round = 3) %>% mutate(Country = "Austria")
df3_310 <- flattenCorrMatrix(res3_310$r, res3_310$P) %>% mutate(round = 3) %>% mutate(Country = "Hungary")
df3_316 <- flattenCorrMatrix(res3_316$r, res3_316$P) %>% mutate(round = 3) %>% mutate(Country = "Czech Republic")
df3_317 <- flattenCorrMatrix(res3_317$r, res3_317$P) %>% mutate(round = 3) %>% mutate(Country = "Slovakia")
df3_325 <- flattenCorrMatrix(res3_325$r, res3_325$P) %>% mutate(round = 3) %>% mutate(Country = "Italy")
df3_338 <- flattenCorrMatrix(res3_338$r, res3_338$P) %>% mutate(round = 3) %>% mutate(Country = "Malta")
df3_375 <- flattenCorrMatrix(res3_375$r, res3_375$P) %>% mutate(round = 3) %>% mutate(Country = "Finland")
df3_380 <- flattenCorrMatrix(res3_380$r, res3_380$P) %>% mutate(round = 3) %>% mutate(Country = "Sweden")
df3_390 <- flattenCorrMatrix(res3_390$r, res3_390$P) %>% mutate(round = 3) %>% mutate(Country = "Denmark")
df3_395 <- flattenCorrMatrix(res3_395$r, res3_395$P) %>% mutate(round = 3) %>% mutate(Country = "Iceland")

#Norway missing

#dataframes - round 4
df4_205 <- flattenCorrMatrix(res4_205$r, res4_205$P) %>% mutate(round = 4) %>% mutate(Country = "Ireland")
df4_210 <- flattenCorrMatrix(res4_210$r, res4_210$P) %>% mutate(round = 4) %>% mutate(Country = "Netherlands")
df4_211 <- flattenCorrMatrix(res4_211$r, res4_211$P) %>% mutate(round = 4) %>% mutate(Country = "Belgium")
df4_220 <- flattenCorrMatrix(res4_220$r, res4_220$P) %>% mutate(round = 4) %>% mutate(Country = "France")
df4_230 <- flattenCorrMatrix(res4_230$r, res4_230$P) %>% mutate(round = 4) %>% mutate(Country = "Spain")
df4_235 <- flattenCorrMatrix(res4_235$r, res4_235$P) %>% mutate(round = 4) %>% mutate(Country = "Portugal")
df4_255 <- flattenCorrMatrix(res4_255$r, res4_255$P) %>% mutate(round = 4) %>% mutate(Country = "Germany")
df4_290 <- flattenCorrMatrix(res4_290$r, res4_290$P) %>% mutate(round = 4) %>% mutate(Country = "Poland")
df4_305 <- flattenCorrMatrix(res4_305$r, res4_305$P) %>% mutate(round = 4) %>% mutate(Country = "Austria")
df4_310 <- flattenCorrMatrix(res4_310$r, res4_310$P) %>% mutate(round = 4) %>% mutate(Country = "Hungary")
df4_316 <- flattenCorrMatrix(res4_316$r, res4_316$P) %>% mutate(round = 4) %>% mutate(Country = "Czech Republic")
df4_317 <- flattenCorrMatrix(res4_317$r, res4_317$P) %>% mutate(round = 4) %>% mutate(Country = "Slovakia")
df4_325 <- flattenCorrMatrix(res4_325$r, res4_325$P) %>% mutate(round = 4) %>% mutate(Country = "Italy")
df4_338 <- flattenCorrMatrix(res4_338$r, res4_338$P) %>% mutate(round = 4) %>% mutate(Country = "Malta")
df4_375 <- flattenCorrMatrix(res4_375$r, res4_375$P) %>% mutate(round = 4) %>% mutate(Country = "Finland")
df4_380 <- flattenCorrMatrix(res4_380$r, res4_380$P) %>% mutate(round = 4) %>% mutate(Country = "Sweden")
df4_390 <- flattenCorrMatrix(res4_390$r, res4_390$P) %>% mutate(round = 4) %>% mutate(Country = "Denmark")
df4_395 <- flattenCorrMatrix(res4_395$r, res4_395$P) %>% mutate(round = 4) %>% mutate(Country = "Iceland")
df4_385 <- flattenCorrMatrix(res4_385$r, res4_385$P) %>% mutate(round = 4) %>% mutate(Country = "Norway")

#dataframes - round 5
df5_210 <- flattenCorrMatrix(res5_210$r, res5_210$P) %>% mutate(round = 5) %>% mutate(Country = "Netherlands")
df5_220 <- flattenCorrMatrix(res5_220$r, res5_220$P) %>% mutate(round = 5) %>% mutate(Country = "France")
df5_230 <- flattenCorrMatrix(res5_230$r, res5_230$P) %>% mutate(round = 5) %>% mutate(Country = "Spain")
df5_235 <- flattenCorrMatrix(res5_235$r, res5_235$P) %>% mutate(round = 5) %>% mutate(Country = "Portugal")
df5_255 <- flattenCorrMatrix(res5_255$r, res5_255$P) %>% mutate(round = 5) %>% mutate(Country = "Germany")
df5_290 <- flattenCorrMatrix(res5_290$r, res5_290$P) %>% mutate(round = 5) %>% mutate(Country = "Poland")
df5_305 <- flattenCorrMatrix(res5_305$r, res5_305$P) %>% mutate(round = 5) %>% mutate(Country = "Austria")
df5_310 <- flattenCorrMatrix(res5_310$r, res5_310$P) %>% mutate(round = 5) %>% mutate(Country = "Hungary")
df5_316 <- flattenCorrMatrix(res5_316$r, res5_316$P) %>% mutate(round = 5) %>% mutate(Country = "Czech Republic")
df5_317 <- flattenCorrMatrix(res5_317$r, res5_317$P) %>% mutate(round = 5) %>% mutate(Country = "Slovakia")
df5_325 <- flattenCorrMatrix(res5_325$r, res5_325$P) %>% mutate(round = 5) %>% mutate(Country = "Italy")
df5_375 <- flattenCorrMatrix(res5_375$r, res5_375$P) %>% mutate(round = 5) %>% mutate(Country = "Finland")
df5_380 <- flattenCorrMatrix(res5_380$r, res5_380$P) %>% mutate(round = 5) %>% mutate(Country = "Sweden")
df5_390 <- flattenCorrMatrix(res5_390$r, res5_390$P) %>% mutate(round = 5) %>% mutate(Country = "Denmark")
df5_395 <- flattenCorrMatrix(res5_395$r, res5_395$P) %>% mutate(round = 5) %>% mutate(Country = "Iceland")
df5_385 <- flattenCorrMatrix(res5_385$r, res5_385$P) %>% mutate(round = 5) %>% mutate(Country = "Norway")

#3 countries missing, but none missing in the analysis... how? It is Ireland, Malta, Belgium

#Baltic countries? Romania, Bulgaria?

#combine datasets
Countries_IsAl <- bind_rows(df2_205, df2_210, df2_211, df2_220, df2_230, df2_235, df2_255, df2_290,
                            df2_305, df2_310, df2_316, df2_317, df2_325, df2_338, df2_375, df2_380,
                            df2_390, df2_395, df2_385, df3_205, df3_210, df3_211, df3_220, df3_230,
                            df3_235, df3_255, df3_290, df3_305, df3_310, df3_316, df3_317, df3_325,
                            df3_338, df3_375, df3_380, df3_390, df3_395, df4_205, df4_210, df4_211,
                            df4_220, df4_230, df4_235, df4_255, df4_290, df4_305, df4_310, df4_316,
                            df4_317, df4_325, df4_338, df4_375, df4_380, df4_390, df4_395, df4_385,
                            df5_210, df5_220, df5_230, df5_235, df5_255, df5_290, df5_305, df5_310, df5_316,
                            df5_317, df5_325, df5_375, df5_380, df5_390, df5_395, df5_385, .id = NULL)

rm(df2_205, df2_210, df2_211, df2_220, df2_230, df2_235, df2_255, df2_290,
   df2_305, df2_310, df2_316, df2_317, df2_325, df2_338, df2_375, df2_380,
   df2_390, df2_395, df2_385, df3_205, df3_210, df3_211, df3_220, df3_230,
   df3_235, df3_255, df3_290, df3_305, df3_310, df3_316, df3_317, df3_325,
   df3_338, df3_375, df3_380, df3_390, df3_395, df4_205, df4_210, df4_211,
   df4_220, df4_230, df4_235, df4_255, df4_290, df4_305, df4_310, df4_316,
   df4_317, df4_325, df4_338, df4_375, df4_380, df4_390, df4_395, df4_385,
   df5_210, df5_220, df5_230, df5_235, df5_255, df5_290, df5_305, df5_310, df5_316,
   df5_317, df5_325, df5_375, df5_380, df5_390, df5_395, df5_385)

rm(res2_205, res2_210, res2_211, res2_220, res2_230, res2_235, res2_255, res2_290,
   res2_305, res2_310, res2_316, res2_317, res2_325, res2_338, res2_375, res2_380,
   res2_390, res2_395, res2_385, res3_205, res3_210, res3_211, res3_220, res3_230,
   res3_235, res3_255, res3_290, res3_305, res3_310, res3_316, res3_317, res3_325,
   res3_338, res3_375, res3_380, res3_390, res3_395, res4_205, res4_210, res4_211,
   res4_220, res4_230, res4_235, res4_255, res4_290, res4_305, res4_310, res4_316,
   res4_317, res4_325, res4_338, res4_375, res4_380, res4_390, res4_395, res4_385,
   res5_210, res5_220, res5_230, res5_235, res5_255, res5_290, res5_305, res5_310, res5_316,
   res5_317, res5_325, res5_375, res5_380, res5_390, res5_395, res5_385)

Countries_IsAlD <- Countries_IsAl %>% mutate(domain = case_when((row %in% Cultural) & (column %in% Cultural) ~ "Cultural",
                                                                (row %in% Economic) & (column %in% Economic) ~ "Economic",
                                                                TRUE ~ "Across Domains"))

Countries_IsAlC <- Countries_IsAlD %>% unite("issue", row:column, remove = FALSE, sep = "-") %>% dplyr::select("issue", "cor", "domain", "round", "Country")

#####
#Predictors distribution
#####

DATA2D <- DATA %>% group_by(Country) %>% dplyr::summarize(DD = mean(DD), HDI = mean(HDI))

hist_top <- ggplot(DATA, aes(HDI)) + geom_histogram(fill = "gray70", colour = "gray60", alpha = 0.25,
                                                    binwidth = 0.02)  + xlim(0.66, 1) + scale_y_continuous(breaks = NULL) +
  labs(x = "", y = "")
#hist_top

empty <- ggplot()+geom_point(aes(1,1), colour="white")+
  theme(axis.ticks=element_blank(),
        panel.background=element_blank(),
        axis.text.x=element_blank(), axis.text.y=element_blank(),
        axis.title.x=element_blank(), axis.title.y=element_blank())

scatter <- ggplot(DATA2D, aes(HDI, DD)) + geom_point(alpha = 0.5) +
  ylab("Religious Culture") + xlab("Human Development Index") + ggrepel::geom_text_repel(aes(label = Country), size = 5) +
  theme(text = element_text(size = 14)) + xlim(0.7, 1) + ylim(-1.2, 1.2)


hist_right <- ggplot(DATA, aes(DD)) + geom_histogram(fill = "gray70", colour = "gray60", alpha = 0.25,
                                                     binwidth = 0.15) + xlim(-1.05, 1.2)+ scale_y_continuous(breaks = NULL) +
  labs(x = "", y = "") + coord_flip()
#hist_right

svg("predictors.svg", height = 7, width = 8, family = "cmr10")
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

#ggplot(Countries_IsAlC, aes(round, cor)) + geom_boxplot() + facet_wrap(domain ~ Country)

#result <- Countries_IsAlC %>% group_by(domain, Region, round) %>% dplyr::summarize(mean = mean(cor, na.rm = TRUE), sd = sd(cor, na.rm = TRUE), n = n())

CZ <- lm(cor ~ round*domain, data = Countries_IsAlC, subset=(Country == "Czech Republic"))
SK <- lm(cor ~ round*domain, data = Countries_IsAlC, subset=(Country == "Slovakia"))
HU <- lm(cor ~ round*domain, data = Countries_IsAlC, subset=(Country == "Hungary"))
PL <- lm(cor ~ round*domain, data = Countries_IsAlC, subset=(Country == "Poland"))
FR <- lm(cor ~ round*domain, data = Countries_IsAlC, subset=(Country == "France"))
GE <- lm(cor ~ round*domain, data = Countries_IsAlC, subset=(Country == "Germany"))
IR <- lm(cor ~ round*domain, data = Countries_IsAlC, subset=(Country == "Ireland"))
NL <- lm(cor ~ round*domain, data = Countries_IsAlC, subset=(Country == "Netherlands"))
BE <- lm(cor ~ round*domain, data = Countries_IsAlC, subset=(Country == "Belgium"))
AU <- lm(cor ~ round*domain, data = Countries_IsAlC, subset=(Country == "Austria"))
FI <- lm(cor ~ round*domain, data = Countries_IsAlC, subset=(Country == "Finland"))
SW <- lm(cor ~ round*domain, data = Countries_IsAlC, subset=(Country == "Sweden"))
NO <- lm(cor ~ round*domain, data = Countries_IsAlC, subset=(Country == "Norway"))
IC <- lm(cor ~ round*domain, data = Countries_IsAlC, subset=(Country == "Iceland"))
DN <- lm(cor ~ round*domain, data = Countries_IsAlC, subset=(Country == "Denmark"))
IT <- lm(cor ~ round*domain, data = Countries_IsAlC, subset=(Country == "Italy"))
SP <- lm(cor ~ round*domain, data = Countries_IsAlC, subset=(Country == "Spain"))
PT <- lm(cor ~ round*domain, data = Countries_IsAlC, subset=(Country == "Portugal"))
MT <- lm(cor ~ round*domain, data = Countries_IsAlC, subset=(Country == "Malta"))


PCZ <- plot_model(CZ, type = "pred", terms = c("round", "domain"), dot.size = 2,
                  line.size = 1, axis.title = c("", ""), colors = c("grey50", "deepskyblue4", "seagreen3"),
                  show.legend = F, prefix.labels = "label", title = "Czech Republic") + ylim(-0.15, 0.6)  + font_size(title = 10,  axis_title.y = 10, labels.x = 9, labels.y = 9)
PSK <- plot_model(SK, type = "pred", terms = c("round", "domain"), dot.size = 2,
                  line.size = 1, axis.title = c("", ""), colors = c("grey50", "deepskyblue4", "seagreen3"),
                  show.legend = F, prefix.labels = "label", title = "Slovakia") + ylim(-0.15, 0.6)  + font_size(title = 10,  axis_title.y = 10, labels.x = 9, labels.y = 9)
PHU <- plot_model(HU, type = "pred", terms = c("round", "domain"), dot.size = 2,
                  line.size = 1, axis.title = c("", ""), colors = c("grey50", "deepskyblue4", "seagreen3"),
                  show.legend = F, prefix.labels = "label", title = "Hungary") + ylim(-0.15, 0.6)  + font_size(title = 10,  axis_title.y = 10, labels.x = 9, labels.y = 9)
PPL <- plot_model(PL, type = "pred", terms = c("round", "domain"), dot.size = 2,
                  line.size = 1, axis.title = c("", ""), colors = c("grey50", "deepskyblue4", "seagreen3"),
                  show.legend = F, prefix.labels = "label", title = "Poland") + ylim(-0.15, 0.6)  + font_size(title = 10,  axis_title.y = 10, labels.x = 9, labels.y = 9)
PFR <- plot_model(FR, type = "pred", terms = c("round", "domain"), dot.size = 2,
                  line.size = 1, axis.title = c("", ""), colors = c("grey50", "deepskyblue4", "seagreen3"),
                  show.legend = F, prefix.labels = "label", title = "France") + ylim(-0.15, 0.6)  + font_size(title = 10,  axis_title.y = 10, labels.x = 9, labels.y = 9)
PGE <- plot_model(GE, type = "pred", terms = c("round", "domain"), dot.size = 2,
                  line.size = 1, axis.title = c("", ""), colors = c("grey50", "deepskyblue4", "seagreen3"),
                  show.legend = F, prefix.labels = "label", title = "Germany") + ylim(-0.15, 0.6)  + font_size(title = 10,  axis_title.y = 10, labels.x = 9, labels.y = 9)
PIR <- plot_model(IR, type = "pred", terms = c("round", "domain"), dot.size = 2,
                  line.size = 1, axis.title = c("", ""), colors = c("grey50", "deepskyblue4", "seagreen3"),
                  show.legend = F, prefix.labels = "label", title = "Ireland") + ylim(-0.15, 0.6)  + font_size(title = 10,  axis_title.y = 10, labels.x = 9, labels.y = 9)
PNL <- plot_model(NL, type = "pred", terms = c("round", "domain"), dot.size = 2,
                  line.size = 1, axis.title = c("", ""), colors = c("grey50", "deepskyblue4", "seagreen3"),
                  show.legend = F, prefix.labels = "label", title = "Netherlands") + ylim(-0.15, 0.6)  + font_size(title = 10,  axis_title.y = 10, labels.x = 9, labels.y = 9)
PBE <- plot_model(BE, type = "pred", terms = c("round", "domain"), dot.size = 2,
                  line.size = 1, axis.title = c("", ""), colors = c("grey50", "deepskyblue4", "seagreen3"),
                  show.legend = F, prefix.labels = "label", title = "Belgium") + ylim(-0.15, 0.6)  + font_size(title = 10,  axis_title.y = 10, labels.x = 9, labels.y = 9)
PAU <- plot_model(AU, type = "pred", terms = c("round", "domain"), dot.size = 2,
                  line.size = 1, axis.title = c("", ""), colors = c("grey50", "deepskyblue4", "seagreen3"),
                  show.legend = F, prefix.labels = "label", title = "Austria") + ylim(-0.15, 0.6)  + font_size(title = 10,  axis_title.y = 10, labels.x = 9, labels.y = 9)
PFI <- plot_model(FI, type = "pred", terms = c("round", "domain"), dot.size = 2,
                  line.size = 1, axis.title = c("", "Polarization"), colors = c("grey50", "deepskyblue4", "seagreen3"),
                  show.legend = F, prefix.labels = "label", title = "Finland") + ylim(-0.15, 0.6)  + font_size(title = 10,  axis_title.y = 10, labels.x = 9, labels.y = 9)
PSW <- plot_model(SW, type = "pred", terms = c("round", "domain"), dot.size = 2,
                  line.size = 1, axis.title = c("", "Polarization"), colors = c("grey50", "deepskyblue4", "seagreen3"),
                  show.legend = F, prefix.labels = "label", title = "Sweden") + ylim(-0.15, 0.6) + font_size(title = 10,  axis_title.y = 10, labels.x = 9, labels.y = 9)
PNO <- plot_model(NO, type = "pred", terms = c("round", "domain"), dot.size = 2,
                  line.size = 1, axis.title = c("", "Polarization"), colors = c("grey50", "deepskyblue4", "seagreen3"),
                  show.legend = F, prefix.labels = "label", title = "Norway") + ylim(-0.15, 0.6)  + font_size(title = 10,  axis_title.y = 10, labels.x = 9, labels.y = 9)
PIC <- plot_model(IC, type = "pred", terms = c("round", "domain"), dot.size = 2,
                  line.size = 1, axis.title = c("", "Polarization"), colors = c("grey50", "deepskyblue4", "seagreen3"),
                  show.legend = F, prefix.labels = "label", title = "Iceland") + ylim(-0.15, 0.6)  + font_size(title = 10,  axis_title.y = 10, labels.x = 9, labels.y = 9)
PDN <- plot_model(DN, type = "pred", terms = c("round", "domain"), dot.size = 2,
                  line.size = 1, axis.title = c("", "Polarization"), colors = c("grey50", "deepskyblue4", "seagreen3"),
                  show.legend = F, prefix.labels = "label", title = "Denmark") + ylim(-0.15, 0.6)  + font_size(title = 10,  axis_title.y = 10, labels.x = 9, labels.y = 9)
PIT <- plot_model(IT, type = "pred", terms = c("round", "domain"), dot.size = 2,
                  line.size = 1, axis.title = c("", ""), colors = c("grey50", "deepskyblue4", "seagreen3"),
                  show.legend = F, prefix.labels = "label", title = "Italy") + ylim(-0.15, 0.6)  + font_size(title = 10,  axis_title.y = 10, labels.x = 9, labels.y = 9)
PSP <- plot_model(SP, type = "pred", terms = c("round", "domain"), dot.size = 2,
                  line.size = 1, axis.title = c("", ""), colors = c("grey50", "deepskyblue4", "seagreen3"),
                  show.legend = F, prefix.labels = "label", title = "Spain") + ylim(-0.15, 0.6)  + font_size(title = 10,  axis_title.y = 10, labels.x = 9, labels.y = 9)
PPT <- plot_model(PT, type = "pred", terms = c("round", "domain"), dot.size = 2,
                  line.size = 1, axis.title = c("", ""), colors = c("grey50", "deepskyblue4", "seagreen3"),
                  show.legend = F, prefix.labels = "label", title = "Portugal") + ylim(-0.15, 0.6)  + font_size(title = 10,  axis_title.y = 10, labels.x = 9, labels.y = 9)
PMT <- plot_model(MT, type = "pred", terms = c("round", "domain"), dot.size = 2,
                  line.size = 1, axis.title = c("", ""), colors = c("grey50", "deepskyblue4", "seagreen3"),
                  show.legend = F, prefix.labels = "label", title = "Malta") + ylim(-0.15, 0.6)  + font_size(title = 10,  axis_title.y = 10, labels.x = 9, labels.y = 9)

svg("IP Description.svg", family = "cmr10", height = 12, width = 8)
PFI + PFR + PAU + PCZ +
  PSW + PGE + PIT + PSK +
  PNO + PIR + PSP + PHU +
  PIC + PNL + PPT + PPL +
  PDN + PBE + PMT + plot_layout(nrow = 5)
dev.off()

##############
#Predictors, Transformation
##############
denom_data <- read.csv("Denom_data.csv", sep = ";")
DAT <- merge(Countries_IsAlC, denom_data, by = "Country")
HDI <- read.csv("HDR21-22_Composite_indices_complete_time_series.csv", sep = ";")

#Reshaping data on HDI
HDI1990 <- HDI %>% select(country, hdi_1990) %>% mutate(round = 1990) %>% rename(HDI = hdi_1990)
HDI1999 <- HDI %>% select(country, hdi_1999) %>% mutate(round = 1999) %>% rename(HDI = hdi_1999)
HDI2008 <- HDI %>% select(country, hdi_2008) %>% mutate(round = 2008) %>% rename(HDI = hdi_2008)
HDI2017 <- HDI %>% select(country, hdi_2017) %>% mutate(round = 2017) %>% rename(HDI = hdi_2017)
HDIData <- rbind(HDI1990, HDI1999, HDI2008, HDI2017)
HDIData %<>% rename(Country = country)
DATA <- merge(DAT, HDIData, by = c("Country", "round"))
DATA %<>% filter(domain != "Across Domains")

#Spliting data by issue domain
DATAcult <- DATA %>% filter(domain == "Cultural")
DATAcult %<>% mutate(round = case_when(round == 1990 ~ 1,
                                       round == 1999 ~ 2,
                                       round == 2008 ~ 3,
                                       round == 2017 ~ 4))
DATAcult %<>% mutate(round = as.factor(round))


DATAecon <- DATA %>% filter(domain == "Economic")
DATAecon %<>% mutate(round = case_when(round == 1990 ~ 1,
                                       round == 1999 ~ 2,
                                       round == 2008 ~ 3,
                                       round == 2017 ~ 4))
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





