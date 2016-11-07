# plot2.R, John C. McDavid, 11-06-2016
#   from JCM master...ExplorAnal2_Project1.R, John C. McDavid, 11-06-2016

# plot2
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
powerb$DT <- paste(powerb$Date,powerb$Time, sep = " ", collapse = NULL)                                   # sconstruct Date + Time, then R var
powerb$DateTime <- as.POSIXct(strptime(powerb$DT,format="%d/%m/%Y %H:%M:%S"))                             # format is how to read input
colnames(powerb)                                                                                          # var char of data frame
str(powerb)
nrow(powerb)

plot((powerb$DateTime), powerb$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.copy(png, file = "plot2.png")          # copy to png file, should be 480 x 480 pixels
dev.off()                                  # close png device

# exact replic.
