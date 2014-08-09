##This code recreates the second plot in assignment 1 of 
## exdata-005. Time series of Global Active Power in kilowatts
run.plot2 <- function() {
    ## prepData.R contains code for retreiving and cleaning data
    source('prepData.R')
    ## this function is in prepData.R
    pc <- prepData()
    
    ## initialize PNG graphic device, transparent background
    ## default size is 480x480
    png('plot2.png', bg="transparent")
    
    ## plot time series
    plot(pc$Global_active_power ~ pc$datetime, type="l",
         xlab="", ylab="Global Active Power (kilowatts)", main="")
    
    ## close graphic device
    dev.off()
}
