setwd("c:/coursera")
fileToRead <- "c:/coursera/household_power_consumption.txt"
myData <- read.table(fileToRead, header = TRUE, sep = ';', nrows = 52000)



##(adding skip causes to lose the header names)
myData <- read.table(fileToRead, header = TRUE, sep = ';', nrows = 1)
names <- colnames(myData)

##now reasing the subset by skipping
myData <- read.table(fileToRead, header = TRUE, sep = ';', skip = 66638,  nrows = (69518 - 66638) )
colnames(myData) <- names

hist(myData[ ,3], col = "red", xlab = "Global Active Power (kilowats)", main = "Global Active Power")