library(data.table)
library(tidyverse)
library(lubridate)
df=fread('household_power_consumption.txt')

glimpse(df)
head(df)

#Data cleaning
df[,Global_active_power:=as.numeric(Global_active_power)]
df=df[Date %in% c('1/2/2007','2/2/2007')]
df[,Date:=dmy(Date)]
df[,Date2:=ymd_hms(paste0(Date,' ',Time))]

#Save
png(file='plot2.png',width=480,height=480)
with(df,plot(Date2,Global_active_power,type='l',xlab='',ylab='Global Active Power (kilowatts)'))

dev.off()
