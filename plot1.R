#Set working directory to make sure the program points to correct data
setwd("C:/Coursera/Data Science Specialization/04 EDA/Project1")

#Read data
data <- read.table("./data/household_power_consumption.txt", header = TRUE, 
                   sep = ";", stringsAsFactors = FALSE, na.strings = "?")

#Subset the data for only date 1st and 2nd Feb. 2007
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

#Set graphics device PNG
png(filename = "plot1.png", width = 480, height = 480)

#Plot histogram
hist(data$Global_active_power, col= "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

#Close graphics device
dev.off()