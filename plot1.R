# This script creates plot1.png file
# It plots the Global Active Power in kilowatts
# in a histogram

# reading in the data and cutting the 01. and 02.02.2007
input.data <- read.table("household_power_consumption.txt", header=T, sep=";", 
                         colClasses=rep("character", 9))
input.data.cut <- input.data[input.data[,1]=="1/2/2007" | input.data[,1]=="2/2/2007",]

# open a PNG device
png("plot1.png")

# plotting the Global Active Power in a histogram
hist((as.numeric(input.data.cut$Global_active_power)), main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", col="orangered")

# close the PNG device
dev.off()
