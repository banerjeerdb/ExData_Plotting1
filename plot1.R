plot1<- function(){
        ## Aim of this function is to 
        ## 1. read the household_power_consumption.txt file
        ## 2. subset for data taken from 2 days: 2007-02-01 and 2007-02-02
        ## 3. generate a histogram of global active power(kilowatts)
        
        dataFile <- "./data/household_power_consumption.txt"
		data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
		subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

		#str(subSetData)
		globalActivePower <- as.numeric(subSetData$Global_active_power)
		png("plot1.png", width=480, height=480)
		hist(globalActivePower, col="red", border="black", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
		dev.off()
}