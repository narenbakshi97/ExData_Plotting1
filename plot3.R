# Plot3.r file
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

# Creating a png
#dev.cur()
png("plot3.png", width = 480, height = 480)

# the plot
plot(datetime, as.numeric(df$Sub_metering_1), type = "l", xlab="", ylab="Energy sub metering", col = "black")
lines(datetime,as.numeric(df$Sub_metering_2), col = "red")
lines(datetime, as.numeric(df$Sub_metering_3), col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()
