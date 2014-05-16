install.packages("sqldf")
library(sqldf)
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myData <- read.csv2.sql("household_power_consumption.txt",mySql)
hist(myData$Global_active_power,col="red",main="global active power",xlab="global active power(kilowatt)")
dev.copy(png, file="plot1.png",width=480,height=480)
dev.off()