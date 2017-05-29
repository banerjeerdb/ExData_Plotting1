plot4 <- function() {
        ## Aim of this function is to 
        ## 1. read the household_power_consumption.txt file
        ## 2. subset for data taken from 2 days: 2007-02-01 and 2007-02-02
        ## 3. generate 4 plots in 1 space (GAP vs. time, Vol vs. time, submetering vs. time and GRP vs. time)
        
        dataFile <- "./data/household_power_consumption.txt"
		data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
		subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

		#str(subSetData)
		datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
		globalActivePower <- as.numeric(subSetData$Global_active_power)
		globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
		voltage <- as.numeric(subSetData$Voltage)
		subMetering1 <- as.numeric(subSetData$Sub_metering_1)
		subMetering2 <- as.numeric(subSetData$Sub_metering_2)
		subMetering3 <- as.numeric(subSetData$Sub_metering_3)


		png("plot4.png", width=480, height=480)
		par(mfrow = c(2, 2)) 

		plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

		plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

		plot(datetime, subMetering1, type="l", xlab="", ylab="Energy sub metering")
		lines(datetime, subMetering2, type="l", col="red")
		lines(datetime, subMetering3, type="l", col="blue")
		legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2, col=c("black", "red", "blue"), bty="o")

		plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

		dev.off()
}