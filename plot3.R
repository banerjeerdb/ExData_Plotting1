plot3 <- function(){
        ## Aim of this function is to 
        ## 1. read the household_power_consumption.txt file
        ## 2. subset for data taken from 2 days: 2007-02-01 and 2007-02-02
        ## 3. generate a plot of different submetering vs time
        
        dataFile <- "./data/household_power_consumption.txt"
		data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
		subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

		#str(subSetData)
		datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
		globalActivePower <- as.numeric(subSetData$Global_active_power)
		subMetering1 <- as.numeric(subSetData$Sub_metering_1)
		subMetering2 <- as.numeric(subSetData$Sub_metering_2)
		subMetering3 <- as.numeric(subSetData$Sub_metering_3)

		png("plot3.png", width=480, height=480)
		plot(datetime, subMetering1, type="l", xlab="Day", ylab="Energy sub metering")
		lines(datetime, subMetering2, type="l", col="red")
		lines(datetime, subMetering3, type="l", col="blue")
		legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
		dev.off()
}