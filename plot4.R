library(lubridate)
data<- read.table("exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt", header= TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

data$Date<- dmy(data$Date)
data<-subset(data, Date== dmy(01022007) | Date== dmy(02022007))
png("plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))
x<- as.POSIXct(paste(data$Date, data$Time))
a<- as.numeric(data$Global_active_power)
plot(x, a, type = "l", xlab="", ylab = "Global Active Power")
plot(x, data$Voltage, xlab= "datetime", ylab = "Voltage", type = "l")
plot(x, data$Sub_metering_1,type="l", xlab = "", ylab= "Energy Sub Metering")
points(x, data$Sub_metering_2, col= "red", type="l")
points(x, data$Sub_metering_3, col= "blue", type="l")
legend("topright", col=c("black", "red","blue"), legend = c("Sub_Metering_1", "Sub_Metering_2","Sub_Metering_3"), lty=1, lwd=2)

plot(x, data$Global_reactive_power , type = "l",xlab= "", ylab="Global_reactive_power")
dev.off()