## Read in the semi colon sperateddata set with Header                                        ##
## i read in the whole data set because i am not sure about a way to read in just what i want ##
power.table<-read.csv2("household_power_consumption.txt")
## reduce data set to only the dates we are interested in  ##
power.table<-power.table[66637:69516,]
## convert factors in Global acotve power column to numeric  ##
power.table[,3]<-as.numeric(as.character(power.table[,3]))
## convert date to a usable date for ploting and combine in the time column ##
power.table$Date<-strptime(paste(power.table$Date,power.table$Time), "%d/%m/%Y %H:%M:%S")
## open png device ##
png(file="plot2.png")
## plot line graph ##
plot(power.table[,1],power.table[,3],type ="l",xlab ="", ylab= "Global Active Power (kilowatts)")
## close png device  ##
dev.off()