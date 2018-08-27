my_data <- read.delim("household_power_consumption.txt",
                      header=TRUE,sep=";",dec=".")
 
my_data$Date2<-as.Date(my_data$Date,"%d/%m/%Y")
my_data2<-subset(my_data, (Date2<=as.Date("2007-02-02"))&(Date2>=as.Date("2007-02-01")))


 
mytime<- strptime((paste(my_data2$Date,my_data2$Time)), "%d/%m/%Y %H:%M:%S") 
 
png(filename = "plot3.png",width = 480,height=480,units = "px")
cc1<-as.numeric(levels(my_data2$Sub_metering_1))[as.integer(my_data2$Sub_metering_1)]
cc2<-as.numeric(levels(my_data2$Sub_metering_2))[as.integer(my_data2$Sub_metering_2)]

plot(mytime,cc1, type="l", xlab="",ylab ="Energy sub metering",col="black")
lines(mytime,cc2, col="red")
lines(mytime,my_data2$Sub_metering_3, col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off
