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

## Generate Plot 4
png(filename='plot4.png',width=480,height=480,units='px')
par(mfrow = c(2, 2))

## plot 1 (NW)
plot(finalData$SetTime, finalData$Global_active_power, type = "l", ylab = "Global Active Power", 
    xlab = "")

## plot 2 (NE)
plot(finalData$SetTime, finalData$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

## plot 3 (SW)
plot(finalData$SetTime, finalData$Sub_metering_1, type = "l", ylab = "Energy sub metering", 
    xlab = "", col = "black")
points(finalData$SetTime, finalData$Sub_metering_2, type = "l", xlab = "", ylab = "Sub_metering_2", 
    col = "red")
points(finalData$SetTime, finalData$Sub_metering_3, type = "l", xlab = "", ylab = "Sub_metering_3", 
    col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", 
    "Sub_metering_2", "Sub_metering_3"), bty = "n", )

## plot 4 (SE)
plot(finalData$SetTime, finalData$Global_reactive_power, type = "l", xlab = "datetime", 
    ylab = "Global_reactive_power", ylim = c(0, 0.5))
dev.off()

