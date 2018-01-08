library("data.table")
options(scipen = 999) #Turn off scientific notation

setwd("~/ExData_Plotting1")

#Read in data from file, subsets data for specified dates
DT <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

#Change Date Column to Date Type
DT[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

#Filter Dates for 2007-02-01 and 2007-02-02
DT <- DT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width=480, height=480)

## Plot 1
hist(DT[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()
