# Read de Data and select the dates
household <- read.csv("./household_power_consumption.txt", sep=";", quote="", stringsAsFactors=FALSE)
selectedRow<-household[(household$Date=="1/2/2007") | (household$Date=="2/2/2007"),]

# prepare date vector
concatdate <- paste(as.Date(selectedRow$Date, format="%d/%m/%Y"),selectedRow$Time, sep = " ")
cc<-strptime(concatdate, format="%Y-%m-%d %H:%M:%S")

# prepare y values (they were read as strings)
sm1<-as.numeric(selectedRow$Sub_metering_1)
sm2<-as.numeric(selectedRow$Sub_metering_2)
sm3<-as.numeric(selectedRow$Sub_metering_3)

# open graphic device
png(filename="Plot3.png", width = 480, height = 480, units = "px")

# plot
plot(as.POSIXlt(cc),sm1,type="l",xlab = "",ylab="Energy sub metering",col="black")
lines(as.POSIXlt(cc),sm2,col="red")
lines(as.POSIXlt(cc),sm3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# close graphic device
dev.off()