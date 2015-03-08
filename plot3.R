library(lubridate)

# Read the data in:
data = read.csv2("household_power_consumption.txt",skip=66637,nrows=2879,stringsAsFactors = FALSE)
names(data) = c("date","time","gap","grp","volt","gi","sm1","sm2","sm3")

# Convert numbers to numeric and place missing data, if any, with nas
data$sm1 = as.numeric(data$sm1)
data$sm2 = as.numeric(data$sm2)
data$sm3 = as.numeric(data$sm3)

# Put date and time together:
newdate = dmy(data$date) + hms(data$time)

# Make a png plot:
png('plot3.png')
plot(newdate,data$sm1,"l",ylab="Energy sub metering",xlab="")
points(newdate,data$sm2,"l",col="red")
points(newdate,data$sm3,"l",col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=c(1,1,1))
dev.off()

