# Plot1.R
# Author: Joel Varela Donado
# Exploratory Data Analysis Course Project 1

# Read the data file.
inputFile = read.table("household_power_consumption.txt", header=TRUE, 
                       sep=";", na.string="?")

# Filter the data to the two interesting dates.
inputFile = inputFile[(inputFile$Date == "1/2/2007" 
                       | inputFile$Date == "2/2/2007"),]

# Change data type to dates on the Date column.
inputFile$Date = as.Date(inputFile$Date, format=c("%d/%m/%Y"))

# Plot the histogram.
hist(inputFile$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

# Copy to the PNG file.
dev.copy(png, "plot1.png", width = 480, height = 480)
dev.off()