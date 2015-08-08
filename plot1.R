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
hist(subpwrdata$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")

# create png file
png(file="plot1.png")  #note default for width and height = 480 pixels
hist(subpwrdata$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")
dev.off()
