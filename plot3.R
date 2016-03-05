powerConsumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",
                               colClasses = c("character", "character",
                                              "numeric", "numeric", "numeric", "numeric",
                                              "numeric", "numeric", "numeric"))

powerConsumption$Time <- strptime(paste(powerConsumption$Date, powerConsumption$Time), format = "%d/%m/%Y %H:%M:%S")
powerConsumption$Date <- as.Date(powerConsumption$Date, format = "%d/%m/%Y")

startDate <- as.Date("2007-02-01")
endDate <- as.Date("2007-02-02")
twodays <- subset(powerConsumption, Date >= startDate & Date <= endDate)


par(mfrow = c(1, 1))

png(filename = "plot3.png", width = 480, height = 480)
with(twodays, { plot(Time, Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "")
                lines(Time, Sub_metering_2, col = "red")
                lines(Time, Sub_metering_3, col = "blue") })

legend("topright", lty = "solid", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()