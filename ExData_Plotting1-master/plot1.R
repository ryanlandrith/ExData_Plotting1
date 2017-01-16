x=read.csv(file = "household_power_consumption.txt", sep = ";",na.strings = "?")
x$Date <- strptime(x$Date,format = "%d/%m/%Y")
x <-  x[x$Date=="2007-02-01" | x$Date=="2007-02-02",]
png(filename = "plot1.png",width = 480, height = 480, units = "px", pointsize = 12, bg = "white")
hist(as.numeric(x$Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.off()
