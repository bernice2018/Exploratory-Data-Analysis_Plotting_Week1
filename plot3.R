
energydata <- read.table("./household_power_consumption.txt",header = TRUE, sep = ";", quote = "\"", na.strings = "?")
energydata0<- subset(energydata, Date=="1/2/2007" | Date=="2/2/2007")

datetime<- paste(energydata0$Date, energydata0$Time)
datetime1<-strptime(datetime, format="%d/%m/%Y %H:%M:%S")
energydata1<- cbind(energydata0, datetime1)
# Create the plot 3
with(energydata1,plot(datetime1,Sub_metering_1, type= "l", ylab= "Energy sub metering", xlab=NA))
with(energydata1, points(datetime1,Sub_metering_2, type= "l", col= "red"))
with(energydata1, points(datetime1,Sub_metering_3, type= "l", col= "blue"))
legend("topright", lty=1 , legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col= c("black", "red", "blue"))
dev.copy(png, file = "plot3.png", width=480, height=480)
dev.off()
