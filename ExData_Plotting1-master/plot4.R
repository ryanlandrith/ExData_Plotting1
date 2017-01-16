x=read.csv(file = "household_power_consumption.txt", sep = ";",na.strings = "?")
x$Date <- strptime(x$Date,format = "%d/%m/%Y")
x <-  x[x$Date=="2007-02-01" | x$Date=="2007-02-02",]

png(filename = "plot4.png",width = 480, height = 480, units = "px", pointsize = 12, bg = "white")

par(mfrow=c(2,2))

plot(seq(from=4, to=5, length.out = length(x$Date)),x$Global_active_power, type = "l",xlab = "", ylab = "Global Active Power (kilowatts)", xaxt="n")
axis(at = c(4,4.5,5), labels = c("Thu","Fri","Sat"), side = 1)

plot(seq(from=4, to=5, length.out = length(x$Date)),x$Voltage, type = "l",xlab = "", ylab = "Voltage", xaxt="n")
axis(at = c(4,4.5,5), labels = c("Thu","Fri","Sat"), side = 1)
title(sub = "datetime")

plot(seq(from=4, to=5, length.out = length(x$Date)),x$Sub_metering_1, type = "l",xlab = "",ylab = "Energy sub metering", xaxt="n")
points(seq(from=4, to=5, length.out = length(x$Date)),x$Sub_metering_2, type = "l", col="red")
points(seq(from=4, to=5, length.out = length(x$Date)),x$Sub_metering_3, type = "l", col="blue")
axis(at = c(4,4.5,5), labels = c("Thu","Fri","Sat"), side = 1)
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"),lty = 1)

plot(seq(from=4, to=5, length.out = length(x$Date)),x$Global_reactive_power, type = "l",xlab = "", ylab = "Global_reactive_power", xaxt="n")
axis(at = c(4,4.5,5), labels = c("Thu","Fri","Sat"), side = 1)
title(sub = "datetime")

dev.off()
