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

##We make the plot for each Sub_metering_i, for each datetime. 
##We also add the legend on the topright
with(subbase, {plot(Sub_metering_1~FH, type="l",ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~FH,col='Red')
  lines(Sub_metering_3~FH,col='Blue')
  })
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Finaly, we save the histogram as a png file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()