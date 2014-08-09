##The following code recreates the first plot from the first assignment in
## exdata-005. Histogram of Global Active Power, in kilowatts.
run.plot1 <- function() {
    ##prepData.R contains code for retreiving and preparing data
    source('prepData.R')
    ## this function is in prepData.R
    pc <- prepData()
    
    ## initialize png graphic device with transparent background,
    ## default size is 480x480
    png(file='plot1.png', bg="transparent")
    
    ## plot histogram
    hist(pc$Global_active_power, col='red',
         xlab='Global Active Power (kilowatts)', main='Global Active Power')
    
    ##close graphic device
    dev.off()
}
