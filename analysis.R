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

c2 <- cor(data2$D2_KL_Tag1, data2$D2_KL_Tag2, use="pairwise")
c2
cor.test(data2$D2_KL_Tag1, data2$D2_KL_Tag2) 



