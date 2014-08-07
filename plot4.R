run.plot4 <- function() {
    source('prepData.R')
    pc <- prepData()
    png('plot4.png')
    par(mfrow=c(2,2))
    #first plot, top left
    plot(pc$Global_active_power ~ pc$datetime, type="l",
         xlab="", ylab="Global Active Power (kilowatts)", main="")
    #second plot, top right
    plot(pc$Voltage ~ pc$datetime, type="l",
         xlab="datetime", ylab="Voltage", main="")
    #third plot, bottom left
    plot(pc$Sub_metering_1 ~ pc$datetime, type="n",
         xlab="", ylab="Energy sub metering")
    lines(pc$Sub_metering_1 ~ pc$datetime)
    lines(pc$Sub_metering_2 ~ pc$datetime, col="red")
    lines(pc$Sub_metering_3 ~ pc$datetime, col="blue")
    legend('topright', lwd=1, col=c('black', 'red', 'blue'),
           legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
    #fourth plot, bottom right
    plot(pc$Global_reactive_power ~ pc$datetime, type="l",
         xlab="", ylab="Global_reactive_power", main="")
    dev.off()
}
