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
png(file='plot4.png',width=480,height=480)

par(mfrow=c(2,2))

plot(df$Date2,df$Global_active_power,xlab='',ylab='Global Active Power',type='l')
plot(df$Date2,df$Voltage,xlab='datetime',ylab='Voltage',type='l')
plot(df$Date2,df$Sub_metering_1,type='n',xlab='',ylab='Global Active Power (kilowatts)')
with(df,lines(Date2,Sub_metering_1))
with(df,lines(Date2,Sub_metering_2,col='red'))
with(df,lines(Date2,Sub_metering_3,col='blue'))
legend('topright',col=c('black','red','blue'),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lty=c(1,1,1))
plot(df$Date2,df$Global_reactive_power,xlab='datetime',type='l')

dev.off()
