# plot2.R, Second Plot in Assignment
# Function to plot graphs for data pertaining to 01st & 02nd Feb 2007 (which happens to be a Thursday & Friday)
# To Plot graph with X Axis indicating 01st Feb & 02nd Feb 2007 which happens to be a Thursday & Friday
# Y Axis indicates Global Active Power in Kilowatts. 

# To read the power consumption in a Data Table
DataTable <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Read Subset of Data pertaining to 01st Feb 2007 & 02nd Feb 2007
SubSetData <- DataTable[DataTable$Date %in% c("1/2/2007","2/2/2007") ,]

DateAndTime <- strptime(paste(SubSetData$Date, SubSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Fetching Global Active Power for 01st Feb & 02nd Feb 2007
GlobalActivePower <- as.numeric(SubSetData$Global_active_power)

# Create Bitmap/png file in working directory with width and height of 480 pixels.
png("plot2.png", width=480, height=480)

# Global Active Power Plot with No X Axis Label and Y Axis Label as "Global Active Power"
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Close the png Graphic Device
dev.off()
