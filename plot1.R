#This creates the first assignment plot
library(data.table)
library(dplyr)

##Reads file and limits to relevant dates
power_con <- fread("household_power_consumption.txt")
power_con$Date <- as.Date(power_con$Date, "%d/%m/%Y")
power_con <- filter(power_con, Date == as.Date('01/02/2007', "%d/%m/%Y") | 
                        Date == as.Date('02/02/2007', "%d/%m/%Y") )

##Create image
png("plot1.png")
hist(as.numeric(power_con$Global_active_power), 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", 
     main = "Global Active Power", 
     col = "red")
dev.off()