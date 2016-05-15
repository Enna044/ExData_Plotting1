##First we read the database "household_power_consumption.txt", specifying the parameters needed
base<-read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?", 
                 check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"')

##We give format to the date
base$Date <- as.Date(base$Date, format="%d/%m/%Y")

##We make a subset for the dates we are going to use. Then we remove the first table
subbase<-subset(base, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(base)

##We change the format of date-time, to have the information in a single variable
subbase$FH<-as.POSIXct(paste(as.Date(subbase$Date), subbase$Time))

##We specify that we want 2 graphs per column and 2 graphs per row
par(mfrow=c(2,2))
##We make the for plots asked.
##First, the one with Global_active_power per datetime
##Then, the voltage per datetime
##Then, we repeat the process of the third plot
##Finally, the Global_reactive_power per datetime
with(subbase, {
  plot(Global_active_power~FH, type="l", ylab="Global Active Power", xlab="")
  plot(Voltage~FH, type="l", ylab="Voltage", xlab="")
  plot(Sub_metering_1~FH, type="l", ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~FH,col='Red')
  lines(Sub_metering_3~FH,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~FH, type="l", ylab="Global_Rective_Power",xlab="")
})

##Finaly, we save the histogram as a png file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
