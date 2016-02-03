
plot2 <- function(){
  
  # Read data from file.
  data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
  
  # Subset to 2007-02-01 and 2007-02-02.
  twodays <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
  
  # Create a new DateTime field.
  twodays$DateTime <- strptime(paste(twodays$Date,twodays$Time), format = "%d/%m/%Y%H:%M:%S")
  
  # Open the PNG file.
  png(filename = "plot2.png", width = 480, height = 480)
  
  # Draw the plot.
  with(twodays, plot(DateTime,Global_active_power, main = "", xlab = "", 
                     ylab = "Global Active Power (kilowatts)", type = "l"))
  
  # Close the PNG file device.
  dev.off()
}