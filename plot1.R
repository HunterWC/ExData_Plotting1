pwrdata<-read.table("household_power_consumption.txt", header = T, na.strings = "?",sep=";",stringsAsFactors = FALSE)
pwrdata$Date=strptime(pwrdata$Date, format = "%d/%m/%Y")
subpwrdata1<-pwrdata[pwrdata$Date == "2007-2-1",]
subpwrdata2<-pwrdata[pwrdata$Date == "2007-2-2",]
subpwrdata<-rbind(subpwrdata1,subpwrdata2)
hist(subpwrdata$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")

## create png
png(file="plot1.png")
hist(subpwrdata$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")
dev.off()
