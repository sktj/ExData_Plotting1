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

png(file = "plot4.png",height=480, width=480)

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(1, 0, 1, 1))
with(hpc2day, {
    plot(Datetime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
    plot(Datetime, Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
    plot(Datetime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
    lines(Datetime, Sub_metering_2,col = "red")
    lines(Datetime, Sub_metering_3,col = "blue")
    legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n", cex = 0.7)
    plot(Datetime, Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
})

dev.off()
