setwd("c:/coursera")
fileToRead <- "c:/coursera/household_power_consumption.txt"

##reading the file and formating the Date field to be a Date
myData <- read.table(fileToRead, header = TRUE, sep = ';', na.strings="?")
myData$Date <- as.Date(myData$Date, format='%d/%m/%Y')

##subsetting only the data that we need
dateLow <- as.Date('2007-02-01', format='%Y-%m-%d')
dateHigh <- as.Date('2007-02-02', format='%Y-%m-%d')
dataSubset <- subset(myData, Date == dateLow | Date == dateHigh)

##creating Plot1
hist(dataSubset$Global_active_power, col = "red", xlab = "Global Active Power (kilowats)", main = "Global Active Power")
dev.copy(device = png, "Plot1.png")
dev.off()