##This code recreates the third graph in assignment 1 of 
## exdata-005. Time Series of 3 sub metering stations
run.plot3 <- function() {
    ##prepData.R contains code for retreiving and cleaning data
    source('prepData.R')
    ## this function is in prepData.R
    pc <- prepData()
    
    ## initialize a png graphic device, transparent background
    ## default size is 480x480
    png('plot3.png', bg="transparent")
    
    ## Set up plotting space, do not graph lines
    plot(pc$Sub_metering_1 ~ pc$datetime, type="n",
         xlab="", ylab="Energy sub metering")
    
    ## sub metering 1 line
    lines(pc$Sub_metering_1 ~ pc$datetime)
    
    ## sub metering 2 line
    lines(pc$Sub_metering_2 ~ pc$datetime, col="red")
    
    ## sub metering 3 line
    lines(pc$Sub_metering_3 ~ pc$datetime, col="blue")
    
    ## Set up and display legend
    legend('topright', lwd=1, col=c('black', 'red', 'blue'), bty='n',
           legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
    
    ## close graphic device
    dev.off()
}
