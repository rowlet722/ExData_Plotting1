library(data.table)
library(dplyr)
library(lubridate)

df <- fread("household_power_consumption.txt")
df <- filter(df,dmy(Date) %in% ymd(c("2007-02-01","2007-02-02")))

png("plot1.png")
par(pin = c(5,5))
hist(as.numeric(df$Global_active_power),col='red',main = 'Global Active Power',xlab = 'Global Active Power (kilowatts)',ylab = 'Frequency')
axis(2,at = c(200,400,600,800,1000,1200))
dev.off()