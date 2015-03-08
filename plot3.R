# plot3.R, Third Plot in Assignment
# Function to plot graphs for data pertaining to 01st & 02nd Feb 2007 (which happens to be a Thursday & Friday)
# To Plot graph with X Axis indicating 01st Feb & 02nd Feb 2007 which happens to be a Thursday & Friday
# Y Axis indicates Energy Sub Metering 

# To read the power consumption in a Data Table
DataTable <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Read Subset of Data pertaining to 01st Feb 2007 & 02nd Feb 2007
SubSetData <- DataTable[DataTable$Date %in% c("1/2/2007","2/2/2007") ,]

DateAndTime <- strptime(paste(SubSetData$Date, SubSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Fetching Global Active Power for 01st Feb & 02nd Feb 2007
GlobalActivePower <- as.numeric(SubSetData$Global_active_power)

# Fetching Sub_metering_1, 2 and 3 
SubMetering1 <- as.numeric(SubSetData$Sub_metering_1)
SubMetering2 <- as.numeric(SubSetData$Sub_metering_2)
SubMetering3 <- as.numeric(SubSetData$Sub_metering_3)

# Create Bitmap/png file in working directory with width and height of 480 pixels.
png("plot3.png", width=480, height=480)

# Plot with No X Axis Label and Y Axis Label as "Energy Submetering"
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")

# Add Red Line for Sub_metering_2
lines(datetime, subMetering2, type="l", col="red")

# Add Blue Line for Sub_metering_3
lines(datetime, subMetering3, type="l", col="blue")

# Create legends in topright corner of the graph for Sub_metering_1,2 and 3
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# Close the png Graphic Device
dev.off()
