# This code is created by Luc van Schijndel for Course Project 1
# from the course 'Exploratory Data Analysis' by John Hopkins on Coursera
# part 4 - create plot4.png

# download the dataset to the 'data' subfolder

fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(fileURL, destfile = "./data/Dataset.zip")

# unzip the dataset

unzip("./data/Dataset.zip",exdir="./data")

# read all of the data

alldata <- read.table('./data/household_power_consumption.txt', sep = ';',
		header = TRUE, colClasses = c('character', 'character', 'numeric',
		'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'),
		na.strings = '?')

# Subset the data to only the first and second of February 2007
		
data <- alldata[alldata$Date == '1/2/2007' | alldata$Date == '2/2/2007',]

# remove the full dataset to save memory

rm(alldata)

# create a new 'Dataandtime' column for a POSIXlt variable

data$Dateandtime <- strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

# open PNG graphics device

png(filename = 'plot4.png')
par(mfrow = c(2, 2))

plot(data$Dateandtime, data$Global_active_power, xlab = '',
		ylab = 'Global Active Power', type = 'n')
lines(data$Dateandtime, data$Global_active_power)

plot(data$Dateandtime, data$Voltage, xlab = 'datetime',
		ylab = 'Voltage', type = 'n')
lines(data$Dateandtime, data$Voltage)


plot(data$Dateandtime, data$Sub_metering_1, xlab = '',
		ylab = 'Energy sub metering', type = 'n')

lines(data$Dateandtime, data$Sub_metering_1)
lines(data$Dateandtime, data$Sub_metering_2, col = 'red')
lines(data$Dateandtime, data$Sub_metering_3, col = 'blue')
legend("topright", bty = "n", lty = "solid", col = c("black", "red", "blue"),
		legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
		
plot(data$Dateandtime, data$Global_reactive_power, xlab = 'datetime',
		 ylab = 'Global_reactive_power', type = 'n')
lines(data$Dateandtime, data$Global_reactive_power)

# close the graphics device
		
dev.off()
