# download the electric power consumption dataset from the UC Irvine Machine Learning Repository to a temp file.
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
pwrdata <- read.table(unz(temp, "household_power_consumption.txt"), header = T, na.strings = "?", sep=";",stringsAsFactors = FALSE)
unlink(temp)

#subset data
pwrdata$Date=strptime(pwrdata$Date, format = "%d/%m/%Y")
subpwrdata1<-pwrdata[pwrdata$Date == "2007-2-1",]
subpwrdata2<-pwrdata[pwrdata$Date == "2007-2-2",]
subpwrdata<-rbind(subpwrdata1,subpwrdata2)

#create exploratory graph
pwrdatetime<-as.POSIXct(paste(subpwrdata$Date, subpwrdata$Time), format="%Y-%m-%d %H:%M:%S")
plot(pwrdatetime, subpwrdata$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "n")
lines(pwrdatetime, subpwrdata$Sub_metering_1, col="black")
lines(pwrdatetime, subpwrdata$Sub_metering_2, col="red")
lines(pwrdatetime, subpwrdata$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=1, lwd=1)

# create png file
png(file="plot3.png")  #note default for width and height = 480 pixels
plot(pwrdatetime, subpwrdata$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "n")
lines(pwrdatetime, subpwrdata$Sub_metering_1, col="black")
lines(pwrdatetime, subpwrdata$Sub_metering_2, col="red")
lines(pwrdatetime, subpwrdata$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=1, lwd=1)
dev.off()
