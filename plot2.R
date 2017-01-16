x=read.csv(file = "household_power_consumption.txt", sep = ";",na.strings = "?")
x$Date <- strptime(x$Date,format = "%d/%m/%Y")
x <-  x[x$Date=="2007-02-01" | x$Date=="2007-02-02",]


png(filename = "plot2.png",width = 480, height = 480, units = "px", pointsize = 12, bg = "white")
plot(seq(from=1, to=2, length.out = length(x$Date)),x$Global_active_power, type = "l",ylab = "Global Active Power (kilowatts)", xaxt="n")
axis(at = c(1,0.5,2), labels = c("Thu","Fri","Sat"), side = 1)
dev.off()
