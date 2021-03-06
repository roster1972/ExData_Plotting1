
plot3 <- function(){
  
  # Read data from file.
  data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
  
  # Subset to 2007-02-01 and 2007-02-02.
  twodays <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
  
  # Create a new DateTime field.
  twodays$DateTime <- strptime(paste(twodays$Date,twodays$Time), format = "%d/%m/%Y%H:%M:%S")
  
  # Open the PNG file.
  png(filename = "plot3.png", width = 480, height = 480)
  
  # Draw the plot with three lines and legend.
  plot(twodays$DateTime, twodays$Sub_metering_1, main = "", xlab = "", 
       ylab = "Energy sub metering", type = "l", col = "black")
  lines(twodays$DateTime, twodays$Sub_metering_2, type = "l", col = "red")
  lines(twodays$DateTime, twodays$Sub_metering_3, type = "l", col = "blue")
  legend("topright", col = c("black", "red", "blue"), lwd = 1,
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  # Close the PNG file device.
  dev.off()
}