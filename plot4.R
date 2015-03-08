# plot4.R, Fourth Plot Assignment
# Function to plot graphs for data pertaining to 01st & 02nd Feb 2007 (which happens to be a Thursday & Friday)
# To Plot 2 graphs with Y Axis indicating Global Active Power, Voltage in first row
# To Plot 2 graphs with Y Axis indicating Energy Sub Metering & Global Reactive Power in second row.

# To read the power consumption in a Data Table
DataTable <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Read Subset of Data pertaining to 01st Feb 2007 & 02nd Feb 2007
SubSetData <- DataTable[DataTable$Date %in% c("1/2/2007","2/2/2007") ,]

DateAndTime <- strptime(paste(SubSetData$Date, SubSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Fetching Global Active Power for 01st Feb & 02nd Feb 2007
GlobalActivePower <- as.numeric(SubSetData$Global_active_power)

# Fetching Global Reactive Power for 01st Feb & 02nd Feb 2007
GlobalReactivePower <- as.numeric(SubSetData$Global_reactive_power)

# Fetching Voltage for 01st Feb & 02nd Feb 2007
Voltage <- as.numeric(SubSetData$Voltage)

# Fetching Sub_metering_1, 2 and 3 
SubMetering1 <- as.numeric(SubSetData$Sub_metering_1)
SubMetering2 <- as.numeric(SubSetData$Sub_metering_2)
SubMetering3 <- as.numeric(SubSetData$Sub_metering_3)

# Create Bitmap/png file in working directory with width and height of 480 pixels.
png("plot4.png", width=480, height=480)

# Set Graphical Parameters - Create 2 Rows by 2 Columns Graph boxes using mfrow
par(mfrow = c(2, 2))

# All X Axis DateAndTime is for 01st Feb & 02nd Feb 2007 which happens to be Thrusday & Friday.

# Global Active Power Plot with No X Axis Label and Y Axis Label as "Global Active Power"
plot(DateAndTime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

# Plot with X Axis Label as "datetime" and Y Axis Label as "Voltage"
plot(DateAndTime, Voltage, type="l", xlab="datetime", ylab="Voltage")

# Plot with No X Axis Label and Y Axis Label as "Energy Submetering"
plot(DateAndTime, SubMetering1, type="l", ylab="Energy Submetering", xlab="")

# Add Red Line for Sub_metering_2
lines(DateAndTime, SubMetering2, type="l", col="red")

# Add Blue Line for Sub_metering_3
lines(DateAndTime, SubMetering3, type="l", col="blue")

# Create legends in topright corner of the graph for Sub_metering_1,2 and 3
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2, col=c("black", "red", "blue"), bty="o")

# Global Reactive Power Plot with X Axis Label as "datetime" and Y Axis Label as "Global_reactive_power"
plot(DateAndTime, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

# Close the png Graphic Device
dev.off ()
