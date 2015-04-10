power_data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", as.is = TRUE)
power_data$Date <- as.Date(power_data$Date, format = "%d/%m/%Y")

## Subsetting the data
start_date <- as.Date("1/2/2007", "%d/%m/%Y")
end_date <- as.Date("2/2/2007", "%d/%m/%Y")
subset_data <- power_data[power_data$Date >= start_date & power_data$Date <= end_date,]

date_time <- paste(as.Date(subset_data$Date), subset_data$Time)
subset_data$Datetime <- as.POSIXct(date_time)

## Open the PNG graphics device and create 'plot4.png' in working directory
png(filename = "plot4.png", height = 480, width = 480)

## Create plot and send to the file (no plot appears on screen)
par(mfrow = c(2, 2), mar = c(6, 6, 2, 1), oma = c(0, 0, 2 ,0))

## Create Top-Left plot
with(subset_data, plot(Global_active_power ~ Datetime, 
                      type = "l", 
                      xlab = "", 
                      ylab = "Global Active Power"))

## Create Top-Right plot
with(subset_data, plot(Voltage ~ Datetime, 
                      type = "l", 
                      xlab = "datetime", 
                      ylab = "Voltage"))

## Create Bottom-Left plot
with(subset_data, plot(Sub_metering_1 ~ Datetime, 
                      type = "l", 
                      xlab = "", 
                      ylab = "Energy sub metering"))

with(subset_data, lines(Sub_metering_2 ~ Datetime, 
                       col = "Red"))

with(subset_data, lines(Sub_metering_3 ~ Datetime, 
                       col = "Blue"))

## Create legend for the plot
legend("topright", 
       col = c("Black", "Red", "Blue"), 
       lty = 1, 
       lwd = 1, 
       bty = "n", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       cex = 0.9)

## Create Bottom-Right plot
with(subset_data, plot(Global_reactive_power ~ Datetime, 
                      type = "l", 
                      xlab = "datetime",
                      ylab = "Global_reactive_power"))

## Close the PNG graphics device
dev.off()