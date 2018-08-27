my_data <- read.delim("household_power_consumption.txt",
                      header=TRUE,sep=";",dec=".")
 
my_data$Date2<-as.Date(my_data$Date,"%d/%m/%Y")
my_data2<-subset(my_data, (Date2<=as.Date("2007-02-02"))&(Date2>=as.Date("2007-02-01")))

png(filename = "plot2.png",width = 480,height=480,units = "px")
mytime<- strptime((paste(my_data2$Date,my_data2$Time)), "%d/%m/%Y %H:%M:%S") 
plot(mytime,as.numeric(levels(my_data2$Global_active_power))[as.integer(my_data2$Global_active_power)], 
     ylab ="Global Active Power (kilowatts)",type="l")
dev.off