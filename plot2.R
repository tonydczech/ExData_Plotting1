plot2 <- function() {
## Read file
	data <- read.table("household_power_consumption.txt",
		skip = 66637, nrow = 2880, sep=";",
		col.names = colnames(read.table("household_power_consumption.txt",
		nrow=1,header=TRUE, sep=";") ))

## Convert Date and Time to DateTime
	data$DateTime <- strptime(paste(data$Date, data$Time),
		format="%d/%m/%Y %H:%M:%S")	
	
## Plot Graph
	plot(data$DateTime,data$Global_active_power,type="l",
		ylab="Global Active Power (kilowatts)",xlab="")



## Copy to png and save
	dev.copy(png,file="plot3.png")
	dev.off()
}