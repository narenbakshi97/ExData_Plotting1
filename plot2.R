# Plot2.r file
# Author: Naren Bakshi

# Load the data
my_data <- read.csv2(file = "household_power_consumption.txt", header = TRUE, sep = ";")
# restrict data with selected dates: 01/02and 02/02 2007
df <- subset(my_data, my_data$Date %in% c("1/2/2007","2/2/2007"))

# checking the data
head(df)
dim(df)
names(df)

library(lubridate)
datetime <- dmy_hms(paste(df$Date, df$Time))
active_power <- as.numeric(df$Global_active_power)

# Creating a png
#dev.cur()
png("plot2.png", width = 480, height = 480)

# constructing the plot
plot(datetime, active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
