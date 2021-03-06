setwd("c:/coursera")
fileToRead <- "c:/coursera/household_power_consumption.txt"

##reading the file and formating the Date field to be a Date
myData <- read.table(fileToRead, header = TRUE, sep = ';', na.strings="?")
myData$Date <- as.Date(myData$Date, format='%d/%m/%Y')

##subsetting only the data that we need
dateLow <- as.Date('2007-02-01', format='%Y-%m-%d')
dateHigh <- as.Date('2007-02-02', format='%Y-%m-%d')
dataSubset <- subset(myData, Date == dateLow | Date == dateHigh)

##combining the date and time together
newDateTime <- paste(dataSubset[ , 1] , dataSubset[ ,2])
dataSubset$newDateTime <- strptime(newDateTime, "%Y-%m-%d %H:%M:%S")


##creating Plot4
par(mfrow=c(2,2))

with(dataSubset, plot(newDateTime, Global_active_power, ylab="Global Active Power", xlab="", type="l"))
with(dataSubset, plot(newDateTime, Voltage, ylab="Voltage", xlab="datetime", type="l"))

with(dataSubset, plot(newDateTime, Sub_metering_1, ylab="Energy sub metering", xlab="", type="n"))
with(dataSubset, lines(newDateTime, Sub_metering_1))
with(dataSubset, lines(newDateTime, Sub_metering_2, col="red"))
with(dataSubset, lines(newDateTime, Sub_metering_3, col="blue"))
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=1, col=c("black","red","blue"), bty="n")

with(dataSubset, plot(newDateTime, Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l"))
dev.copy(png, file="plot4.png")
dev.off()
