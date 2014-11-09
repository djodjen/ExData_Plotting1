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

##creating Plot3
#Using with so I can referencing using the names themselves
par(mfrow=c(1,1))
with(dataSubset, plot(newDateTime, Sub_metering_1, ylab="Energy sub metering", xlab="", type="n"))
with(dataSubset, lines(newDateTime, Sub_metering_1))
with(dataSubset, lines(newDateTime, Sub_metering_2, col="red"))
with(dataSubset, lines(newDateTime, Sub_metering_3, col="blue"))
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=1, col=c("black","red","blue"))
dev.copy(device = png, "Plot3.png")
dev.off()