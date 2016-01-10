# Read de Data and select the dates
household <- read.csv("./household_power_consumption.txt", sep=";", quote="", stringsAsFactors=FALSE)
selectedRow<-household[(household$Date=="1/2/2007") | (household$Date=="2/2/2007"),]

# prepare date vector
concatdate <- paste(as.Date(selectedRow$Date, format="%d/%m/%Y"),selectedRow$Time, sep = " ")
cc<-strptime(concatdate, format="%Y-%m-%d %H:%M:%S")

# prepare y values (they were read as strings)
GAP<-as.numeric(selectedRow$Global_active_power)

# open graphic device
png(filename="Plot2.png", width = 480, height = 480, units = "px")

# Plot
plot(as.POSIXlt(cc),GAP,type="l",xlab = "",ylab="Global Active Power (kilowatts)")

# close graphic device
dev.off()