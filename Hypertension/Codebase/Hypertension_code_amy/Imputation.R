install.packages('imputeTS')
install.packages('readxl')
install.packages('ggplot2')
install.packages('dplyr')
install.packages('zoo')


library('ggplot2')
library("readxl")
library('imputeTS')
library(dplyr)
library(zoo)

df <- read_excel("C:/Users/User/Documents/GitHub/Hypertension_prediction/Hypertension/Codebase/Hypertension_code_amy/Mappings.xlsx")
df_grp_id = df %>% group_by(UserID) 
View(df_grp_id)



write.xlsx()