library(lubridate)
data<- read.table("exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt", header= TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

data$Date<- dmy(data$Date)
data<-subset(data, Date== dmy(01022007) | Date== dmy(02022007))

png("plot2.png", width = 480, height = 480)
y<- as.numeric(data$Global_active_power)
x<- as.POSIXct(paste(data$Date, data$Time))
plot(x, y, type="l", xlab = "", ylab= "Global Active Power (kilowatts)")
dev.off()