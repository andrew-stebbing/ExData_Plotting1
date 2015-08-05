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

# Plot 4

# Combine 4 plots on the same graphics device
# arrangement is 2 X 2 ordered by column. 

par(mfcol = c(2,2))

