##open the file
all_data <- read.csv("/Users/mvasileva/Documents/R analysis/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
all_data$Date <- as.Date(all_data$Date, format="%d/%m/%Y")
##subset the data
data_subset <- subset(all_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(all_data)
## convert dates
datetime <- paste(as.Date(data_subset$Date), data_subset$Time)
data_subset$Datetime <- as.POSIXct(datetime)
## histogram chart 
hist(data_subset$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
## save to png 
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

