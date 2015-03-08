library(lubridate)

# Read the data in:
data = read.csv2("household_power_consumption.txt",skip=66637,nrows=2879,stringsAsFactors = FALSE)
names(data) = c("date","time","gap","grp","volt","gi","sm1","sm2","sm3")

# Convert numbers to numeric and place missing data, if any, with nas
data$gap = as.numeric(data$gap)
data$grp = as.numeric(data$grp)
data$volt = as.numeric(data$volt)
data$sm1 = as.numeric(data$sm1)
data$sm2 = as.numeric(data$sm2)
data$sm3 = as.numeric(data$sm3)

# Put date and time together:
newdate = dmy(data$date) + hms(data$time)

# Make four-panel png plot
png('plot4.png')
par(mfrow=c(2,2))
plot(newdate,data$gap,"l",ylab="Global Active Power (kilowatts)",xlab="")
plot(newdate,data$volt,"l",ylab="Voltage",xlab="datetime")
plot(newdate,data$sm1,"l",ylab="Energy sub metering",xlab="")
points(newdate,data$sm2,"l",col="red")
points(newdate,data$sm3,"l",col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=c(1,1,1),bty="n")
plot(newdate,data$grp,"l",ylab="Global_reactive_power",xlab="datetime")
dev.off()

