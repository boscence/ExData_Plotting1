###set the working directory
setwd("/home/ab/Dropbox/projects/JHU_DataScience/eda/project1/data")

###load the data
power= read.table("household_power_consumption.txt",header=TRUE, sep=";",na.strings = "?")

###fix the date field so it is a date variable
power$Date = as.Date(power$Date, format = "%d/%m/%Y")

###we only need data from 2 days. This script subsets power by these days
subPower = subset(power, power$Date =="2007-02-01" | power$Date =="2007-02-02") 

### make plot 1
par(mfrow=c(1,1))
hist(subPower$Global_active_power, col = "red", breaks = 20, 
     main = "Global Active Power",cex.axis=.8, ylab = "Frequency",xlab = "Global Active Power (Kilowatts)")

##print plot1
setwd("/home/ab/Dropbox/projects/JHU_DataScience/eda/project1/plots")
dev.copy(png,'plot1.png', width = 480, height = 480, units = "px")
dev.off()

