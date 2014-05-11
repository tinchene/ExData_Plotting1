# This script creates plot4.png file
# It plots 4 line diagrams in one plot:
# Global Active Power
# Voltage
# Energy sub metering
# Global reactive power

# reading in the data and cutting the 01. and 02.02.2007
input.data <- read.table("household_power_consumption.txt", header=T, sep=";", 
                         colClasses=rep("character", 9))
input.data.cut <- input.data[(as.character(input.data[,1])=="1/2/2007" | as.character(input.data[,1])=="2/2/2007"),]

# open a PNG device
png("plot4.png")

# plotting 4 different plots in one plot, always changing the x-axis labeling
# timepoint 1 (time: 00:00, day 01.02.2007) = Thu
# timepoint 1441 (time: 00:00, day 02.02.2007) = Fri
# timepoint 2881 (time: 00:00, day 03.02.2007) = Sat
par(mfrow = c(2,2))

# plotting the Global Active Power in a line diagram
plot(as.numeric(input.data.cut$Global_active_power), type="l", main="", 
     ylab="Global Active Power", xlab="", xaxt="n")
axis(1, at=c(1, 1441, 2881), labels=c("Thu", "Fri", "Sat"))

# plotting the Voltage in a line diagram
plot(as.numeric(input.data.cut$Voltage), type="l", main="", 
     ylab="Voltage", xlab="datetime", xaxt="n")
axis(1, at=c(1, 1441, 2881), labels=c("Thu", "Fri", "Sat"))

# plotting the Energy sub metering 1 in  a line diagram
plot(as.numeric(input.data.cut$Sub_metering_1), type="l", main="", 
     ylab="Energy sub metering", xlab="", xaxt="n")
axis(1, at=c(1, 1441, 2881), labels=c("Thu", "Fri", "Sat"))
# adding the Energy sub metering 2 and 3 in red and blue and adding a legend
lines(as.numeric(input.data.cut$Sub_metering_2), col="red")
lines(as.numeric(input.data.cut$Sub_metering_3), col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

# plotting the Global Reactive Power in a line diagram
plot(as.numeric(input.data.cut$Global_reactive_power), type="l", main="", 
     ylab="Global_reactive_power", xlab="datetime", xaxt="n")
axis(1, at=c(1, 1441, 2881), labels=c("Thu", "Fri", "Sat"))

#close the PNG device
dev.off()
