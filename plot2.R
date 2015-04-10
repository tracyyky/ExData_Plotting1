power_data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", as.is = TRUE)
power_data$Date <- as.Date(power_data$Date, format = "%d/%m/%Y")

## Subsetting the data
start_date <- as.Date("1/2/2007", "%d/%m/%Y")
end_date <- as.Date("2/2/2007", "%d/%m/%Y")
subset_data <- power_data[power_data$Date >= start_date & power_data$Date <= end_date,]

date_time <- paste(as.Date(subset_data$Date), subset_data$Time)
subset_data$Datetime <- as.POSIXct(date_time)

## Open the PNG graphics device and create 'plot2.png' in working directory
png(filename = "plot2.png", height = 480, width = 480)

## Create plot and send to the file (no plot appears on screen)
with(subset_data, plot(Datetime, Global_active_power, 
                      type = "l", 
                      xlab = "", 
                      ylab = "Global Active Power (kilowatts)"))

## Close the PNG graphics device
dev.off()

