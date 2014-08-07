run.plot1 <- function() {
    source('prepData.R')
    pc <- prepData()
    png(file='plot1.png')
    hist(pc$Global_active_power, col='red',
         xlab='Global Active Power (kilowatts)', main='Global Active Power')
    dev.off()
}
