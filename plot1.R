## Read in the semi colon sperateddata set with Header                                        ##
## i read in the whole data set because i am not sure about a way to read in just what i want ##
power.table<-read.csv2("household_power_consumption.txt")
## reduce data set to only the dates we are interested in  ##
power.table<-power.table[66637:69516,]
## convert factors in Global acotve power column to numeric  ##
power.table[,3]<-as.numeric(as.character(power.table[,3]))
## open png device ##
png(file="plot1.png")
## plot Histogram ##
hist(power.table$Global_active_power,main = "Global Active Power",
          xlab ="Global Active Power (kilowatts)",col = "red")
## close png device  ##
dev.off()