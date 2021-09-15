#analysis.R
library(dplyr)
library(data.table)

#adding Verhaltensdaten.txt to R
data <- read.table ("~/Desktop/Gittest/Analysis_ElianePflugi/Verhaltensdaten.txt", sep="\t", header = TRUE)

data
count(data)

#removing participants with "remove" in subject filter
data2 <- data [!(data$subject_filter=="remove"),]
count(data2)
data2

#cristinas R code
library(dplyr)library(data.table)  df1=fread("Verhaltensdaten.txt")df1count(df1)df2<-df1[!(df1$subject_filter=="remove"),]count(df2)

#9 correlation Testosterone T1 and T2
?cor()
c1 <-cor(data2$Tes_A1, data2$Tes_B1,  use="pairwise")
c1
cor.test(data2$Tes_A1, data2$Tes_B1)

#9 correlation of d2 peerformance on  T1 and T2
c2 <- cor(data2$D2_KL_Tag1, data2$D2_KL_Tag2, use="pairwise")
c2
cor.test(data2$D2_KL_Tag1, data2$D2_KL_Tag2) 

#10 calculating the correlations for word recall performance and all other variables
cor(data2$words_hit_IR, data2[,c("words_hit_SD", "D2_KL_Tag1", "mac_2b_s1", "iaps_hit_SD_day1", "mrt_0b_s1", "pos1_ar_mean")], use="pairwise")
#the correlation with attention is higher than the correlation with memory

cor(data2$words_hit_SD, data2[,c("words_hit_IR", "D2_KL_Tag1", "mac_2b_s1", "iaps_hit_SD_day1", "mrt_0b_s1", "pos1_ar_mean")], use="pairwise")
#the correlation with attention is lower than the correlation with memory

#11 gender differences in testosterone levels calculating a t Test. 
?t.test()
t.test(data2$Tes_A1 ~ data2$Sex)


#12 calculate the mean performance in tests e.g. d2
####requires calculating the mean of rows
####requires asking google for help
?rowMeans()

#mean value of d2 from two different days
data2$D2_mean <- rowMeans(data2[,c("D2_KL_Tag1", "D2_KL_Tag2")])

#mean recalled words from two different time spans
data2$words_mean <- rowMeans(data2[,c("words_hit_IR", "words_hit_SD")])

#mean of episodic memory performance on two different days
data2$iaps_hit_SD_mean <- rowMeans(data2[,c("iaps_hit_SD_day1", "iaps_hit_SD_day2")])

#running statistical analysis with regards to my hypothesis
####Hypothesis 1: there is a gender difference in the working memory performance in favor of women
t.test(data2$iaps_hit_SD_mean ~ data2$Sex)

####Hypothesis 2: there is a gender difference in the recollection of words in favor of women
t.test(data2$words_mean ~data2$sex)