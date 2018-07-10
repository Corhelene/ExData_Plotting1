plot2 <- function(){
        #Read the data and name it data
        my_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
        
        #Create DateTime variable as combination of Date and Time variable, and add this variable to the dataframe
        DateTime <- strptime(paste(as.character(my_data$Date), as.character(my_data$Time)), format = "%d/%m/%Y %H:%M:%S") 
        my_data <- cbind(DateTime, my_data)
        
        #Create a new dataframe df with only the dates 2007-02-01 and 2007-02-02 of the dataset 
        my_data$Date <- strptime(as.character(my_data$Date), format = "%d/%m/%Y")
        df <- my_data[my_data$Date == "2007-02-01" | my_data$Date == "2007-02-02", ]        
        
        #Open png device, make the plot, and close the device
        png(filename = "Plot2.png", width = 480, height = 480)
        plot(df$DateTime, df$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts")
        dev.off()
}
