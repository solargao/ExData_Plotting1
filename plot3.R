#Get the dates and time of the firt and begin in the dataset
sample <- read.table("household_power_consumption.txt",nrows = 10,sep = ";",na.strings = "?",header = T)
firstDateTime  <- strptime(paste(as.character(sample$Date[1]),as.character(sample$Time[1])),"%d/%m/%Y %H:%M:%S")
beginDateTime <- strptime("2007-02-01 00:01:00", "%Y-%m-%d %H:%M:%S")
#Calculate which lines to read in
begin <- beginDateTime - firstDateTime
beginLine <- as.numeric(begin)*24*60
numLinesToRead <- 48*60 
#Read data
data <- read.table("household_power_consumption.txt",nrows = numLinesToRead,sep = ";",na.strings = "?",skip = beginLine-1)
#Plot and save as PNG
png(filename = "plot3.png", width = 480, height = 480)
par(mfrow=c(1,1))
plot(data$V7,type = "n",xaxt="n",ylab = "Energy sub metering",xlab="")
points(data$V7,type = "l")
points(data$V8,type = "l",col="red")
points(data$V9,type = "l",col="blue")
axis(1,at=c(0,length(data$V7)/2,length(data$V7)),labels=c("Thu","Fri","Sat"))
legend("topright",legend = c("Sub_metering_1","Sub_metering_3","Sub_metering_3") ,col = c("black","red","blue"),lty=1,cex=1)
dev.off()
