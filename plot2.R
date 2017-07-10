# This code is created by Luc van Schijndel for Course Project 1
# from the course 'Exploratory Data Analysis' by John Hopkins on Coursera
# part 2 - create plot2.png

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

png(filename = 'plot2.png')
plot(data$Dateandtime, data$Global_active_power, xlab = '',
		ylab = 'Global Active Power (kilowatts)', type = 'n')

lines(data$Dateandtime, data$Global_active_power)

# close the graphics device

dev.off()
