install.packages("sqldf")
library('sqldf')
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myData <- read.csv2.sql("household_power_consumption.txt",mySql)
DateTime<-paste(myData$Date,myData$Time)
SDateTime<-strptime(DateTime,"%d/%m/%Y %H:%M:%S")
SSDateTime<-as.POSIXct(SDateTime)
par(mfcol=c(2,2))
#
#Frist plot
#
plot(myData$Global_active_power~SSDateTime,type="l",ylab="global active power", xlab="")
#
#2nd plot
#
plot(myData$Sub_metering_1~SSDateTime,type="l",ylab="energy sub metering",xlab="")
lines(myData$Sub_metering_2~SSDateTime,type="l",col="red")
lines(myData$Sub_metering_3~SSDateTime,type="l",col="blue")
legend("topright", legend=c("sub_metering_1", "sub_metering_2", "sub_metering_3"), col = c("black","red","blue"),cex=0.5,lty="solid")
#
#3rd plot
#
plot(myData$Voltage~SSDateTime,type="l",ylab="Voltage",xlab="Datetime")
#
#4th plot
#
plot(myData$Global_reactive_power~SSDateTime,type="l",ylab="Global reactive power",xlab="Datetime")

dev.copy(png, file="plot4.png",width=480,height=480)
dev.off()
