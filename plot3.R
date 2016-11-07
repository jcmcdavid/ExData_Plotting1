# plot3.R, John C. McDavid, 11-06-2016
#   from JCM master...ExplorAnal2_Project1.R, John C. McDavid, 11-06-2016

# plot3
setwd("C:\\Users\\jcmcd\\Coursera - Exploratory Data Analysis (II)")    # set desired working dir
ls()                                                                    # list onbjects
rm(list = ls())                                                         # clear existing objects

if (!file.exists("Project_One")) {                                      # create subdir for data file, list files
    dir.create("Project_One")
}
list.files("./Project_One")

windows()                                                              # open graphics device (screen)

# read in data, construct Date + Time var, create R time var
power3 <- read.csv("./Project_One/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")    # read in data
power3b <- power3[which(power3$Date == "1/2/2007" | power3$Date == "2/2/2007"),]                            # power3 in d-m-y format
power3b$DT <- paste(power3b$Date,power3b$Time, sep = " ", collapse = NULL)                                  # construct Date + Time, then R var
power3b$DateTime <- as.POSIXct(strptime(power3b$DT,format="%d/%m/%Y %H:%M:%S"))                             # format is how to read input
colnames(power3b)                                                                                            # var char of data frame
str(power3b)
nrow(power3b)

with(power3b, plot(DateTime, Sub_metering_1, type = "n", ylab="Energy sub metering", xlab=""))              # plot, with mult lines
with(power3b, lines(DateTime,Sub_metering_1,col="black"))
with(power3b, lines(DateTime,Sub_metering_2,col="red"))
with(power3b, lines(DateTime,Sub_metering_3,col="blue"))
legend("topright", lty = 1, lwd = 2.5, col = c("gray", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), text.width = strwidth("Sub_metering_3    "))

dev.copy(png, file = "plot3.png")          # copy to png file, should be 480 x 480 pixels
dev.off()                                  # close png device

# exact replic.
