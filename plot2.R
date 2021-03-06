library("data.table")
options(scipen = 999) #Turn off scientific notation

setwd("~/ExData_Plotting1")

#Reads in data from file then subsets data for specified dates
DT <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

# Making a POSIXct date capable of being filtered and graphed by time of day
DT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates for 2007-02-01 and 2007-02-02
DT <- DT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot2.png", width=480, height=480)

## Plot 2
plot(x = DT[, dateTime], y = DT[, Global_active_power], type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
