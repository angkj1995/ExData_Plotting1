
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


#Save
png(file='plot1.png',width=480,height=480)
hist(df$Global_active_power,xlab='Global Active Power (kilowatts)',
     ylab='Frequency',col='red',main='Global Active Power')
dev.off()
