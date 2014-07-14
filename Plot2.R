setwd("c:/coursera")
fileToRead <- "c:/coursera/household_power_consumption.txt"
myData <- read.table(fileToRead, header = TRUE, sep = ';', nrows = 52000)



##(adding skip causes to lose the header names)
myData <- read.table(fileToRead, header = TRUE, sep = ';', nrows = 1)
names <- colnames(myData)

##now reasing the subset by skipping
myData <- read.table(fileToRead, header = TRUE, sep = ';', skip = 66638,  nrows = (69518 - 66638) )
colnames(myData) <- names

##combining the date and time together
myDate <- paste(myData[ , 1] , myData[ ,2])
newDate <- as.Date(strptime(myDate, "%d/%m/%Y %H:%M:%S"))
plot(newDate, myData[ , 3], xlab = "", ylab = "Global Active Power (kilowats)", pch = 20, main = "")


dev.copy(device = png, "Plot2.png")
dev.off()