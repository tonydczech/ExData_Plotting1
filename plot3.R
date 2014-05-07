plot3 <- function() {
## Read file
	data <- read.table("household_power_consumption.txt",
		skip = 66637, nrow = 2880, sep=";",
		col.names = colnames(read.table("household_power_consumption.txt",
		nrow=1,header=TRUE, sep=";") ))

## Convert Date and Time to DateTime
	data$DateTime <- strptime(paste(data$Date, data$Time),
		format="%d/%m/%Y %H:%M:%S")	
	
## Plot Graph
	plot(data$DateTime,data$Sub_metering_1,type="l",
		ylab="Energy sub metering",xlab="")
	points(data$DateTime,data$Sub_metering_2,col="red",type="l")
	points(data$DateTime,data$Sub_metering_3,col="blue",type="l")

## Add legend
	legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
		,col=c("black","red","blue"),lty=c(1,1,1) )

## Copy to png and save
	dev.copy(png,file="plot3.png")
	dev.off()
}