library(data.table)
library(dplyr)
library(lubridate)

df <- fread("household_power_consumption.txt")
df <- filter(df,dmy(Date) %in% ymd(c("2007-02-01","2007-02-02")))

t <- dmy_hms(paste(df$Date,df$Time))

png("plot4.png")
par(mfrow = c(2,2), pin = c(2.5,2.5),mar = c(4,4,2,2))
plot(t,df$Global_active_power,xlab = 'datetime',ylab = 'Global Active Power',type = 'l')

plot(t,df$Voltage ,xlab = 'datetime',ylab = 'Voltage',type = 'l')

plot(t,df$Sub_metering_1,ylab = 'Energy sub metering',type = 'n',xlab = 'datetime')
lines(t,df$Sub_metering_1)
lines(t,df$Sub_metering_2,col = 'red')
lines(t,df$Sub_metering_3,col = 'blue')
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = 1,col = c("black","red","blue"))

plot(t,df$Global_reactive_power,xlab = 'datetime',ylab = 'Global Reactive Power',type = 'l')
dev.off()