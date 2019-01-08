# Plot4.r file
# Author: Naren Bakshi

# Load the data
my_data <- read.csv2(file = "household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
# restrict data with selected dates: 01/02and 02/02 2007
df <- subset(my_data, my_data$Date %in% c("1/2/2007","2/2/2007"))

# checking the data
head(df)
dim(df)
names(df)

library(lubridate)
datetime <- dmy_hms(paste(df$Date, df$Time))
active_power <- as.numeric(df$Global_active_power)
voltage <- as.numeric(df$Voltage) 
reactive_power <- as.numeric(df$Global_reactive_power)

# Creating a png
#dev.cur()
png("plot4.png", width = 480, height = 480)

# the plot
par(mfrow = c(2,2), mar = c(4,4,1,1), cex = 0.7)
# plot 1
plot(datetime, active_power, type = "l", xlab="", ylab="Global Active Power")
# plot 2
plot(datetime,voltage, type="l", xlab="datetime", ylab="voltage")
# plot 3
plot(datetime, as.numeric(df$Sub_metering_1), type = "l", xlab="", ylab="Energy sub metering", col = "black")
lines(datetime,as.numeric(df$Sub_metering_2), col = "red")
lines(datetime, as.numeric(df$Sub_metering_3), col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
# plot 4
plot(datetime,reactive_power,type="l",ylab="Global_reactive_power")

# close the device
dev.off()