#reverse code so higher values reflect more liberal attitudes
EVSRelig <- EVS_Trendfile %>% mutate(E035 = -1*E035 + 11)


#reducing the dataset to studied variables
EVSRelig %<>% dplyr::select("E035", "E036", "E037", "E038", "E039", "E042", "F118", "F119", "F120",
                          "F121", "F122", "F123", "F126", "F132", "F144_01", "F028", "S002EVS", "F034", "COW_NUM")

EVSRelig1 <- EVSRelig %>% subset(F034 == 1)
EVSRelig2 <- EVSRelig %>% subset(F034 == 2)
EVSRelig3 <- EVSRelig %>% subset(F034 == 3)


##############
#Cohort1

#Creating dataset
#Round 2
res2_205 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 205) %>% dplyr::select(E035:F144_01)))
res2_210 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res2_211 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 211) %>% dplyr::select(E035:F144_01)))
res2_220 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res2_230 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res2_235 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res2_255 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res2_290 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res2_305 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res2_310 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res2_316 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res2_317 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res2_325 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res2_338 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 338) %>% dplyr::select(E035:F144_01)))
res2_375 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res2_380 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res2_385 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))
res2_390 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res2_395 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))

#Round 3
res3_205 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 205) %>% dplyr::select(E035:F144_01)))
res3_210 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res3_211 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 211) %>% dplyr::select(E035:F144_01)))
res3_220 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res3_230 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res3_235 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res3_255 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res3_290 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res3_305 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res3_310 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res3_316 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res3_317 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res3_325 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res3_338 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 338) %>% dplyr::select(E035:F144_01)))
res3_375 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res3_380 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res3_390 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res3_395 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))

#Round 4
res4_205 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 205) %>% dplyr::select(E035:F144_01)))
res4_210 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res4_211 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 211) %>% dplyr::select(E035:F144_01)))
res4_220 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res4_230 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res4_235 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res4_255 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res4_290 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res4_305 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res4_310 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res4_316 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res4_317 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res4_325 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res4_338 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 338) %>% dplyr::select(E035:F144_01)))
res4_375 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res4_380 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res4_390 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res4_395 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))
res4_385 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))

#Round 5
res5_210 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res5_220 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res5_230 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res5_235 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res5_255 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res5_290 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res5_305 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res5_310 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res5_316 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res5_317 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res5_325 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res5_375 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res5_380 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res5_390 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res5_395 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))
res5_385 <- rcorr(as.matrix(EVSRelig1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))

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

#combine datasets
Relig1_IsAl <- bind_rows(df2_205, df2_210, df2_211, df2_220, df2_230, df2_235, df2_255, df2_290,
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

Relig1_IsAlD <- Relig1_IsAl %>% mutate(domain = case_when((row %in% Cultural) & (column %in% Cultural) ~ "Cultural",
                                                            (row %in% Economic) & (column %in% Economic) ~ "Economic",
                                                            TRUE ~ "Across Domains"))

Relig1_IsAlC <- Relig1_IsAlD %>% unite("issue", row:column, remove = FALSE, sep = "-") %>% dplyr::select("issue", "cor", "domain", "round", "Country")

rm(Relig1_IsAl, Relig1_IsAlD)
##############
#Cohort2

#Creating dataset
#Round 2
res2_205 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 205) %>% dplyr::select(E035:F144_01)))
res2_210 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res2_211 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 211) %>% dplyr::select(E035:F144_01)))
res2_220 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res2_230 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res2_235 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res2_255 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res2_290 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res2_305 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res2_310 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res2_316 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res2_317 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res2_325 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res2_338 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 338) %>% dplyr::select(E035:F144_01)))
res2_375 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res2_380 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res2_385 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))
res2_390 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res2_395 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))

#Round 3
res3_205 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 205) %>% dplyr::select(E035:F144_01)))
res3_210 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res3_211 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 211) %>% dplyr::select(E035:F144_01)))
res3_220 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res3_230 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res3_235 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res3_255 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res3_290 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res3_305 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res3_310 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res3_316 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res3_317 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res3_325 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res3_338 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 338) %>% dplyr::select(E035:F144_01)))
res3_375 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res3_380 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res3_390 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res3_395 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))

#Round 4
res4_205 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 205) %>% dplyr::select(E035:F144_01)))
res4_210 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res4_211 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 211) %>% dplyr::select(E035:F144_01)))
res4_220 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res4_230 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res4_235 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res4_255 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res4_290 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res4_305 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res4_310 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res4_316 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res4_317 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res4_325 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res4_338 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 338) %>% dplyr::select(E035:F144_01)))
res4_375 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res4_380 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res4_390 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res4_395 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))
res4_385 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))

#Round 5
res5_210 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res5_220 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res5_230 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res5_235 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res5_255 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res5_290 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res5_305 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res5_310 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res5_316 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res5_317 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res5_325 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res5_375 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res5_380 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res5_390 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res5_395 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))
res5_385 <- rcorr(as.matrix(EVSRelig2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))

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

#combine datasets
Relig2_IsAl <- bind_rows(df2_205, df2_210, df2_211, df2_220, df2_230, df2_235, df2_255, df2_290,
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

Relig2_IsAlD <- Relig2_IsAl %>% mutate(domain = case_when((row %in% Cultural) & (column %in% Cultural) ~ "Cultural",
                                                            (row %in% Economic) & (column %in% Economic) ~ "Economic",
                                                            TRUE ~ "Across Domains"))

Relig2_IsAlC <- Relig2_IsAlD %>% unite("issue", row:column, remove = FALSE, sep = "-") %>% dplyr::select("issue", "cor", "domain", "round", "Country")

rm(Relig2_IsAlD, Relig2_IsAl)


##############
#Cohort3

#Creating dataset
#Round 2
res2_205 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 205) %>% dplyr::select(E035:F144_01)))
res2_210 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res2_211 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 211) %>% dplyr::select(E035:F144_01)))
res2_220 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res2_230 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res2_235 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res2_255 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res2_290 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res2_305 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res2_310 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res2_316 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res2_317 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res2_325 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res2_375 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res2_380 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res2_385 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))
res2_390 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res2_395 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))

#Round 3
res3_205 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 205) %>% dplyr::select(E035:F144_01)))
res3_210 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res3_211 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 211) %>% dplyr::select(E035:F144_01)))
res3_220 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res3_230 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res3_235 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res3_255 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res3_290 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res3_305 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res3_310 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res3_316 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res3_317 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res3_325 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res3_375 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res3_380 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res3_390 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res3_395 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))

#Round 4
res4_205 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 205) %>% dplyr::select(E035:F144_01)))
res4_210 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res4_211 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 211) %>% dplyr::select(E035:F144_01)))
res4_220 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res4_230 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res4_235 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res4_255 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res4_290 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res4_305 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res4_310 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res4_316 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res4_317 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res4_325 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res4_338 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 338) %>% dplyr::select(E035:F144_01)))
res4_375 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res4_380 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res4_390 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res4_395 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))
res4_385 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))

#Round 5
res5_210 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res5_220 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res5_230 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res5_235 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res5_255 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res5_290 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res5_305 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res5_310 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res5_316 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res5_317 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res5_325 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res5_375 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res5_380 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res5_390 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res5_395 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))
res5_385 <- rcorr(as.matrix(EVSRelig3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))

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
df3_375 <- flattenCorrMatrix(res3_375$r, res3_375$P) %>% mutate(round = 3) %>% mutate(Country = "Finland")
df3_380 <- flattenCorrMatrix(res3_380$r, res3_380$P) %>% mutate(round = 3) %>% mutate(Country = "Sweden")
df3_390 <- flattenCorrMatrix(res3_390$r, res3_390$P) %>% mutate(round = 3) %>% mutate(Country = "Denmark")
df3_395 <- flattenCorrMatrix(res3_395$r, res3_395$P) %>% mutate(round = 3) %>% mutate(Country = "Iceland")

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

#combine datasets
Relig3_IsAl <- bind_rows(df2_205, df2_210, df2_211, df2_220, df2_230, df2_235, df2_255, df2_290,
                          df2_305, df2_310, df2_316, df2_317, df2_325, df2_375, df2_380,
                          df2_390, df2_395, df2_385, df3_205, df3_210, df3_211, df3_220, df3_230,
                          df3_235, df3_255, df3_290, df3_305, df3_310, df3_316, df3_317, df3_325,
                          df3_375, df3_380, df3_390, df3_395, df4_205, df4_210, df4_211,
                          df4_220, df4_230, df4_235, df4_255, df4_290, df4_305, df4_310, df4_316,
                          df4_317, df4_325, df4_338, df4_375, df4_380, df4_390, df4_395, df4_385,
                          df5_210, df5_220, df5_230, df5_235, df5_255, df5_290, df5_305, df5_310, df5_316,
                          df5_317, df5_325, df5_375, df5_380, df5_390, df5_395, df5_385, .id = NULL)

rm(df2_205, df2_210, df2_211, df2_220, df2_230, df2_235, df2_255, df2_290,
   df2_305, df2_310, df2_316, df2_317, df2_325, df2_375, df2_380,
   df2_390, df2_395, df2_385, df3_205, df3_210, df3_211, df3_220, df3_230,
   df3_235, df3_255, df3_290, df3_305, df3_310, df3_316, df3_317, df3_325,
   df3_375, df3_380, df3_390, df3_395, df4_205, df4_210, df4_211,
   df4_220, df4_230, df4_235, df4_255, df4_290, df4_305, df4_310, df4_316,
   df4_317, df4_325, df4_338, df4_375, df4_380, df4_390, df4_395, df4_385,
   df5_210, df5_220, df5_230, df5_235, df5_255, df5_290, df5_305, df5_310, df5_316,
   df5_317, df5_325, df5_375, df5_380, df5_390, df5_395, df5_385)

rm(res2_205, res2_210, res2_211, res2_220, res2_230, res2_235, res2_255, res2_290,
   res2_305, res2_310, res2_316, res2_317, res2_325, res2_375, res2_380,
   res2_390, res2_395, res2_385, res3_205, res3_210, res3_211, res3_220, res3_230,
   res3_235, res3_255, res3_290, res3_305, res3_310, res3_316, res3_317, res3_325,
   res3_375, res3_380, res3_390, res3_395, res4_205, res4_210, res4_211,
   res4_220, res4_230, res4_235, res4_255, res4_290, res4_305, res4_310, res4_316,
   res4_317, res4_325, res4_338, res4_375, res4_380, res4_390, res4_395, res4_385,
   res5_210, res5_220, res5_230, res5_235, res5_255, res5_290, res5_305, res5_310, res5_316,
   res5_317, res5_325, res5_375, res5_380, res5_390, res5_395, res5_385)

Relig3_IsAlD <- Relig3_IsAl %>% mutate(domain = case_when((row %in% Cultural) & (column %in% Cultural) ~ "Cultural",
                                                            (row %in% Economic) & (column %in% Economic) ~ "Economic",
                                                            TRUE ~ "Across Domains"))

Relig3_IsAlC <- Relig3_IsAlD %>% unite("issue", row:column, remove = FALSE, sep = "-") %>% dplyr::select("issue", "cor", "domain", "round", "Country")

rm(Relig3_IsAlD, Relig3_IsAl)


##############


Relig1_IsAlC %<>% mutate(relig = 1)
Relig2_IsAlC %<>% mutate(relig = 2)
Relig3_IsAlC %<>% mutate(relig = 3)

ReligData <- bind_rows(Relig1_IsAlC, Relig2_IsAlC, Relig3_IsAlC)

ReligData %<>% filter(domain != "Across Domains")
ReligData <- ReligData %>% mutate(round = as.character(round))
ReligData$round <- ordered(ReligData$round,
                             levels = c(2,3,4,5),
                             labels = c("1990", "1999", "2008", "2017"))

HDIData2 = HDIData |> mutate(round = case_when(round == 2 ~ "1990",
                                               round == 3 ~ "1999",
                                               round == 4 ~ "2008",
                                               round == 5 ~ "2017"))

ReligData2 <- merge(ReligData, denom_data, by = c("Country"))

ReligData21 <- ReligData2 %>% subset(round == "1990") %>% mutate(DD = cut(DD, 3, labels = c("Protestant", "middle", "Catholic")))
ReligData22 <- ReligData2 %>% subset(round == "1999") %>% mutate(DD = cut(DD, 3, labels = c("Protestant", "middle", "Catholic")))
ReligData23 <- ReligData2 %>% subset(round == "2008") %>% mutate(DD = cut(DD, 3, labels = c("Protestant", "middle", "Catholic")))
ReligData24 <- ReligData2 %>% subset(round == "2017") %>% mutate(DD = cut(DD, 3, labels = c("Protestant", "middle", "Catholic")))

ReligData2 <- bind_rows(ReligData21, ReligData22, ReligData23, ReligData24)
rm(ReligData21, ReligData22, ReligData23, ReligData24)

ReligData2 %<>% mutate(relig = as.factor(case_when(relig == 1 ~ "Religious",
                                                      relig == 2 ~  "Not Religious",
                                                      relig == 3 ~  "Atheist")))
ReligCult <- ReligData2 %>% subset(domain == "Cultural")
ReligEcon <- ReligData2 %>% subset(domain == "Economic")

#Model social
R1 <- lmer(cor ~ relig + round + relig*round*DD + (1|Country), data = ReligCult)

new_data2 <- expand.grid(
  relig = unique(ReligCult$relig),
  round = unique(ReligCult$round),
  DD = unique(ReligCult$DD),
  Country = unique(ReligCult$Country)
)

pred <- predict(R1, newdata = new_data2, re.form = NA, se.fit = TRUE)
new_data2$predicted <- pred$fit
new_data2$se.fit <- pred$se.fit
new_data2 <- new_data2 %>%
  mutate(
    lower = predicted - 1.96 * se.fit,
    upper = predicted + 1.96 * se.fit
  )


ggplot(new_data2 |> filter(round == "2017" | round == "1990") |> filter(!DD == "middle"), aes(x = relig, y = predicted, color = round)) +
  geom_point(size = 2) +
  geom_line(aes(y = predicted, group = round), size = .9) +
  geom_ribbon(aes(ymin = lower, ymax = upper, group = round, fill = round), alpha = 0.2) +
  facet_wrap(~DD) +
  labs(title = "",
       x = "Religious Identity",
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



















T2 <- lmer(cor ~ cohort + round + cohort*round*HDI + (1|Country), data = CohEcon)
#arm::display(T2)
plot_model(T2, type = "pred", terms = c("cohort", "round[1990, 2017]", "HDI[lowest, highest]"), colors = c("deepskyblue4", "grey20"))


T2P <- plot_model(T2, type = "pred", terms = "cohort", title = "Economy",
                  dot.size = 3, line.size = 1.2,
                  axis.title = c("Cohort", "")) +
  theme(text = element_text(size = 14))

svg("IP Cohorts2.svg", family = "cmr10", height = 5, width = 10)
T1P + T2P
dev.off()



