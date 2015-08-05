# Exploratory Data Analysis
# Course Project 1
# Plot 4

# Read in data from the "Household Power Consumption" data set.
# Only 2 days worth of data are required:
# Thursday 1 Feb 2007 & Friday 2 Feb 2007.
# The data is a time-series. The first 70,000 entries provide data
# up to 3 Feb 2007

require(lubridate) # for conversion of characters to dates

file_path <- "household_power_consumption.txt"

data <- read.table(file_path,
                   header = TRUE,
                   sep = ";",
                   nrows = 70000,
                   stringsAsFactors = FALSE )

data$Date <- dmy(data$Dat) # {lubridate} function for conversion

# subset the data for the 2 required dates 2007-02-01 and 2007-02-02
d <- data[data$Date == ymd("2007-02-01") | data$Date == ymd("2007-02-02"), ]

# -----------------------------------------------

# Initial set-up
# Convert the columns "Global_active_power, Global_reactive_power, Voltage
# and Sub_metering 1:3 to numbers
d$Global_active_power <- as.numeric(d$Global_active_power)
d$Global_reactive_power <- as.numeric(d$Global_reactive_power)
d$Voltage <- as.numeric(d$Voltage)
d$Sub_metering_1 <- as.numeric(d$Sub_metering_1)
d$Sub_metering_2 <- as.numeric(d$Sub_metering_2)
d$Sub_metering_3 <- as.numeric(d$Sub_metering_3)

# -----------------------------------------------


# Plot 4

# Combine 4 plots on the same graphics device
# arrangement is 2 X 2 ordered by column. 

par(mfcol = c(2,2))

# Plot 1 (same as plot2.png)
plot(d$Global_active_power, type = "l", xaxt = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
axis(1, at = c( 1, grep("2007-02-02", d$Date)[1], length(d$Date)), labels = c("Thurs", "Fri", "Sat"))

# Plot 2 (same as plot3.png)
plot(d$Sub_metering_1, type = "n", xaxt = "n", xlab = "", ylab = "Energy Sub Metering")
points(d$Sub_metering_1, type = "l", col = "black")
points(d$Sub_metering_2, type = "l", col = "red")
points(d$Sub_metering_3, type = "l", col = "blue")
axis(1, at = c( 1, grep("2007-02-02", d$Date)[1], length(d$Date)), labels = c("Thurs", "Fri", "Sat"))
legend("topright", pch = 20, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Plot 3
plot(d$Voltage, type = "l", xaxt = "n", xlab = "datetime", ylab = "Voltage")
axis(1, at = c( 1, grep("2007-02-02", d$Date)[1], length(d$Date)), labels = c("Thurs", "Fri", "Sat"))

# Plot 4
plot(d$Global_reactive_power, type = "l", xaxt = "n", xlab = "datetime", ylab = "Global_reactive_power")
axis(1, at = c( 1, grep("2007-02-02", d$Date)[1], length(d$Date)), labels = c("Thurs", "Fri", "Sat"))


