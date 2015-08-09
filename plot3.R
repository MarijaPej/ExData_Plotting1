
##################################################
###     COURSERA - EXPLORATORY DATA ANALYSIS   ###
###             COURSE PROJECT 1               ###
###          Marija Pejcinovska                ###
###                                            ###
###               PLOT   3                     ###
##################################################

setwd("~/Documents/MARIJA/GitHubStuff/ExData_Plotting1")
file<-"~/Documents/MARIJA/Marija - Coursera/Data Science Specialization/04 - Exploratory Data Analysis/Project1/household_power_consumption.txt"
## Full data
datafull<-read.csv(file, sep=";", na.strings=c("?"), colClasses=c(rep("character",2),rep("numeric", 7)))

## Subsetting the two days only
datasub<-datafull[datafull$Date %in% c("1/2/2007","2/2/2007") ,]

##  Creating Date/Time class variables
datetime <- strptime(paste(datasub$Date, datasub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
datasub$DateTime<-datetime

## Plot 3
png(filename="plot3.png", width=480, height=480,units="px")
plot(datasub$DateTime,datasub$Sub_metering_1, type="l", xlab="", ylab = "Energy sub metering")
lines(datasub$DateTime,datasub$Sub_metering_2, type="l", col="red")
lines(datasub$DateTime, datasub$Sub_metering_3, col="blue")
legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=1, text.font=6, cex=0.75)
dev.off()


