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

png(filename = "plot2.png", width = 480, height = 480)
with(twodays, plot(Time, Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()