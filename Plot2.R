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

##creating Plot2
#Using with so I can referencing using the names themselves
with(dataSubset, plot(newDateTime, Global_active_power, ylab="Global Active Power (killowatts)", xlab="", type="l"))
dev.copy(device = png, "Plot2.png")
dev.off()