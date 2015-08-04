oldDir <- getwd()

require(data.table)
require(lubridate)
setwd("/Users/Andrew/Coursera/Data Science/Exploratory Data Analysis/projects/project_1/ExData_Plotting1")
list.files()
file_path <- "household_power_consumption.txt"
columns <- c(rep("date", 2), rep("numeric", 7) )

dt <- fread(file_path)
data <- read.table(file_path,
                   header = TRUE,
                   sep = ";",
                   nrows = 100000,
                   stringsAsFactors = FALSE )

# this takes us up to 24/2/2007
tail(data)[,1:3]


# use the lubridate methods
data$Date <- dmy(data$Dat)
data$Time <- hms(data$Time)
data$Global_active_power <- as.numeric(data$Global_active_power)

# the variables we will use are Global_active_power and submetering

# subset the data. We want observations from 2007-02-01 and 2007-02-02
d1 <- data[data$Date == ymd("2007-02-01") | data$Date == ymd("2007-02-02"), ]
str(d1)
View(d1)
# -----------------------------------------------

hist(sort(d1$Global_active_power, decreasing = TRUE, na.last = NA))
