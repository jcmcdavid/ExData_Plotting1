# plot4.R, John C. McDavid, 11-06-2016
#   from JCM master...ExplorAnal2_Project1.R, John C. McDavid, 11-06-2016

# plot4
setwd("C:\\Users\\jcmcd\\Coursera - Exploratory Data Analysis (II)")    # set desired working dir
ls()                                                                    # list onbjects
rm(list = ls())                                                         # clear existing objects

if (!file.exists("Project_One")) {                                      # create subdir for data file, list files
    dir.create("Project_One")
}
list.files("./Project_One")

windows()                                                              # open graphics device (screen)

# read in data, construct Date + Time var, create R time var
power <- read.csv("./Project_One/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")   # read in data
powerb <- power[which(power$Date == "1/2/2007" | power$Date == "2/2/2007"),]                              # power in d-m-y format
powerb$DT <- paste(powerb$Date,powerb$Time, sep = " ", collapse = NULL)                                   # construct Date + Time var
powerb$DateTime <- as.POSIXct(strptime(powerb$DT,format="%d/%m/%Y %H:%M:%S"))                             # format is how to read input
colnames(powerb)                                                                                          # var char of data frame
str(powerb)
nrow(powerb)

par(mfrow=c(2,2))                                                                                       # create plot reg - 2 rows, 2 cols
with(powerb, {
    plot(DateTime, Global_active_power, type="l", ylab = "Global Active Power", xlab = "")              # at 1,1
    plot(DateTime, Voltage, type="l", ylab = "Voltage", xlab = "datetime")                              # at 1,2

#    plot(DateTime, Voltage, type="l", ylab = "Voltage", xlab = "datetime222")                          # at 2,1
     plot(DateTime, Sub_metering_1, type = "n", ylab="Energy sub metering", xlab="")
        lines(DateTime,Sub_metering_1,col="black")
        lines(DateTime,Sub_metering_2,col="red")
        lines(DateTime,Sub_metering_3,col="blue")
        legend("topright", lty = 1, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), text.width = strwidth("Sub_metering_3    "))
    
    
    plot(DateTime, Global_reactive_power, type="l", ylab = "Global_reactive_power", xlab = "datetime")  # at 2,2
})

dev.copy(png, file = "plot4.png")          # copy to png file, should be 480 x 480 pixels
dev.off()                                  # close png device

# exact replic.
