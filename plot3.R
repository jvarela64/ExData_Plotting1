# Plot3.R
# Author: Joel Varela Donado
# Exploratory Data Analysis Course Project 1

# Read the data file.
inputFile = read.table("household_power_consumption.txt", header=TRUE, 
                       sep=";", na.string="?")

# Filter the data to the two interesting dates.
inputFile = inputFile[(inputFile$Date == "1/2/2007" 
                           | inputFile$Date == "2/2/2007"),]

# Setup Date and Time to Date type.
inputFile$DateAndTime = paste(inputFile$Date, inputFile$Time)
inputFile$DateAndTime = strptime(inputFile$DateAndTime, 
                                 format = "%d/%m/%Y %H:%M:%S")

# Plot without drawing data.
plot(inputFile$DateAndTime, inputFile$Sub_metering_1, main = "", 
     ylab = "Energy sub metering", xlab = "", type = "n")

# Add the lines.
lines(inputFile$DateAndTime, inputFile$Sub_metering_1)
lines(inputFile$DateAndTime, inputFile$Sub_metering_2, col = "red")
lines(inputFile$DateAndTime, inputFile$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Copy to the PNG file.
dev.copy(png, "plot3.png", width = 480, height = 480)
dev.off()