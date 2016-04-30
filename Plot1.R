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

## Generate Plot 1
png(filename='plot1.png',width=480,height=480,units='px')
hist(finalData$Global_active_power, main = "Global Active Power", ylab = "Frequency", 
    xlab = "Global Active Power (kilowatts)", col = "red", breaks = 13, ylim = c(0, 
        1200), xlim = c(0, 6), xaxp = c(0, 6, 3))
dev.off()
