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
png(filename = "plot2.png", width = 480, height = 480)
par(mfrow=c(1,1))
plot(data$V3,type = "l",xaxt="n",ylab = "Global Active Power(kilowatts)",xlab="")
axis(1,at=c(0,length(data$V3)/2,length(data$V3)),labels=c("Thu","Fri","Sat"))
dev.off()
