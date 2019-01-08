# Plot1.r file
# Author: Naren Bakshi

# Load the data
my_data <- read.csv2(file = "household_power_consumption.txt", header = TRUE, sep = ";")

# checking the data
head(my_data)
dim(my_data)
names(my_data)

# Creating a png
dev.cur()
png("plot1.png", width = 480, height = 480)

# constructing the histogram for "Global Active Power" variable/column
hist(as.numeric(my_data$Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()
