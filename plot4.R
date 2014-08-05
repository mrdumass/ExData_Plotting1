## Read in the semi colon sperateddata set with Header                                        ##
## i read in the whole data set because i am not sure about a way to read in just what i want ##
power.table<-read.csv2("household_power_consumption.txt")
## reduce data set to only the dates we are interested in  ##
power.table<-power.table[66637:69516,]
## convert factors in submetering 1-3 to numeric  ##
## convert date to a usable date for ploting and combine in the time column ##
power.table$Date<-strptime(paste(power.table$Date,power.table$Time), "%d/%m/%Y %H:%M:%S")
## convert factors in Global acotve power column to numeric  ##
power.table[,3]<-as.numeric(as.character(power.table[,3]))
## convert factors in Voltage to numeric ##
power.table[,5]<-as.numeric(as.character(power.table[,5]))
## convert facts to numeric for Global reactive power
power.table[,4]<-as.numeric(as.character(power.table[,4]))
## covert submetering to numeric  ##
for (i in 7:9) {
  power.table[,i]<-as.numeric(as.character(power.table[,i]))
}
## open png device ##
png(file="plot4.png")
## plot the four graph in one frame ##
par(mfrow=c(2,2))
## plot Histogram ##
hist(power.table[,3],main = "Global Active Power",
     xlab ="Global Active Power (kilowatts)",col = "red")
## plot the voltge ##
plot(power.table[,1],power.table[,4],type="l",ylab="Voltage",xlab="datetime")
## plot the sub metering ##
plot(power.table[,1],power.table[,7],type ="l",xlab ="", ylab= "Energy sub metering")
lines(power.table[,1],power.table[,8],col="red")
lines(power.table[,1],power.table[,9],col="blue")
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=1)
## plot Global reactive power ##
plot(power.table[,1],power.table[,5],type="l",ylab="Global_reactive_power",xlab="datetime")
## close png device  ##
dev.off()