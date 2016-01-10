# Read de Data and select the dates
household <- read.csv("./household_power_consumption.txt", sep=";", quote="", stringsAsFactors=FALSE)
selectedRow<-household[(household$Date=="1/2/2007") | (household$Date=="2/2/2007"),]

# open graphic device
png(filename="Plot1.png", width = 480, height = 480, units = "px")

# plot
hist(as.numeric(selectedRow$Global_active_power),col = 'red',main = 'Global Active Power',xlab = 'Global Active Power (kilowatts)')

# close graphic device
dev.off()
