# read in the data
power_consumption <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

# format the data
power_consumption$Date <- as.Date(power_consumption$Date, format="%d/%m/%Y")
power_consump_touse <- subset(power_consumption, Date >= "2007-02-01" & Date <= "2007-02-02")
datetime <- paste(power_consump_touse$Date, power_consump_touse$Time)
power_consump_touse$DateTime <- strptime(datetime, "%Y-%m-%d %H:%M:%S")

# make the plot
png("plot2.png", width=480, height=480, units="px")
plot(power_consump_touse$DateTime, power_consump_touse$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()