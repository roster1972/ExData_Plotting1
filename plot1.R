
plot1 <- function(){
  
  # Read data from file.
  data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
  
  # Subset to 2007-02-01 and 2007-02-02.
  twodays <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
  
  # Open the PNG file.
  png(filename = "plot1.png", width = 480, height = 480)
  
  # Draw the histogram.
  with(twodays, hist(Global_active_power, main = "Global Active Power", col = "red", 
                     xlab = "Global Active Power (kilowatts)"))
  
  # Close the PNG file device.
  dev.off()
}