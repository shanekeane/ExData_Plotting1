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
png("plot2.png")
plot(power_con$DateTime, power_con$Global_active_power, 
     type = 'l', xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()