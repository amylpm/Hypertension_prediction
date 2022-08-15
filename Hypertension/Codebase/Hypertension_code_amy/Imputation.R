install.packages('imputeTS')
library('imputeTS')
library(tidyverse)
library(tsibble)
library(TSstudio)
setwd('C:/Users/User/Documents/GitHub/Hypertension_prediction/Hypertension/Codebase/Hypertension_code_amy/Output')

df <- read.csv("./missing_value_imputed/p9690_missing.csv")
df[['Timestamp']] <- strptime(df[['Timestamp']],format = "%Y-%m-%d %H:%M:%S")

#first seperate into subsets of systolic, diastolic and heart rate
ts9690_s = df[c(1,3)]
ts9690_d = df[c(1,4)]
ts9690_hr = df[c(1,5)]

#create time series
str(ts9690_s)
ts9690_s %>% as_tsibble(index = Timestamp)
ts9690_d %>% as_tsibble(index = Timestamp)
ts9690_hr %>% as_tsibble(index = Timestamp)
ts9690_s %>% as.ts()
ts9690_d %>% as.ts()
ts9690_hr %>% as.ts()

#create 70 30 train test 
split<- seq_len(length.out = floor(x = 0.7 * nrow(x = df)))

ts9690_s_train = ts9690_s[split,]
ts9690_s_test =ts9690_s[-split,]

ts9690_d_train = ts9690_d[split,]
ts9690_d_test =ts9690_d[-split,]

ts9690_hr_train = ts9690_d[split,]
ts9690_hr_test =ts9690_d[-split,]

plot(ts9690_s)
statsNA(ts9690_s_train)

ggplot_na_distribution(ts9690_s_train)
ggplot_na_intervals(ts9690_s)
ggplot_na_gapsize(ts9690_s)

x =na_interpolation(ts9690_s,option = 'stine')
ggplot_na_imputations(ts9690_s,x)
y =na_kalman(ts9690_s)
ggplot_na_imputations(ts9690_s,y)
z =na_locf(ts9690_s)

ggplot_na_imputations(ts9690_s,y)
