###set the working directory
setwd("/home/ab/Dropbox/projects/JHU_DataScience/eda/project1/data")

###load the data
power= read.table("household_power_consumption.txt",header=TRUE, sep=";",na.strings = "?")

###fix the date field so it is a date variable and add a field for days 
power$Date = as.Date(power$Date, format = "%d/%m/%Y")
subPower$day = weekdays(subPower$Date)

###we only need data from 2 days. This script subsets power by these days
subPower = subset(power, power$Date =="2007-02-01" | power$Date =="2007-02-02") 
subPower$day = as.factor(weekdays(subPower$Date))
subPower$dateTime = strptime( paste(subPower$Date,subPower$Time), format="%Y-%m-%d %H:%M:%S")

### make plot 2
with(subPower, plot(dateTime,Global_active_power, type="l"
                    ,cex.lab=0.8
                    ,cex.axis=0.8
                    ,xlab = ""
                    ,ylab = "Global Active Power (Kilowatts)"))

##print plot2
setwd("/home/ab/Dropbox/projects/JHU_DataScience/eda/project1/plots")
dev.copy(png,'plot2.png', width = 480, height = 480, units = "px")
dev.off()
