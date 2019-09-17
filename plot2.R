# Plot2.R
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
plot(inputFile$DateAndTime, inputFile$Global_active_power, main = "", 
     ylab = "Global Active Power (kilowatts)", xlab = "", type = "n")

# Add the line.
lines(inputFile$DateAndTime, inputFile$Global_active_power)

# Copy to the PNG file.
dev.copy(png, "plot2.png", width = 480, height = 480)
dev.off()