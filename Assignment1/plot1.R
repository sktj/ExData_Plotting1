## Set working Directory

setwd("C:\\Users\\sktj\\ExData_Plotting1\\Assignment1")

## Loading data

hpc <- read.table("C:\\Users\\sktj\\Documents\\Data\\household_power_consumption.txt", sep=";", na.strings = "?", header = TRUE,  stringsAsFactors = FALSE)

## Converting to date format

hpc$Datetime <- paste(hpc$Date,hpc$Time)
hpc$Datetime <- strptime(hpc$Datetime, "%d/%m/%Y %H:%M:%S")

## using data from the dates 2007-02-01 and 2007-02-02 only

hpc2day <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")

## Constructing the plot and saving it to a PNG file with a width of 480 pixels and a height of 480 pixels.

png(file = "plot1.png",height=480, width=480)

with(hpc2day, hist(Global_active_power, col = "red", main = "Global Active Power", ylab = "Frequency", xlab = "Global Active Power (kilowatts)"))

dev.off()