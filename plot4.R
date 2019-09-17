# Plot4.R
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

# Setup the panel
par(mfrow = c(2,2))

# Top left plot
# Plot without drawing data.
plot(inputFile$DateAndTime, inputFile$Global_active_power, main = "", 
     ylab = "Global Active Power (kilowatts)", xlab = "", type = "n")

# Add the line.
lines(inputFile$DateAndTime, inputFile$Global_active_power)

# Top right plot
# Plot without drawing data.
plot(inputFile$DateAndTime, inputFile$Voltage, main = "", 
     ylab = "Voltage", xlab = "datetime", type = "n")

# Add the line.
lines(inputFile$DateAndTime, inputFile$Voltage)

# Bottom left plot
# Plot without drawing data.
plot(inputFile$DateAndTime, inputFile$Sub_metering_1, main = "", 
     ylab = "Energy sub metering", xlab = "", type = "n")

# Add the lines.
lines(inputFile$DateAndTime, inputFile$Sub_metering_1)
lines(inputFile$DateAndTime, inputFile$Sub_metering_2, col = "red")
lines(inputFile$DateAndTime, inputFile$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1, bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Bottom right plot.
# Plot without drawing data.
plot(inputFile$DateAndTime, inputFile$Global_reactive_power, main = "", 
     ylab = "Global_reactive_power", xlab = "datetime", type = "n")

# Add the line.
lines(inputFile$DateAndTime, inputFile$Global_reactive_power)

# Copy to the PNG file.
dev.copy(png, "plot4.png", width = 480, height = 480)
dev.off()