# This script creates plot2.png file
# It plots the Global Active Power in kilowatts
# in a line diagram

# reading in the data and cutting the 01. and 02.02.2007
input.data <- read.table("household_power_consumption.txt", header=T, sep=";", 
                         colClasses=rep("character", 9))
input.data.cut <- input.data[input.data[,1]=="1/2/2007" | input.data[,1]=="2/2/2007",]

# open a PNG device
png("plot2.png")

# plotting the Global Active Power in a line diagram and changing the x-axis labeling
# timepoint 1 (time: 00:00, day 01.02.2007) = Thu
# timepoint 1441 (time: 00:00, day 02.02.2007) = Fri
# timepoint 2881 (time: 00:00, day 03.02.2007) = Sat
plot(as.numeric(input.data.cut$Global_active_power), type="l", main="", 
     ylab="Global Active Power (kilowatts)", xlab="", xaxt="n")
axis(1, at=c(1, 1441, 2881), labels=c("Thu", "Fri", "Sat"))

#close the PNG device
dev.off()
