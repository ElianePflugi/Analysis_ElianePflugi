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
