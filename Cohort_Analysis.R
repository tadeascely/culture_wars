

#reverse code so higher values reflect more liberal attitudes
EVSCoh <- EVS_Trendfile %>% mutate(E035 = -1*E035 + 11)


#reducing the dataset to studied variables
EVSCoh %<>% dplyr::select("E035", "E036", "E037", "E038", "E039", "E042", "F118", "F119", "F120",
                          "F121", "F122", "F123", "F126", "F132", "F144_01", "F028", "S002EVS", "X003R", "COW_NUM")

EVSCoh1 <- EVSCoh %>% subset(X003R == 1)
EVSCoh2 <- EVSCoh %>% subset(X003R == 2)
EVSCoh3 <- EVSCoh %>% subset(X003R == 3)
EVSCoh4 <- EVSCoh %>% subset(X003R == 4)
EVSCoh5 <- EVSCoh %>% subset(X003R == 5)
EVSCoh6 <- EVSCoh %>% subset(X003R == 6)

##############
#Cohort1

#Creating dataset
#Round 2
res2_205 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 205) %>% dplyr::select(E035:F144_01)))
res2_210 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res2_211 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 211) %>% dplyr::select(E035:F144_01)))
res2_220 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res2_230 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res2_235 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res2_255 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res2_290 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res2_305 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res2_310 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res2_316 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res2_317 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res2_325 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res2_338 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 338) %>% dplyr::select(E035:F144_01)))
res2_375 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res2_380 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res2_385 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))
res2_390 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res2_395 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))

#Round 3
res3_205 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 205) %>% dplyr::select(E035:F144_01)))
res3_210 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res3_211 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 211) %>% dplyr::select(E035:F144_01)))
res3_220 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res3_230 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res3_235 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res3_255 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res3_290 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res3_305 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res3_310 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res3_316 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res3_317 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res3_325 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res3_338 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 338) %>% dplyr::select(E035:F144_01)))
res3_375 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res3_380 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res3_390 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res3_395 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))

#Round 4
res4_205 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 205) %>% dplyr::select(E035:F144_01)))
res4_210 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res4_211 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 211) %>% dplyr::select(E035:F144_01)))
res4_220 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res4_230 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res4_235 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res4_255 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res4_290 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res4_305 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res4_310 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res4_316 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res4_317 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res4_325 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res4_338 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 338) %>% dplyr::select(E035:F144_01)))
res4_375 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res4_380 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res4_390 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res4_395 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))
res4_385 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))

#Round 5
res5_210 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res5_220 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res5_230 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res5_235 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res5_255 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res5_290 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res5_305 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res5_310 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res5_316 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res5_317 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res5_325 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res5_375 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res5_380 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res5_390 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res5_395 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))
res5_385 <- rcorr(as.matrix(EVSCoh1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))

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
Cohort1_IsAl <- bind_rows(df2_205, df2_210, df2_211, df2_220, df2_230, df2_235, df2_255, df2_290,
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

Cohort1_IsAlD <- Cohort1_IsAl %>% mutate(domain = case_when((row %in% Cultural) & (column %in% Cultural) ~ "Cultural",
                                                            (row %in% Economic) & (column %in% Economic) ~ "Economic",
                                                            TRUE ~ "Across Domains"))

Cohort1_IsAlC <- Cohort1_IsAlD %>% unite("issue", row:column, remove = FALSE, sep = "-") %>% dplyr::select("issue", "cor", "domain", "round", "Country")


##############
#Cohort2

#Creating dataset
#Round 2
res2_205 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 205) %>% dplyr::select(E035:F144_01)))
res2_210 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res2_211 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 211) %>% dplyr::select(E035:F144_01)))
res2_220 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res2_230 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res2_235 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res2_255 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res2_290 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res2_305 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res2_310 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res2_316 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res2_317 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res2_325 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res2_338 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 338) %>% dplyr::select(E035:F144_01)))
res2_375 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res2_380 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res2_385 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))
res2_390 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res2_395 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))

#Round 3
res3_205 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 205) %>% dplyr::select(E035:F144_01)))
res3_210 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res3_211 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 211) %>% dplyr::select(E035:F144_01)))
res3_220 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res3_230 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res3_235 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res3_255 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res3_290 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res3_305 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res3_310 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res3_316 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res3_317 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res3_325 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res3_338 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 338) %>% dplyr::select(E035:F144_01)))
res3_375 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res3_380 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res3_390 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res3_395 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))

#Round 4
res4_205 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 205) %>% dplyr::select(E035:F144_01)))
res4_210 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res4_211 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 211) %>% dplyr::select(E035:F144_01)))
res4_220 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res4_230 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res4_235 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res4_255 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res4_290 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res4_305 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res4_310 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res4_316 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res4_317 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res4_325 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res4_338 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 338) %>% dplyr::select(E035:F144_01)))
res4_375 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res4_380 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res4_390 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res4_395 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))
res4_385 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))

#Round 5
res5_210 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res5_220 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res5_230 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res5_235 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res5_255 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res5_290 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res5_305 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res5_310 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res5_316 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res5_317 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res5_325 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res5_375 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res5_380 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res5_390 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res5_395 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))
res5_385 <- rcorr(as.matrix(EVSCoh2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))

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
Cohort2_IsAl <- bind_rows(df2_205, df2_210, df2_211, df2_220, df2_230, df2_235, df2_255, df2_290,
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

Cohort2_IsAlD <- Cohort2_IsAl %>% mutate(domain = case_when((row %in% Cultural) & (column %in% Cultural) ~ "Cultural",
                                                            (row %in% Economic) & (column %in% Economic) ~ "Economic",
                                                            TRUE ~ "Across Domains"))

Cohort2_IsAlC <- Cohort2_IsAlD %>% unite("issue", row:column, remove = FALSE, sep = "-") %>% dplyr::select("issue", "cor", "domain", "round", "Country")

rm(Cohort2_IsAlD, Cohort2_IsAl)


##############
#Cohort3

#Creating dataset
#Round 2
res2_205 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 205) %>% dplyr::select(E035:F144_01)))
res2_210 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res2_211 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 211) %>% dplyr::select(E035:F144_01)))
res2_220 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res2_230 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res2_235 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res2_255 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res2_290 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res2_305 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res2_310 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res2_316 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res2_317 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res2_325 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res2_338 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 338) %>% dplyr::select(E035:F144_01)))
res2_375 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res2_380 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res2_385 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))
res2_390 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res2_395 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))

#Round 3
res3_205 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 205) %>% dplyr::select(E035:F144_01)))
res3_210 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res3_211 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 211) %>% dplyr::select(E035:F144_01)))
res3_220 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res3_230 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res3_235 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res3_255 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res3_290 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res3_305 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res3_310 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res3_316 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res3_317 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res3_325 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res3_338 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 338) %>% dplyr::select(E035:F144_01)))
res3_375 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res3_380 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res3_390 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res3_395 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))

#Round 4
res4_205 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 205) %>% dplyr::select(E035:F144_01)))
res4_210 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res4_211 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 211) %>% dplyr::select(E035:F144_01)))
res4_220 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res4_230 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res4_235 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res4_255 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res4_290 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res4_305 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res4_310 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res4_316 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res4_317 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res4_325 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res4_338 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 338) %>% dplyr::select(E035:F144_01)))
res4_375 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res4_380 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res4_390 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res4_395 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))
res4_385 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))

#Round 5
res5_210 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res5_220 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res5_230 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res5_235 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res5_255 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res5_290 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res5_305 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res5_310 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res5_316 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res5_317 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res5_325 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res5_375 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res5_380 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res5_390 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res5_395 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))
res5_385 <- rcorr(as.matrix(EVSCoh3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))

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
Cohort3_IsAl <- bind_rows(df2_205, df2_210, df2_211, df2_220, df2_230, df2_235, df2_255, df2_290,
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

Cohort3_IsAlD <- Cohort3_IsAl %>% mutate(domain = case_when((row %in% Cultural) & (column %in% Cultural) ~ "Cultural",
                                                            (row %in% Economic) & (column %in% Economic) ~ "Economic",
                                                            TRUE ~ "Across Domains"))

Cohort3_IsAlC <- Cohort3_IsAlD %>% unite("issue", row:column, remove = FALSE, sep = "-") %>% dplyr::select("issue", "cor", "domain", "round", "Country")

rm(Cohort3_IsAlD, Cohort3_IsAl)


##############
#Cohort4

#Creating dataset
#Round 2
res2_205 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 205) %>% dplyr::select(E035:F144_01)))
res2_210 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res2_211 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 211) %>% dplyr::select(E035:F144_01)))
res2_220 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res2_230 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res2_235 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res2_255 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res2_290 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res2_305 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res2_310 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res2_316 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res2_317 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res2_325 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res2_338 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 338) %>% dplyr::select(E035:F144_01)))
res2_375 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res2_380 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res2_385 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))
res2_390 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res2_395 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))

#Round 3
res3_205 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 205) %>% dplyr::select(E035:F144_01)))
res3_210 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res3_211 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 211) %>% dplyr::select(E035:F144_01)))
res3_220 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res3_230 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res3_235 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res3_255 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res3_290 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res3_305 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res3_310 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res3_316 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res3_317 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res3_325 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res3_338 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 338) %>% dplyr::select(E035:F144_01)))
res3_375 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res3_380 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res3_390 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res3_395 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))

#Round 4
res4_205 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 205) %>% dplyr::select(E035:F144_01)))
res4_210 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res4_211 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 211) %>% dplyr::select(E035:F144_01)))
res4_220 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res4_230 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res4_235 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res4_255 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res4_290 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res4_305 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res4_310 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res4_316 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res4_317 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res4_325 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res4_338 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 338) %>% dplyr::select(E035:F144_01)))
res4_375 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res4_380 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res4_390 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res4_395 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))
res4_385 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))

#Round 5
res5_210 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res5_220 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res5_230 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res5_235 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res5_255 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res5_290 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res5_305 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res5_310 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res5_316 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res5_317 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res5_325 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res5_375 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res5_380 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res5_390 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res5_395 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))
res5_385 <- rcorr(as.matrix(EVSCoh4 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))

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
Cohort4_IsAl <- bind_rows(df2_205, df2_210, df2_211, df2_220, df2_230, df2_235, df2_255, df2_290,
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

Cohort4_IsAlD <- Cohort4_IsAl %>% mutate(domain = case_when((row %in% Cultural) & (column %in% Cultural) ~ "Cultural",
                                                            (row %in% Economic) & (column %in% Economic) ~ "Economic",
                                                            TRUE ~ "Across Domains"))

Cohort4_IsAlC <- Cohort4_IsAlD %>% unite("issue", row:column, remove = FALSE, sep = "-") %>% dplyr::select("issue", "cor", "domain", "round", "Country")

rm(Cohort4_IsAlD, Cohort4_IsAl)


##############
#Cohort5

#Creating dataset
#Round 2
res2_205 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 205) %>% dplyr::select(E035:F144_01)))
res2_210 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res2_211 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 211) %>% dplyr::select(E035:F144_01)))
res2_220 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res2_230 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res2_235 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res2_255 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res2_290 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res2_305 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res2_310 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res2_316 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res2_317 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res2_325 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res2_338 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 338) %>% dplyr::select(E035:F144_01)))
res2_375 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res2_380 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res2_385 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))
res2_390 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res2_395 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))

#Round 3
res3_205 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 205) %>% dplyr::select(E035:F144_01)))
res3_210 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res3_211 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 211) %>% dplyr::select(E035:F144_01)))
res3_220 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res3_230 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res3_235 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res3_255 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res3_290 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res3_305 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res3_310 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res3_316 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res3_317 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res3_325 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res3_338 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 338) %>% dplyr::select(E035:F144_01)))
res3_375 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res3_380 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res3_390 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res3_395 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))

#Round 4
res4_205 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 205) %>% dplyr::select(E035:F144_01)))
res4_210 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res4_211 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 211) %>% dplyr::select(E035:F144_01)))
res4_220 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res4_230 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res4_235 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res4_255 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res4_290 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res4_305 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res4_310 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res4_316 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res4_317 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res4_325 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res4_338 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 338) %>% dplyr::select(E035:F144_01)))
res4_375 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res4_380 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res4_390 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res4_395 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))
res4_385 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))

#Round 5
res5_210 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res5_220 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res5_230 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res5_235 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res5_255 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res5_290 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res5_305 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res5_310 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res5_316 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res5_317 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res5_325 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res5_375 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res5_380 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res5_390 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res5_395 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))
res5_385 <- rcorr(as.matrix(EVSCoh5 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))

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
Cohort5_IsAl <- bind_rows(df2_205, df2_210, df2_211, df2_220, df2_230, df2_235, df2_255, df2_290,
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

Cohort5_IsAlD <- Cohort5_IsAl %>% mutate(domain = case_when((row %in% Cultural) & (column %in% Cultural) ~ "Cultural",
                                                            (row %in% Economic) & (column %in% Economic) ~ "Economic",
                                                            TRUE ~ "Across Domains"))

Cohort5_IsAlC <- Cohort5_IsAlD %>% unite("issue", row:column, remove = FALSE, sep = "-") %>% dplyr::select("issue", "cor", "domain", "round", "Country")

rm(Cohort5_IsAlD, Cohort5_IsAl)


##############
#Cohort6

#Creating dataset
#Round 2
res2_205 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 205) %>% dplyr::select(E035:F144_01)))
res2_210 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res2_211 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 211) %>% dplyr::select(E035:F144_01)))
res2_220 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res2_230 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res2_235 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res2_255 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res2_290 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res2_305 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res2_310 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res2_316 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res2_317 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res2_325 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res2_338 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 338) %>% dplyr::select(E035:F144_01)))
res2_375 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res2_380 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res2_385 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))
res2_390 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res2_395 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))

#Round 3
res3_205 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 205) %>% dplyr::select(E035:F144_01)))
res3_210 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res3_211 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 211) %>% dplyr::select(E035:F144_01)))
res3_220 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res3_230 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res3_235 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res3_255 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res3_290 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res3_305 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res3_310 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res3_316 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res3_317 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res3_325 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res3_338 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 338) %>% dplyr::select(E035:F144_01)))
res3_375 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res3_380 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res3_390 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res3_395 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))

#Round 4
res4_205 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 205) %>% dplyr::select(E035:F144_01)))
res4_210 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res4_211 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 211) %>% dplyr::select(E035:F144_01)))
res4_220 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res4_230 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res4_235 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res4_255 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res4_290 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res4_305 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res4_310 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res4_316 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res4_317 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res4_325 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res4_338 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 338) %>% dplyr::select(E035:F144_01)))
res4_375 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res4_380 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res4_390 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res4_395 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))
res4_385 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))

#Round 5
res5_210 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res5_220 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res5_230 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res5_235 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res5_255 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res5_290 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res5_305 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res5_310 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res5_316 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res5_317 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res5_325 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res5_375 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res5_380 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res5_390 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res5_395 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))
res5_385 <- rcorr(as.matrix(EVSCoh6 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))

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
Cohort6_IsAl <- bind_rows(df2_205, df2_210, df2_211, df2_220, df2_230, df2_235, df2_255, df2_290,
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

Cohort6_IsAlD <- Cohort6_IsAl %>% mutate(domain = case_when((row %in% Cultural) & (column %in% Cultural) ~ "Cultural",
                                                            (row %in% Economic) & (column %in% Economic) ~ "Economic",
                                                            TRUE ~ "Across Domains"))

Cohort6_IsAlC <- Cohort6_IsAlD %>% unite("issue", row:column, remove = FALSE, sep = "-") %>% dplyr::select("issue", "cor", "domain", "round", "Country")

rm(Cohort6_IsAlD, Cohort6_IsAl)


Cohort1_IsAlC %<>% mutate(cohort = 1)
Cohort2_IsAlC %<>% mutate(cohort = 2)
Cohort3_IsAlC %<>% mutate(cohort = 3)
Cohort4_IsAlC %<>% mutate(cohort = 4)
Cohort5_IsAlC %<>% mutate(cohort = 5)
Cohort6_IsAlC %<>% mutate(cohort = 6)

CohortsData <- bind_rows(Cohort1_IsAlC, Cohort2_IsAlC, Cohort3_IsAlC, Cohort4_IsAlC, Cohort5_IsAlC, Cohort6_IsAlC)
rm(Cohort1_IsAlC, Cohort2_IsAlC, Cohort3_IsAlC, Cohort4_IsAlC, Cohort5_IsAlC, Cohort6_IsAlC)

CohortsData %<>% filter(domain != "Across Domains")
CohortsData <- CohortsData %>% mutate(round = as.character(round))
CohortsData$round <- ordered(CohortsData$round,
                             levels = c(2,3,4,5),
                             labels = c("1990", "1999", "2008", "2017"))

HDIData2 = HDIData |> mutate(round = case_when(round == 2 ~ "1990",
                                              round == 3 ~ "1999",
                                              round == 4 ~ "2008",
                                              round == 5 ~ "2017"))

CohortsData2 <- merge(CohortsData, HDIData2, by = c("Country", "round"))

CohortsData21 <- CohortsData2 %>% subset(round == "1990") %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
CohortsData22 <- CohortsData2 %>% subset(round == "1999") %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
CohortsData23 <- CohortsData2 %>% subset(round == "2008") %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
CohortsData24 <- CohortsData2 %>% subset(round == "2017") %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
CohortsData2 <- bind_rows(CohortsData21, CohortsData22, CohortsData23, CohortsData24)
rm(CohortsData21, CohortsData22, CohortsData23, CohortsData24)

CohortsData2 %<>% mutate(cohort = as.factor(case_when(cohort == 1 ~ "15-24",
                                                      cohort == 2 ~  "25-34",
                                                      cohort == 3 ~  "35-44",
                                                      cohort == 4 ~  "45-54",
                                                      cohort == 5 ~  "55-64",
                                                      cohort == 6 ~ "65+")))
CohCult <- CohortsData2 %>% subset(domain == "Cultural")
CohEcon <- CohortsData2 %>% subset(domain == "Economic")

#Coh1 <- lmer(cor ~ cohort + HDI + (round | Country), data = CohCult)
#arm::display(Coh1)
#plot_model(Coh1, type = "int", mdrt.values = "meansd", colors = c("grey40", "grey70", "grey30"))
#Coh1P <- plot_model(Coh1, type = "pred", title = "Culture Wars",
#                    axis.title = c("Cohort", "Issue Alignment"))$cohort +
#  ylim(0.25, 0.45) + theme(text = element_text(size = 14))


#Coh2 <- lmer(cor ~ HDI + cohort + (round | Country), data = CohEcon)
#arm::display(Coh2)
#Coh2P <- plot_model(Coh2, type = "pred", title = "Economy",
#                    axis.title = c("Cohort", ""))$cohort +
#  ylim(0.15, 0.30) + theme(text = element_text(size = 14))
#
#svg("IP Cohorts.svg", family = "cmr10", height = 5, width = 10)
#Coh1P + Coh2P
#dev.off()

#CohCult2 <- CohCult |> mutate(coh2 = case_when(cohort == "15-24" ~ 0,
#                                               cohort == "25-34" ~ 1,
#                                               cohort == "35-44" ~ 2,
#                                               cohort == "45-54" ~ 3,
#                                               cohort == "55-64" ~ 4,
#                                              cohort == "65+" ~ 5))

T1 <- lmer(cor ~ cohort + round + cohort*round*HDI + (1|Country), data = CohCult)

new_data <- expand.grid(
  cohort = unique(CohCult$cohort),
  round = unique(CohCult$round),
  HDI = unique(CohCult$HDI),
  Country = unique(CohCult$Country)
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
ggplot(new_data |> filter(round == "2017" | round == "1990") |> filter(!HDI == "middle"), aes(x = cohort, y = predicted, color = round)) +
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



CohortsData3 <- merge(CohortsData, denom_data, by = c("Country"))

CohortsData31 <- CohortsData3 %>% subset(round == "1990") %>% mutate(DD = cut(DD, 3, labels = c("Protestant", "middle", "Catholic")))
CohortsData32 <- CohortsData3 %>% subset(round == "1999") %>% mutate(DD = cut(DD, 3, labels = c("Protestant", "middle", "Catholic")))
CohortsData33 <- CohortsData3 %>% subset(round == "2008") %>% mutate(DD = cut(DD, 3, labels = c("Protestant", "middle", "Catholic")))
CohortsData34 <- CohortsData3 %>% subset(round == "2017") %>% mutate(DD = cut(DD, 3, labels = c("Protestant", "middle", "Catholic")))

CohortsData3 <- bind_rows(CohortsData31, CohortsData32,
                          CohortsData33, CohortsData34)
rm(CohortsData31, CohortsData32, CohortsData33, CohortsData34)

CohortsData3 %<>% mutate(cohort = as.factor(case_when(cohort == 1 ~ "15-24",
                                                      cohort == 2 ~  "25-34",
                                                      cohort == 3 ~  "35-44",
                                                      cohort == 4 ~  "45-54",
                                                      cohort == 5 ~  "55-64",
                                                      cohort == 6 ~ "65+")))



Cohort2Cult <- CohortsData3 %>% subset(domain == "Cultural")
Cohort2Econ <- CohortsData3 %>% subset(domain == "Economic")

T1b <- lmer(cor ~ cohort + round + cohort*round*DD + (1|Country), data = Cohort2Cult)

new_data3 <- expand.grid(
  cohort = unique(Cohort2Cult$cohort),
  round = unique(Cohort2Cult$round),
  DD = unique(Cohort2Cult$DD),
  Country = unique(Cohort2Cult$Country)
)

pred <- predict(T1b, newdata = new_data3, re.form = NA, se.fit = TRUE)
new_data3$predicted <- pred$fit
new_data3$se.fit <- pred$se.fit
new_data3 <- new_data3 %>%
  mutate(
    lower = predicted - 1.96 * se.fit,
    upper = predicted + 1.96 * se.fit
  )

svg("Figures/IP Cohorts2.svg", height = 4, width = 8, family = "cmr10")
ggplot(new_data3 |> filter(round == "2017" | round == "1990") |> filter(!DD == "middle"), aes(x = cohort, y = predicted, color = round)) +
  geom_point(size = 2) +
  geom_line(aes(y = predicted, group = round), size = .9) +
  geom_ribbon(aes(ymin = lower, ymax = upper, group = round, fill = round), alpha = 0.2) +
  facet_wrap(~DD) +
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









#####
#Cohort Analysis
#####

#reverse code so higher values reflect more liberal attitudes
EVSBirth <- EVS_Trendfile %>% mutate(E035 = -1*E035 + 11)


#reducing the dataset to studied variables
EVSBirth %<>% dplyr::select("E035", "E036", "E037", "E038", "E039", "E042", "F118", "F119", "F120",
                          "F121", "F122", "F123", "F126", "F132", "F144_01", "F028", "S002EVS", "X002", "COW_NUM")

EVSB1 <- EVSBirth %>% subset(X002 > 1934 & X002 < 1945)
EVSB2 <- EVSBirth %>% subset(X002 > 1944 & X002 < 1955)
EVSB3 <- EVSBirth %>% subset(X002 > 1954 & X002 < 1965)
EVSB4 <- EVSBirth %>% subset(X002 > 1964 & X002 < 1975)
EVSB5 <- EVSBirth %>% subset(X002 > 1974 & X002 < 1985)
EVSB6 <- EVSBirth %>% subset(X002 > 1984 & X002 < 1995)


##############
#Cohort1

#Creating dataset
#Round 2
res2_205 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 205) %>% dplyr::select(E035:F144_01)))
res2_210 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res2_211 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 211) %>% dplyr::select(E035:F144_01)))
res2_220 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res2_230 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res2_235 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res2_255 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res2_290 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res2_305 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res2_310 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res2_316 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res2_317 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res2_325 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res2_338 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 338) %>% dplyr::select(E035:F144_01)))
res2_375 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res2_380 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res2_385 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))
res2_390 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res2_395 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))

#Round 3
res3_205 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 205) %>% dplyr::select(E035:F144_01)))
res3_210 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res3_211 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 211) %>% dplyr::select(E035:F144_01)))
res3_220 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res3_230 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res3_235 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res3_255 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res3_290 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res3_305 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res3_310 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res3_316 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res3_317 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res3_325 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res3_338 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 338) %>% dplyr::select(E035:F144_01)))
res3_375 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res3_380 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res3_390 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res3_395 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))

#Round 4
res4_205 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 205) %>% dplyr::select(E035:F144_01)))
res4_210 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res4_211 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 211) %>% dplyr::select(E035:F144_01)))
res4_220 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res4_230 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res4_235 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res4_255 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res4_290 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res4_305 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res4_310 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res4_316 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res4_317 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res4_325 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res4_338 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 338) %>% dplyr::select(E035:F144_01)))
res4_375 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res4_380 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res4_390 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res4_395 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))
res4_385 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))

#Round 5
res5_210 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res5_220 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res5_230 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res5_235 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res5_255 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res5_290 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res5_305 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res5_310 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res5_316 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res5_317 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res5_325 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res5_375 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res5_380 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res5_390 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res5_395 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))
res5_385 <- rcorr(as.matrix(EVSB1 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))

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
CohortB1_IsAl <- bind_rows(df2_205, df2_210, df2_211, df2_220, df2_230, df2_235, df2_255, df2_290,
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

CohortB1_IsAlD <- CohortB1_IsAl %>% mutate(domain = case_when((row %in% Cultural) & (column %in% Cultural) ~ "Cultural",
                                                            (row %in% Economic) & (column %in% Economic) ~ "Economic",
                                                            TRUE ~ "Across Domains"))

CohortB1_IsAlC <- CohortB1_IsAlD %>% unite("issue", row:column, remove = FALSE, sep = "-") %>% dplyr::select("issue", "cor", "domain", "round", "Country")


##############
#Cohort2

#Creating dataset
#Round 2
res2_205 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 205) %>% dplyr::select(E035:F144_01)))
res2_210 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res2_211 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 211) %>% dplyr::select(E035:F144_01)))
res2_220 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res2_230 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res2_235 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res2_255 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res2_290 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res2_305 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res2_310 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res2_316 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res2_317 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res2_325 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res2_338 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 338) %>% dplyr::select(E035:F144_01)))
res2_375 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res2_380 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res2_385 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))
res2_390 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res2_395 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))

#Round 3
res3_205 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 205) %>% dplyr::select(E035:F144_01)))
res3_210 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res3_211 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 211) %>% dplyr::select(E035:F144_01)))
res3_220 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res3_230 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res3_235 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res3_255 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res3_290 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res3_305 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res3_310 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res3_316 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res3_317 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res3_325 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res3_338 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 338) %>% dplyr::select(E035:F144_01)))
res3_375 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res3_380 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res3_390 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res3_395 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))

#Round 4
res4_205 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 205) %>% dplyr::select(E035:F144_01)))
res4_210 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res4_211 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 211) %>% dplyr::select(E035:F144_01)))
res4_220 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res4_230 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res4_235 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res4_255 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res4_290 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res4_305 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res4_310 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res4_316 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res4_317 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res4_325 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res4_338 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 338) %>% dplyr::select(E035:F144_01)))
res4_375 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res4_380 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res4_390 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res4_395 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))
res4_385 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))

#Round 5
res5_210 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res5_220 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res5_230 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res5_235 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res5_255 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res5_290 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res5_305 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res5_310 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res5_316 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res5_317 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res5_325 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res5_375 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res5_380 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res5_390 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res5_395 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))
res5_385 <- rcorr(as.matrix(EVSB2 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))

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
CohortB2_IsAl <- bind_rows(df2_205, df2_210, df2_211, df2_220, df2_230, df2_235, df2_255, df2_290,
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

CohortB2_IsAlD <- CohortB2_IsAl %>% mutate(domain = case_when((row %in% Cultural) & (column %in% Cultural) ~ "Cultural",
                                                            (row %in% Economic) & (column %in% Economic) ~ "Economic",
                                                            TRUE ~ "Across Domains"))

CohortB2_IsAlC <- CohortB2_IsAlD %>% unite("issue", row:column, remove = FALSE, sep = "-") %>% dplyr::select("issue", "cor", "domain", "round", "Country")

rm(CohortB2_IsAlD, CohortB2_IsAl)


##############
#Cohort3

#Creating dataset
#Round 2
res2_205 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 205) %>% dplyr::select(E035:F144_01)))
res2_210 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res2_211 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 211) %>% dplyr::select(E035:F144_01)))
res2_220 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res2_230 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res2_235 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res2_255 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res2_290 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res2_305 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res2_310 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res2_316 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res2_317 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res2_325 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res2_338 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 338) %>% dplyr::select(E035:F144_01)))
res2_375 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res2_380 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res2_385 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))
res2_390 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res2_395 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))

#Round 3
res3_205 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 205) %>% dplyr::select(E035:F144_01)))
res3_210 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res3_211 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 211) %>% dplyr::select(E035:F144_01)))
res3_220 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res3_230 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res3_235 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res3_255 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res3_290 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res3_305 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res3_310 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res3_316 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res3_317 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res3_325 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res3_338 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 338) %>% dplyr::select(E035:F144_01)))
res3_375 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res3_380 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res3_390 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res3_395 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))

#Round 4
res4_205 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 205) %>% dplyr::select(E035:F144_01)))
res4_210 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res4_211 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 211) %>% dplyr::select(E035:F144_01)))
res4_220 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res4_230 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res4_235 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res4_255 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res4_290 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res4_305 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res4_310 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res4_316 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res4_317 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res4_325 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res4_338 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 338) %>% dplyr::select(E035:F144_01)))
res4_375 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res4_380 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res4_390 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res4_395 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))
res4_385 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))

#Round 5
res5_210 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res5_220 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res5_230 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res5_235 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res5_255 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res5_290 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res5_305 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res5_310 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res5_316 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res5_317 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res5_325 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res5_375 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res5_380 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res5_390 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res5_395 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))
res5_385 <- rcorr(as.matrix(EVSB3 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))

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
CohortB3_IsAl <- bind_rows(df2_205, df2_210, df2_211, df2_220, df2_230, df2_235, df2_255, df2_290,
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

CohortB3_IsAlD <- CohortB3_IsAl %>% mutate(domain = case_when((row %in% Cultural) & (column %in% Cultural) ~ "Cultural",
                                                            (row %in% Economic) & (column %in% Economic) ~ "Economic",
                                                            TRUE ~ "Across Domains"))

CohortB3_IsAlC <- CohortB3_IsAlD %>% unite("issue", row:column, remove = FALSE, sep = "-") %>% dplyr::select("issue", "cor", "domain", "round", "Country")

rm(CohortB3_IsAlD, CohortB3_IsAl)


##############
#Cohort4

#Creating dataset
#Round 2
res2_205 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 205) %>% dplyr::select(E035:F144_01)))
res2_210 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res2_211 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 211) %>% dplyr::select(E035:F144_01)))
res2_220 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res2_230 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res2_235 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res2_255 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res2_290 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res2_305 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res2_310 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res2_316 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res2_317 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res2_325 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res2_338 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 338) %>% dplyr::select(E035:F144_01)))
res2_375 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res2_380 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res2_385 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))
res2_390 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res2_395 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 2) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))

#Round 3
res3_205 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 205) %>% dplyr::select(E035:F144_01)))
res3_210 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res3_211 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 211) %>% dplyr::select(E035:F144_01)))
res3_220 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res3_230 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res3_235 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res3_255 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res3_290 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res3_305 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res3_310 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res3_316 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res3_317 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res3_325 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res3_338 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 338) %>% dplyr::select(E035:F144_01)))
res3_375 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res3_380 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res3_390 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res3_395 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))

#Round 4
res4_205 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 205) %>% dplyr::select(E035:F144_01)))
res4_210 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res4_211 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 211) %>% dplyr::select(E035:F144_01)))
res4_220 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res4_230 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res4_235 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res4_255 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res4_290 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res4_305 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res4_310 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res4_316 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res4_317 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res4_325 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res4_338 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 338) %>% dplyr::select(E035:F144_01)))
res4_375 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res4_380 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res4_390 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res4_395 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))
res4_385 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))

#Round 5
res5_210 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res5_220 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res5_230 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res5_235 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res5_255 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res5_290 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res5_305 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res5_310 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res5_316 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res5_317 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res5_325 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res5_375 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res5_380 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res5_390 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res5_395 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))
res5_385 <- rcorr(as.matrix(EVSB4 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))

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
CohortB4_IsAl <- bind_rows(df2_205, df2_210, df2_211, df2_220, df2_230, df2_235, df2_255, df2_290,
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

CohortB4_IsAlD <- CohortB4_IsAl %>% mutate(domain = case_when((row %in% Cultural) & (column %in% Cultural) ~ "Cultural",
                                                            (row %in% Economic) & (column %in% Economic) ~ "Economic",
                                                            TRUE ~ "Across Domains"))

CohortB4_IsAlC <- CohortB4_IsAlD %>% unite("issue", row:column, remove = FALSE, sep = "-") %>% dplyr::select("issue", "cor", "domain", "round", "Country")

rm(CohortB4_IsAlD, CohortB4_IsAl)


##############
#Cohort5

#Creating dataset
#Round 3
res3_205 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 205) %>% dplyr::select(E035:F144_01)))
res3_210 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res3_211 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 211) %>% dplyr::select(E035:F144_01)))
res3_220 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res3_230 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res3_235 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res3_255 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res3_290 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res3_305 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res3_310 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res3_316 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res3_317 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res3_325 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res3_338 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 338) %>% dplyr::select(E035:F144_01)))
res3_375 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res3_380 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res3_390 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res3_395 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 3) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))

#Round 4
res4_205 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 205) %>% dplyr::select(E035:F144_01)))
res4_210 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res4_211 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 211) %>% dplyr::select(E035:F144_01)))
res4_220 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res4_230 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res4_235 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res4_255 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res4_290 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res4_305 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res4_310 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res4_316 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res4_317 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res4_325 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res4_338 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 338) %>% dplyr::select(E035:F144_01)))
res4_375 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res4_380 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res4_390 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res4_395 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))
res4_385 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))

#Round 5
res5_210 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res5_220 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res5_230 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res5_235 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res5_255 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res5_290 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res5_305 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res5_310 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res5_316 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res5_317 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res5_325 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res5_375 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res5_380 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res5_390 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res5_395 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))
res5_385 <- rcorr(as.matrix(EVSB5 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))

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
CohortB5_IsAl <- bind_rows(df3_205, df3_210, df3_211, df3_220, df3_230,
                          df3_235, df3_255, df3_290, df3_305, df3_310, df3_316, df3_317, df3_325,
                          df3_338, df3_375, df3_380, df3_390, df3_395, df4_205, df4_210, df4_211,
                          df4_220, df4_230, df4_235, df4_255, df4_290, df4_305, df4_310, df4_316,
                          df4_317, df4_325, df4_338, df4_375, df4_380, df4_390, df4_395, df4_385,
                          df5_210, df5_220, df5_230, df5_235, df5_255, df5_290, df5_305, df5_310, df5_316,
                          df5_317, df5_325, df5_375, df5_380, df5_390, df5_395, df5_385, .id = NULL)

rm(df3_205, df3_210, df3_211, df3_220, df3_230,
   df3_235, df3_255, df3_290, df3_305, df3_310, df3_316, df3_317, df3_325,
   df3_338, df3_375, df3_380, df3_390, df3_395, df4_205, df4_210, df4_211,
   df4_220, df4_230, df4_235, df4_255, df4_290, df4_305, df4_310, df4_316,
   df4_317, df4_325, df4_338, df4_375, df4_380, df4_390, df4_395, df4_385,
   df5_210, df5_220, df5_230, df5_235, df5_255, df5_290, df5_305, df5_310, df5_316,
   df5_317, df5_325, df5_375, df5_380, df5_390, df5_395, df5_385)

rm(res3_205, res3_210, res3_211, res3_220, res3_230,
   res3_235, res3_255, res3_290, res3_305, res3_310, res3_316, res3_317, res3_325,
   res3_338, res3_375, res3_380, res3_390, res3_395, res4_205, res4_210, res4_211,
   res4_220, res4_230, res4_235, res4_255, res4_290, res4_305, res4_310, res4_316,
   res4_317, res4_325, res4_338, res4_375, res4_380, res4_390, res4_395, res4_385,
   res5_210, res5_220, res5_230, res5_235, res5_255, res5_290, res5_305, res5_310, res5_316,
   res5_317, res5_325, res5_375, res5_380, res5_390, res5_395, res5_385)

CohortB5_IsAlD <- CohortB5_IsAl %>% mutate(domain = case_when((row %in% Cultural) & (column %in% Cultural) ~ "Cultural",
                                                            (row %in% Economic) & (column %in% Economic) ~ "Economic",
                                                            TRUE ~ "Across Domains"))

CohortB5_IsAlC <- CohortB5_IsAlD %>% unite("issue", row:column, remove = FALSE, sep = "-") %>% dplyr::select("issue", "cor", "domain", "round", "Country")

rm(CohortB5_IsAlD, CohortB5_IsAl)


##############
#Cohort6

#Creating dataset

#Round 4
res4_205 <- rcorr(as.matrix(EVSB6 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 205) %>% dplyr::select(E035:F144_01)))
res4_210 <- rcorr(as.matrix(EVSB6 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res4_211 <- rcorr(as.matrix(EVSB6 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 211) %>% dplyr::select(E035:F144_01)))
res4_220 <- rcorr(as.matrix(EVSB6 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res4_230 <- rcorr(as.matrix(EVSB6 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res4_235 <- rcorr(as.matrix(EVSB6 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res4_255 <- rcorr(as.matrix(EVSB6 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res4_290 <- rcorr(as.matrix(EVSB6 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res4_305 <- rcorr(as.matrix(EVSB6 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res4_310 <- rcorr(as.matrix(EVSB6 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res4_316 <- rcorr(as.matrix(EVSB6 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res4_317 <- rcorr(as.matrix(EVSB6 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res4_325 <- rcorr(as.matrix(EVSB6 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res4_338 <- rcorr(as.matrix(EVSB6 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 338) %>% dplyr::select(E035:F144_01)))
res4_375 <- rcorr(as.matrix(EVSB6 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res4_380 <- rcorr(as.matrix(EVSB6 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res4_390 <- rcorr(as.matrix(EVSB6 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res4_395 <- rcorr(as.matrix(EVSB6 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))
res4_385 <- rcorr(as.matrix(EVSB6 %>% filter(S002EVS == 4) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))

#Round 5
res5_210 <- rcorr(as.matrix(EVSB6 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 210) %>% dplyr::select(E035:F144_01)))
res5_220 <- rcorr(as.matrix(EVSB6 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 220) %>% dplyr::select(E035:F144_01)))
res5_230 <- rcorr(as.matrix(EVSB6 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 230) %>% dplyr::select(E035:F144_01)))
res5_235 <- rcorr(as.matrix(EVSB6 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 235) %>% dplyr::select(E035:F144_01)))
res5_255 <- rcorr(as.matrix(EVSB6 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 255) %>% dplyr::select(E035:F144_01)))
res5_290 <- rcorr(as.matrix(EVSB6 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 290) %>% dplyr::select(E035:F144_01)))
res5_305 <- rcorr(as.matrix(EVSB6 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 305) %>% dplyr::select(E035:F144_01)))
res5_310 <- rcorr(as.matrix(EVSB6 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 310) %>% dplyr::select(E035:F144_01)))
res5_316 <- rcorr(as.matrix(EVSB6 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 316) %>% dplyr::select(E035:F144_01)))
res5_317 <- rcorr(as.matrix(EVSB6 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 317) %>% dplyr::select(E035:F144_01)))
res5_325 <- rcorr(as.matrix(EVSB6 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 325) %>% dplyr::select(E035:F144_01)))
res5_375 <- rcorr(as.matrix(EVSB6 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 375) %>% dplyr::select(E035:F144_01)))
res5_380 <- rcorr(as.matrix(EVSB6 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 380) %>% dplyr::select(E035:F144_01)))
res5_390 <- rcorr(as.matrix(EVSB6 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 390) %>% dplyr::select(E035:F144_01)))
res5_395 <- rcorr(as.matrix(EVSB6 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 395) %>% dplyr::select(E035:F144_01)))
res5_385 <- rcorr(as.matrix(EVSB6 %>% filter(S002EVS == 5) %>% filter(COW_NUM == 385) %>% dplyr::select(E035:F144_01)))

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
CohortB6_IsAl <- bind_rows(df4_205, df4_210, df4_211,
                          df4_220, df4_230, df4_235, df4_255, df4_290, df4_305, df4_310, df4_316,
                          df4_317, df4_325, df4_338, df4_375, df4_380, df4_390, df4_395, df4_385,
                          df5_210, df5_220, df5_230, df5_235, df5_255, df5_290, df5_305, df5_310, df5_316,
                          df5_317, df5_325, df5_375, df5_380, df5_390, df5_395, df5_385, .id = NULL)

rm(df4_205, df4_210, df4_211,
   df4_220, df4_230, df4_235, df4_255, df4_290, df4_305, df4_310, df4_316,
   df4_317, df4_325, df4_338, df4_375, df4_380, df4_390, df4_395, df4_385,
   df5_210, df5_220, df5_230, df5_235, df5_255, df5_290, df5_305, df5_310, df5_316,
   df5_317, df5_325, df5_375, df5_380, df5_390, df5_395, df5_385)

rm(res4_205, res4_210, res4_211,
   res4_220, res4_230, res4_235, res4_255, res4_290, res4_305, res4_310, res4_316,
   res4_317, res4_325, res4_338, res4_375, res4_380, res4_390, res4_395, res4_385,
   res5_210, res5_220, res5_230, res5_235, res5_255, res5_290, res5_305, res5_310, res5_316,
   res5_317, res5_325, res5_375, res5_380, res5_390, res5_395, res5_385)

CohortB6_IsAlD <- CohortB6_IsAl %>% mutate(domain = case_when((row %in% Cultural) & (column %in% Cultural) ~ "Cultural",
                                                            (row %in% Economic) & (column %in% Economic) ~ "Economic",
                                                            TRUE ~ "Across Domains"))

CohortB6_IsAlC <- CohortB6_IsAlD %>% unite("issue", row:column, remove = FALSE, sep = "-") %>% dplyr::select("issue", "cor", "domain", "round", "Country")

rm(CohortB6_IsAlD, CohortB6_IsAl)


CohortB1_IsAlC %<>% mutate(birthyear = 1)
CohortB2_IsAlC %<>% mutate(birthyear = 2)
CohortB3_IsAlC %<>% mutate(birthyear = 3)
CohortB4_IsAlC %<>% mutate(birthyear = 4)
CohortB5_IsAlC %<>% mutate(birthyear = 5)
CohortB6_IsAlC %<>% mutate(birthyear = 6)

CohortsBData <- bind_rows(CohortB1_IsAlC, CohortB2_IsAlC, CohortB3_IsAlC, CohortB4_IsAlC, CohortB5_IsAlC, CohortB6_IsAlC)
rm(CohortB1_IsAlC, CohortB2_IsAlC, CohortB3_IsAlC, CohortB4_IsAlC, CohortB5_IsAlC, CohortB6_IsAlC)

CohortsBData %<>% filter(domain != "Across Domains")
CohortsBData <- CohortsBData %>% mutate(round = as.character(round))
CohortsBData$round <- ordered(CohortsBData$round,
                             levels = c(2,3,4,5),
                             labels = c("1990", "1999", "2008", "2017"))

CohortsBData <- CohortsBData %>% mutate(birthyear = as.character(birthyear))
CohortsBData$birthyear <- ordered(CohortsBData$birthyear,
                              levels = c(1,2,3,4,5,6),
                              labels = c("1935-44", "1945-54", "1955-64", "1965-74",
                                         "1975-84", "1985-94"))


CohortsBData2 <- merge(CohortsBData, HDIData2, by = c("Country", "round"))
CohortsBData2 <-  merge(CohortsBData2, denom_data, by = c("Country"))

CohortsBData21 <- CohortsBData2 %>% subset(round == "1990") %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
CohortsBData22 <- CohortsBData2 %>% subset(round == "1999") %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
CohortsBData23 <- CohortsBData2 %>% subset(round == "2008") %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
CohortsBData24 <- CohortsBData2 %>% subset(round == "2017") %>% mutate(HDI = cut(HDI, 3, labels = c("lowest", "middle", "highest")))
CohortsBData2 <- bind_rows(CohortsBData21, CohortsBData22, CohortsBData23, CohortsBData24)
rm(CohortsBData21, CohortsBData22, CohortsBData23, CohortsBData24)


CohortsBData31 <- CohortsBData2 %>% subset(round == "1990") %>% mutate(DD = cut(DD, 3, labels = c("Protestant", "middle", "Catholic")))
CohortsBData32 <- CohortsBData2 %>% subset(round == "1999") %>% mutate(DD = cut(DD, 3, labels = c("Protestant", "middle", "Catholic")))
CohortsBData33 <- CohortsBData2 %>% subset(round == "2008") %>% mutate(DD = cut(DD, 3, labels = c("Protestant", "middle", "Catholic")))
CohortsBData34 <- CohortsBData2 %>% subset(round == "2017") %>% mutate(DD = cut(DD, 3, labels = c("Protestant", "middle", "Catholic")))

CohortsBData2 <- bind_rows(CohortsBData31, CohortsBData32,
                          CohortsBData33, CohortsBData34)
rm(CohortsBData31, CohortsBData32, CohortsBData33, CohortsBData34)


CohBCult <- CohortsBData2 %>% subset(domain == "Cultural")
CohBEcon <- CohortsBData2 %>% subset(domain == "Economic")

T2a <- lmer(cor ~ birthyear + round + birthyear*round*HDI + (1|Country), data = CohBCult)

#summary(T2a)

new_data4 <- CohBCult %>%
  select(birthyear, round, HDI, Country) %>%
  distinct()


pred <- predict(T2a, newdata = new_data4, re.form = NA, se.fit = TRUE)
new_data4$predicted <- pred$fit
new_data4$se.fit <- pred$se.fit
new_data4 <- new_data4 %>%
  mutate(
    lower = predicted - 1.96 * se.fit,
    upper = predicted + 1.96 * se.fit
  )

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
  #scale_color_manual(values = c("2017" = "navy", "1990" = "firebrick4")) +
 # scale_fill_manual(values = c("2017" = "navy", "1990" = "firebrick4")) +
  theme_minimal() +
  scale_x_discrete(limits = levels(CohBCult$round))+
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




T2b <- lmer(cor ~ birthyear + round + birthyear*round*DD + (1|Country), data = CohBCult)

#summary(T2a)

new_data5 <- CohBCult %>%
  select(birthyear, round, DD, Country) %>%
  distinct()


pred <- predict(T2b, newdata = new_data5, re.form = NA, se.fit = TRUE)
new_data5$predicted <- pred$fit
new_data5$se.fit <- pred$se.fit
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
  #scale_color_manual(values = c("2017" = "navy", "1990" = "firebrick4")) +
  # scale_fill_manual(values = c("2017" = "navy", "1990" = "firebrick4")) +
  theme_minimal() +
  scale_x_discrete(limits = levels(CohBCult$round))+
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

