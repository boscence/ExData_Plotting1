###set the working directory
setwd("/home/ab/Dropbox/projects/JHU_DataScience/eda/project1/data")

###load the data
power= read.table("household_power_consumption.txt",header=TRUE, sep=";",na.strings = "?")

###fix the date field so it is a date variable and add a field for days 
power$Date = as.Date(power$Date, format = "%d/%m/%Y")

###we only need data from 2 days. This script subsets power by these days
subPower = subset(power, power$Date =="2007-02-01" | power$Date =="2007-02-02") 
subPower$dateTime = strptime( paste(subPower$Date,subPower$Time), format="%Y-%m-%d %H:%M:%S")

### make plot 4
par(mfrow=c(2,2))

with(subPower, plot(dateTime,Global_active_power, type="l"
                    ,cex.lab=0.7
                    ,cex.axis=0.7
                    ,xlab = ""
                    ,ylab = "Global Active Power"))

with(subPower, plot(dateTime,Voltage, type="l"
                    ,cex.lab=0.7
                    ,cex.axis=0.7
                    ,xlab = "datetime"
                    ,ylab = "Voltage"))

with(subPower, plot(dateTime,Sub_metering_1, type="l", col = "Black"
                    ,cex.lab=0.7
                    ,cex.axis=0.7
                    , ylab = "Energy sub metering",xlab = ""))
with(subPower, lines(dateTime,Sub_metering_2, type="l", col = "Red"))
with(subPower, lines(dateTime,Sub_metering_3, type="l", col = "Blue"))
legend("topright"
       , col = c("black", "red", "blue")
       , lty= 1
       , bty = "n"
       ,cex=.8
       , pt.cex = .8
       , legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(subPower, plot(dateTime,Global_reactive_power, type="l"
                    ,cex.lab=0.7
                    ,cex.axis=0.7
                    ,xlab = "datetime"
                    ,ylab = "Global_reactive_power"))


##print plot4
setwd("/home/ab/Dropbox/projects/JHU_DataScience/eda/project1/plots")
dev.copy(png,'plot4.png', width = 480, height = 480, units = "px")
par(mfrow=c(2,2))

with(subPower, plot(dateTime,Global_active_power, type="l"
                    ,cex.lab=0.7
                    ,cex.axis=0.7
                    ,xlab = ""
                    ,ylab = "Global Active Power"))

with(subPower, plot(dateTime,Voltage, type="l"
                    ,cex.lab=0.7
                    ,cex.axis=0.7
                    ,xlab = "datetime"
                    ,ylab = "Voltage"))

with(subPower, plot(dateTime,Sub_metering_1, type="l", col = "Black"
                    ,cex.lab=0.7
                    ,cex.axis=0.7
                    , ylab = "Energy sub metering",xlab = ""))
with(subPower, lines(dateTime,Sub_metering_2, type="l", col = "Red"))
with(subPower, lines(dateTime,Sub_metering_3, type="l", col = "Blue"))
legend("topright"
       , col = c("black", "red", "blue")
       , lty= 1
       , bty = "n"
       ,cex=.8
       , pt.cex = .8
       , legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(subPower, plot(dateTime,Global_reactive_power, type="l"
                    ,cex.lab=0.7
                    ,cex.axis=0.7
                    ,xlab = "datetime"
                    ,ylab = "Global_reactive_power"))

dev.off()
