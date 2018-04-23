
energydata <- read.table("./household_power_consumption.txt",header = TRUE, sep = ";", quote = "\"", na.strings = "?")
energydata0<- subset(energydata, Date=="1/2/2007" | Date=="2/2/2007")

datetime<- paste(energydata0$Date, energydata0$Time)
datetime1<-strptime(datetime, format="%d/%m/%Y %H:%M:%S")
energydata1 <- cbind(energydata0, datetime1)
# Create the plot 4
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(energydata1, plot(datetime1, energydata1$Global_active_power, type= "l", ylab= "Global Active Power", xlab=NA))

with(energydata1, plot(datetime1, Voltage, type= "l", ylab= "Voltage", xlab= "datetime"))

with(energydata1, {
  plot(datetime1,Sub_metering_1, type= "l", ylab= "Energy sub metering", xlab=NA)
  points(datetime1,Sub_metering_2, type= "l", col= "red")
  points(datetime1,Sub_metering_3, type= "l", col= "blue")
})
legend("topright", col= c("black", "red", "blue"), lty=1, yjust= 1, bty = "n", cex=0.50, pt.cex=1.5, legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(energydata1, plot(datetime1, Global_reactive_power, type= "l", ylab= "Global_reactive_power", xlab="datetime"))    
dev.copy(png, file = "plot4.png", width=480, height=480)
dev.off()
