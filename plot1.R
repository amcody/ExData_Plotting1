# Read the data in:
data = read.csv2("household_power_consumption.txt",skip=66637,nrows=2879,stringsAsFactors = FALSE)
names(data) = c("date","time","gap","grp","volt","gi","sm1","sm2","sm3")

# Convert numbers to numeric 
data$gap = as.numeric(data$gap)

# Make a png plot:
png('plot1.png')
hist(data$gap,breaks=12,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.off()
