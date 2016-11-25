##open the file
all_data <- read.csv("/Users/mvasileva/Documents/R analysis/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
all_data$Date <- as.Date(all_data$Date, format="%d/%m/%Y")
##subset the data
data_subset <- subset(all_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(all_data)
## convert dates
datetime <- paste(as.Date(data_subset$Date), data_subset$Time)
data_subset$Datetime <- as.POSIXct(datetime)
## plot chart 4
with(data_subset, {
plot(Global_active_power~Datetime, type="l", 
ylab="Global Active Power (kilowatts)", xlab="")
plot(Voltage~Datetime, type="l", 
ylab="Voltage (volt)", xlab="")
plot(Sub_metering_1~Datetime, type="l", 
ylab="Global Active Power (kilowatts)", xlab="")
lines(Sub_metering_2~Datetime,col='Red')
lines(Sub_metering_3~Datetime,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(Global_reactive_power~Datetime, type="l", 
ylab="Global Rective Power (kilowatts)",xlab="")
})
## save to png 
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
