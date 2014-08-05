## Read in the semi colon sperated data set with Header                                        ##
## i read in the whole data set because i am not sure about a way to read in just what i want  ##
power.table<-read.csv2("household_power_consumption.txt")
## reduce data set to only the dates we are interested in  ##
power.table<-power.table[66637:69516,]
## convert factors in submetering 1-3 to numeric  ##
## convert date to a usable date for ploting and combine in the time column ##
power.table$Date<-strptime(paste(power.table$Date,power.table$Time), "%d/%m/%Y %H:%M:%S")
## covert submetering to numeric  ##
for (i in 7:9) {
  power.table[,i]<-as.numeric(as.character(power.table[,i]))
}
## open png device ##
png(file="plot2.png")
## plot line graph ##
plot(power.table[,1],power.table[,7]),type ="l",xlab ="", ylab= "Energy sub metering")
lines(power.table[,1],power.table[,8],col="red")
lines(power.table[,1],power.table[,9],col="blue")
## close png device  ##
dev.off()