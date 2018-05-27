library(lubridate)
data<- read.table("exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt", header= TRUE, sep = ";", stringsAsFactors = FALSE)

data$Date<- dmy(data$Date)
data<-subset(data, Date== dmy(01022007) | Date== dmy(02022007))

png("plot1.png", width = 480, height = 480)
hist(as.numeric(data$Global_active_power) , col= "red", main="Global Active Power", xlab="Global Active Power(kilowatts)", ylab= "Frequency")
dev.off()
