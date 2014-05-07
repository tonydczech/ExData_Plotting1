plot4 <- function() {
## Read file
	data <- read.table("household_power_consumption.txt",
		skip = 66637, nrow = 2880, sep=";",
		col.names = colnames(read.table("household_power_consumption.txt",
		nrow=1,header=TRUE, sep=";") ))

## Convert Date and Time to DateTime
	data$DateTime <- strptime(paste(data$Date, data$Time),
		format="%d/%m/%Y %H:%M:%S")	
	
## Plot Empty Graph
	par(mfrow = c(2,2))
## Plot 1
	plot(data$DateTime, data$Global_active_power, type="l",
		ylab="Global Active Power (kilowatts)", xlab="")
## Plot 2
	plot(data$DateTime, data$Voltage, type="l",ylab="Voltage",xlab="datetime")
## Plot 3
	plot(data$DateTime,data$Sub_metering_1,type="l",
		ylab="Energy sub metering",xlab="")
	points(data$DateTime,data$Sub_metering_2,col="red",type="l")
	points(data$DateTime,data$Sub_metering_3,col="blue",type="l")

	## Add legend
	legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
		,col=c("black","red","blue"),lty=c(1,1,1),bty="n",cex=.78, pt.cex=1 )
## Plot 4
	plot(data$DateTime, data$Global_reactive_power, type="l",
		ylab="Global_reactive_power", xlab="datetime")


## Copy to png and save
	dev.copy(png,file="plot4.png")
	dev.off()
}