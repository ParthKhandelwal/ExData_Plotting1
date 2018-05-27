library(lubridate)
data<- read.table("exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt", header= TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

data$Date<- dmy(data$Date)
data<-subset(data, Date== dmy(01022007) | Date== dmy(02022007))

png("plot3.png", width = 480, height = 480)
x<- as.POSIXct(paste(data$Date, data$Time))
plot(x, data$Sub_metering_1,type="l", xlab = "", ylab= "Energy Sub Metering")
points(x, data$Sub_metering_2, col= "red", type="l")
points(x, data$Sub_metering_3, col= "blue", type="l")
legend("topright", col=c("black", "red","blue"), legend = c("Sub_Metering_1", "Sub_Metering_2","Sub_Metering_3"), lty=1, lwd=2)
dev.off()