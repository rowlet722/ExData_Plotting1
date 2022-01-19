library(data.table)
library(dplyr)
library(lubridate)

df <- fread("household_power_consumption.txt")
df <- filter(df,dmy(Date) %in% ymd(c("2007-02-01","2007-02-02")))

t <- dmy_hms(paste(df$Date,df$Time))

png("plot2.png")
par(pin=c(5,5))
plot(t,df$Global_active_power,type = 'l',main = 'Global Active Power',xlab = 'Day',ylab = 'Global Active Power (kilowatts)')
dev.off()