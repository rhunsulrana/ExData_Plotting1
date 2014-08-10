##This code recreates the 4th and last plot in assignment 1 for
## exdata-005. 4 separate charts on one png.
run.plot4 <- function() {
    ##prepData.R contains code for getting and preparing the data
    source('prepData.R')
    ## This function is in prepData.R
    pc <- prepData()
    
    ##initialize a png graphic device, transparent background
    ## default size is 480x480, type="cairo" let's line width be 0 < x < 1
    ## this is not necessary in linux, as the default type works just fine
    ## and produces a chart in the same quality, but when working on my 
    ## windows device i was having trouble getting the line in the last plot
    ## to be thin enough. this fixes that problem and works fine with linux as well.
    png('plot4.png', bg="transparent", type="cairo")
    
    ##prepare a 2 x 2 grid of plots
    par(mfrow=c(2,2))
    
    #first plot, top left
    plot(pc$Global_active_power ~ pc$datetime, type="l",
         xlab="", ylab="Global Active Power", main="")
    #second plot, top right
    plot(pc$Voltage ~ pc$datetime, type="l",
         xlab="datetime", ylab="Voltage", main="")
    #third plot, bottom left
    plot(pc$Sub_metering_1 ~ pc$datetime, type="n",
         xlab="", ylab="Energy sub metering")
    lines(pc$Sub_metering_1 ~ pc$datetime)
    lines(pc$Sub_metering_2 ~ pc$datetime, col="red")
    lines(pc$Sub_metering_3 ~ pc$datetime, col="blue")
    legend('topright', lwd=1, col=c('black', 'red', 'blue'), bty='n',
           legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
    #fourth plot, bottom right
    plot(pc$Global_reactive_power ~ pc$datetime, type="l",
         xlab="datetime", ylab="Global_reactive_power",
         main="", lwd=.5)
    
    #close graphic device
    dev.off()
}
