run.plot2 <- function() {
    source('prepData.R')
    pc <- prepData()
    png('plot2.png')
    plot(pc$Global_active_power ~ pc$datetime, type="l",
         xlab="", ylab="Global Active Power (kilowatts)", main="")
    dev.off()
}
