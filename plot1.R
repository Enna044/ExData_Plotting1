##First we read the database "household_power_consumption.txt", specifying the parameters needed
base<-read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?", 
                 check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"')

##We give format to the date
base$Date <- as.Date(base$Date, format="%d/%m/%Y")

##We make a subset for the dates we are going to use. Then we remove the first table
subbase<-subset(base, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(base)

##We make an histogram, changing the Title, the axis labels, and the color
hist(subbase$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

##Finaly, we save the histogram as a png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
