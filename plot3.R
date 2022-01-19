library(data.table)
library(dplyr)
library(lubridate)

df <- fread("household_power_consumption.txt")
df <- filter(df,dmy(Date) %in% ymd(c("2007-02-01","2007-02-02")))

t <- dmy_hms(paste(df$Date,df$Time))

png("plot3.png")
par(pin=c(5,5))
plot(t,df$Sub_metering_1,ylab = 'Energy sub metering',type = 'n',xlab = 'Day')
lines(t,df$Sub_metering_1)
lines(t,df$Sub_metering_2,col = 'red')
lines(t,df$Sub_metering_3,col = 'blue')
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = 1,col = c("black","red","blue"))
dev.off()