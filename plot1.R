power_data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", as.is = TRUE)
power_data$Date <- as.Date(power_data$Date, format = "%d/%m/%Y")

## Subsetting the data
start_date <- as.Date("1/2/2007", "%d/%m/%Y")
end_date <- as.Date("2/2/2007", "%d/%m/%Y")
subset_data <- power_data[power_data$Date >= start_date & power_data$Date <= end_date,]

## Open the PNG graphics device and create 'plot1.png' in working directory
png(filename = "plot1.png", height = 480, width = 480)

## Create plot and send to the file (the plot will not appear on the screen)
with(subset_data, hist(Global_active_power, 
                      main = "Global Active Power", 
                      xlab = "Global Active Power (kilowatts)", 
                      ylab = "Frequency", 
                      col = "Red"))

## Close the PNG graphics device
dev.off()


