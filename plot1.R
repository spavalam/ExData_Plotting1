# plot1.R, First Plot
# Function to Plot Histogram of Frequency vs Global Active Power

# Read in the power consumption data set to a data table
DataTable <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Read Subset of Data pertaining to 01st Feb 2007 & 02nd Feb 2007
SubSetData <- DataTable[DataTable$Date %in% c("1/2/2007","2/2/2007") ,]

GlobalActivePower <- as.numeric(SubSetData$Global_active_power)

# Start the Graphic Bitmap/Png device with 480 Pixels in height and width
png(filename="plot1.png", height=480, width=480, bg="transparent")

# Plot the histogram, Color of Bar is Red, Title of Plot is "Global Active Power", 
# X-Axis title is Global Active Power (Kilowatts)and Y-Axis title is Frequency.
hist(GlobalActivePower,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency")

# Close the Graphic Device after saving the image.
dev.off()