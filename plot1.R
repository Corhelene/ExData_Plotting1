plot1 <- function(){
        #Read the data and name it data
        data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
        
        #Make date and time instead of characters
        data$Date <- strptime(data$Date, format = "%d/%m/%Y")
        data$Time <- strptime(data$Time, format = "%H:%M:%S")
        
        #select only the dates 2007-02-01 and 2007-02-02 of the dataset 
        data_subset <- data[data$Date == "2007-02-01 CET" | data$Date == "2007-02-02 CET", ]
        
        #Open png device, make the histogram plot, and close the device
        png(filename = "Plot1.png", width = 480, height = 480)
        hist(data_subset$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (Kilowatts)")
        dev.off()
}
