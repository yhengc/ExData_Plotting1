#Set working directory to make sure the program points to correct data
setwd("C:/Coursera/Data Science Specialization/04 EDA/Project1")

#Read data
data <- read.table("./data/household_power_consumption.txt", header = TRUE, 
                   sep = ";", stringsAsFactors = FALSE, na.strings = "?")

#Subset the data for only date 1st and 2nd Feb. 2007
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

#Combine date and time
data$Date <- paste(data$Date, data$Time)

#Convert the format to POSIXlt
data$Date <- strptime(data$Date, "%d/%m/%Y %H:%M:%S")

#Set the locale to English
Sys.setlocale("LC_TIME", "English")

#Set graphics device PNG
png(filename = "plot4.png", width = 480, height = 480)

#Set the layout to have 2 rows and 2 columns
par(mfrow = c(2, 2))

#Start plotting
with(data = data, 
        #Plot the first graph
        {plot(Date, Global_active_power, type = "l", xlab = "", ylab = 
                      "Global Active Power")
        
        #Plot the second graph
        plot(Date, Voltage, type = "l", xlab = "datetime", ylab = 
                     "Voltage")
     
        #Plot the third graph including 3 lines and the legend
        plot(Date, Sub_metering_1, type = "l", xlab = "", ylab = 
                      "Energy sub metering")
        lines(Date, Sub_metering_2, type = "l", col = "red")
        lines(Date, Sub_metering_3, type = "l", col = "blue")
        legend("topright", lty = "solid", col = c("black", "red", "blue"), 
               legend = c("Sub_metering_1", "Sub_metering_2", 
                          "Sub_metering_3"))

        #Plot the fourth graph
        plot(Date, Global_reactive_power, type = "l", xlab = "datetime", ylab = 
                  "Global_reactive_power")
})
#Close graphics device
dev.off()