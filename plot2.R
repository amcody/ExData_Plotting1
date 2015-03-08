library(lubridate)

# Read the data in:
data = read.csv2("household_power_consumption.txt",skip=66637,nrows=2879,stringsAsFactors = FALSE)
names(data) = c("date","time","gap","grp","volt","gi","sm1","sm2","sm3")

# Convert numbers to numeric and place missing data, if any, with nas
data$gap = as.numeric(data$gap)

# Put date and time together:
newdate = dmy(data$date) + hms(data$time)

# Make a png plot:
png('plot2.png')
plot(newdate,data$gap,"l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()

