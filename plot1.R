my_data <- read.delim("household_power_consumption.txt",
                      header=TRUE,sep=";",dec=".")
 
my_data$Date2<-as.Date(my_data$Date,"%d/%m/%Y")
my_data2<-subset(my_data, (Date2<=as.Date("2007-02-02"))&(Date2>=as.Date("2007-02-01")))


png(filename = "plot1.png",width = 480,height=480,units = "px")
hist(as.numeric(my_data2$Global_active_power),col="red",
     xlab ="Global Active Power (kilowatts)",
          main="Global Active Power")
dev.off