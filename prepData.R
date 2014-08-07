prepData <- function(){
    fileUrl <- paste('https://d396qusza40orc.cloudfront.net',
        'exdata%2Fdata%2Fhousehold_power_consumption.zip',
        sep="/")
    download.file(fileUrl, 'household_power.zip',
                  method='curl')
    x <- unzip('household_power.zip')
    
    data <- fread('household_power_consumption.txt', sep=";", skip="1/2/2007",
                 nrow=2880, header=F, na.strings="?")
    
    colNames <- fread('household_power_consumption.txt',
                   sep=";", nrow=1, header=F)
    
    setnames(data, names(data), as.character(colNames[1,]))
    
    data[, datetime:=as.POSIXct(paste(Date, Time, sep=" "),
                            format="%d/%m/%Y %H:%M:%S")]
    
    return(data)
}
