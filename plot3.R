# read in the data
power_consumption <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

# format the data
power_consumption$Date <- as.Date(power_consumption$Date, format="%d/%m/%Y")
power_consump_touse <- subset(power_consumption, Date >= "2007-02-01" & Date <= "2007-02-02")
datetime <- paste(power_consump_touse$Date, power_consump_touse$Time)
power_consump_touse$DateTime <- strptime(datetime, "%Y-%m-%d %H:%M:%S")

# make the plot
png("plot3.png", width=480, height=480, units="px")

plot(power_consump_touse$DateTime, power_consump_touse$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(power_consump_touse$DateTime, power_consump_touse$Sub_metering_2, col="red")
lines(power_consump_touse$DateTime, power_consump_touse$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
