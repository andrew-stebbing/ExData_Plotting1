# Exploratory Data Analysis
# Course Project 1
# Plot 3

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

# Plot 3

# This is a multi-variable plot for the 3 Sub-metering variables

# convert the the Sub_metering variables to numbers
# These are found in columns 7-9
d[, 7:9] <- lapply(d[, 7:9], as.numeric)
 
# create a basic plot with no points
par(bg = "white")
plot(d$Sub_metering_1,
     type = "n",
     xaxt = "n",
     xlab = "",
     ylab = "Energy sub metering",
)

# add points for each Sub_metering group
points(d$Sub_metering_1, type = "l", col = "black")
points(d$Sub_metering_2, type = "l", col = "red")
points(d$Sub_metering_3, type = "l", col = "blue")

# create a custom x-axis
# find the index number for the first observation on Fri 2 Feb 2007
middle <- grep("2007-02-02", d$Date)[1]
end <- length(d$Date)

axis(1, at = c( 1, middle, end), labels = c("Thurs", "Fri", "Sat"))

# add a legend at the top right
legend("topright",
       lty = 1,
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 ")
       )

# -----------------------------------------------

# save the resultant plot as a .png file
dev.copy(png,
         file = "plot3.png",
         width = 480,
         height = 480)
dev.off()







