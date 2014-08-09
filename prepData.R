## this code retreives, cleans, and returns the power consumption data
## for programming assignment 1 of exdata-005
prepData <- function(){
  ## this code relies on the data.table package.
  library(data.table)
  
  ## check if this file already exists, for the sake of this assigment
  ## i'm going to assume that if it exists it's the correct file
  if (!file.exists('household_power_consumption.txt')) {
    ## if it doesn't exist in the working directory, retreive it
    getData()
  }
  
  ##once we know the file is here, read the correct rows.
  ##since i know for the sake of this assigment the data is in order, we can
  ## take advantage of the skip and nrow functions to only read the two days' data
  ## we want for these charts.
  data <- fread('household_power_consumption.txt', sep=";", skip="1/2/2007",
                nrow=2880, header=F, na.strings="?")
  
  ## read the column names from the file, since the header was skipped during read.
  colNames <- fread('household_power_consumption.txt',
                    sep=";", nrow=1, header=F)
  
  ##set the column names for the data.table
  setnames(data, names(data), as.character(colNames[1,]))
  
  ##set a new column with a POSIXct datetime variable for
  ##use in our time series charts.
  data[, datetime:=as.POSIXct(paste(Date, Time, sep=" "),
                              format="%d/%m/%Y %H:%M:%S")]
  
  return(data)
}

##this function is only called if the 'household_power_consumption.txt'
## file does not exist in the current working directory.
getData <- function() {
  ##using paste to avoid a huge messy line break problem...
  fileUrl <- paste('https://d396qusza40orc.cloudfront.net',
                   'exdata%2Fdata%2Fhousehold_power_consumption.zip',
                   sep="/")
  
  ##i originally wrote this on linux, and was trying to work on it
  ## on a different machine an ran into an issue where windows didn't have
  ## support for CURL, so i added a switch here. Auto seems to work fine in
  ## windows - not sure if it would also work equally well in Mac OS
  if (.Platform$OS.type == 'unix') {
    #This fixes unsupported https URL schemes in linux
    method = 'curl'
  } else {
    method = 'auto'
  }
  
  ## download the file to a local zip file
  download.file(fileUrl, 'household_power.zip',
                method=method)
  
  ##unzip the file into the working directory
  x <- unzip('household_power.zip')
}
