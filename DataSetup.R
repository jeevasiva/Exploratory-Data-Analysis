 downloadURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
 downloadFile <- "./Data/household_power_consumption.zip"
 householdFile <- "./Data/household_power_consumption.txt"
 if (!file.exists(householdFile)) {
   download.file(downloadURL, downloadFile, method = "curl")
   unzip(downloadFile, overwrite = T, exdir = "./Data")
 }
 
 plotData <- read.table(householdFile, header=T, sep=";", na.strings="?")
 finalData <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]
 SetTime <-strptime(paste(finalData$Date, finalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
 finalData <- cbind(SetTime, finalData)
