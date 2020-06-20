#This creates the second assignment plot
library(data.table)
library(dplyr)
library(lubridate)

##Reads file and limits to relevant dates
power_con <- fread("household_power_consumption.txt")
power_con <- filter(power_con, Date == "1/2/2007" | Date == "2/2/2007")

##Creates datetime variable
power_con$DateTime <- dmy_hms(paste(power_con$Date, power_con$Time))

##Create image
png("plot3.png")
plot(power_con$DateTime, power_con$Sub_metering_1, type = 'n',
     xlab = "", ylab = "Energy sub metering")
points(power_con$DateTime, power_con$Sub_metering_1, type = 'l')
points(power_con$DateTime, power_con$Sub_metering_2, col = "red", type = 'l')
points(power_con$DateTime, power_con$Sub_metering_3, col = "blue", type = 'l')
legend("topright", col = c("black", "red", "blue"), lty = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()