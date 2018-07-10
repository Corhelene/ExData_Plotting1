plot4 <- function(){
        #Read the data and name it data
        my_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
        
        #Create DateTime variable as combination of Date and Time variable, and add this variable to the dataframe
        DateTime <- strptime(paste(as.character(my_data$Date), as.character(my_data$Time)), format = "%d/%m/%Y %H:%M:%S") 
        my_data <- cbind(DateTime, my_data)
        
        #Create a new dataframe df with only the dates 2007-02-01 and 2007-02-02 of the dataset 
        my_data$Date <- strptime(as.character(my_data$Date), format = "%d/%m/%Y")
        df <- my_data[my_data$Date == "2007-02-01" | my_data$Date == "2007-02-02", ]        
        
        #Open png device, make the plot, and close the device
        png(filename = "Plot4.png", width = 480, height = 480)
        par(mfrow=c(2,2),mar=c(4,4,2,4))
        #plot1
        plot(df$DateTime, df$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power",cex.lab =0.7)
        #plot2
        plot(df$DateTime, df$Voltage, type = "l", xlab = "datetime", ylab = "voltage", cex.lab=0.7)
        #plot3
        plot(df$DateTime, df$Sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energy Sub Metering", cex.lab=0.7)
        lines(df$DateTime, df$Sub_metering_2, col = "red")
        lines(df$DateTime, df$Sub_metering_3, col = "blue")
        legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), cex=0.7, bty ="n", lty = 1)
        #plot4
        plot(df$DateTime, df$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global Reactive Power", cex.lab=0.7)
        dev.off()
}