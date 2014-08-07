run.plot3 <- function() {
    source('prepData.R')
    pc <- prepData()
    png('plot3.png')
    plot(pc$Sub_metering_1 ~ pc$datetime, type="n",
         xlab="", ylab="Energy sub metering")
    lines(pc$Sub_metering_1 ~ pc$datetime)
    lines(pc$Sub_metering_2 ~ pc$datetime, col="red")
    lines(pc$Sub_metering_3 ~ pc$datetime, col="blue")
    legend('topright', lwd=1, col=c('black', 'red', 'blue'),
           legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
    dev.off()
}
