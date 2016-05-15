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

##We plot the Slobal_active_power for each datetime.
plot(subbase$Global_active_power~subbase$FH, type="l", ylab="Global Active Power (kilowatts)", xlab="")

##We copy the plot in a png format
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
