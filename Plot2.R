setwd("C:/Users/erik_/Documents/Exploratory Data Analysis")

############# read and format Data #############

hhld = read.table("household_power_consumption.txt", header = TRUE, sep = ";")

hhld$Date = as.Date(hhld$Date, format = "%d/%m/%Y")

mydata = subset(hhld, Date == as.Date("2007-02-01", "%Y-%m-%d") | Date == as.Date("2007-02-02", "%Y-%m-%d"))

mydata$Global_active_power = as.numeric(as.character(mydata$Global_active_power))

mydata$DateTime = strptime(paste(as.character(mydata$Date), as.character(mydata$Time)), format = "%Y-%m-%d %H:%M:%S")

############ make graph ##############

png(filename = "plot2.png", width = 480, height = 480)

plot(mydata$DateTime, mydata$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()
