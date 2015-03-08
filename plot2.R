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
png(filename = "plot2.png", width = 480, height = 480)

#Plot the line
with(data = data, plot(Date, Global_active_power, type = "l", xlab = "", 
                       ylab = "Global Active Power (kilowatts)"))

#Close graphics device
dev.off()