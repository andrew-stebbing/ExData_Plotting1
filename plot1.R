# Exploratory Data Analysis
# Course Project 1
# Plot 1

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

# Plot 1

# convert the $Global_active_power variable to numbers
d$Global_active_power <- as.numeric(d$Global_active_power)

# plot a basic histogram for the variable $Global_acitve_power
hist(d1$Global_active_power,
     col = "red",
     ylim = c(0, 1200),
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

# -----------------------------------------------

# Save the resultant plot as a .png file
dev.copy(png,
         file = "plot1.png",
         width = 480,
         height = 480)
dev.off()

