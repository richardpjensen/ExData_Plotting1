powerConsumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",
                               colClasses = c("character", "character",
                                              "numeric", "numeric", "numeric", "numeric",
                                              "numeric", "numeric", "numeric"))

powerConsumption$Time <- strptime(paste(powerConsumption$Date, powerConsumption$Time), format = "%d/%m/%Y %H:%M:%S")
powerConsumption$Date <- as.Date(powerConsumption$Date, format = "%d/%m/%Y")

startDate <- as.Date("2007-02-01")
endDate <- as.Date("2007-02-02")
twodays <- subset(powerConsumption, Date >= startDate & Date <= endDate)

png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

with(twodays, {
  plot(Time, Global_active_power, type="l", ylab = "Global Active Power", xlab = "")

  plot(Time, Voltage, type="l", xlab = "datetime")

  plot(Time, Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "")
  lines(Time, Sub_metering_2, col = "red")
  lines(Time, Sub_metering_3, col = "blue")
  legend("topright", lty = "solid", bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

  plot(Time, Global_reactive_power, type="l", xlab = "datetime") })

dev.off()