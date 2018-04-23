
energydata <- read.table("./household_power_consumption.txt",header = TRUE, sep = ";", quote = "\"", na.strings = "?")
energydata0<- subset(energydata, Date=="1/2/2007" | Date=="2/2/2007")

datetime<- paste(energydata0$Date, energydata0$Time)
datetime1<-strptime(datetime, format="%d/%m/%Y %H:%M:%S")
energydata1<- cbind(energydata0, datetime1)

# Create the plot 1, an histogramme
hist(energydata1$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()
