setwd('H:/exploratory/assignment')
elec <- read.table('household_power_consumption.txt', header = T, sep = ';', na.strings = '?')

elec1 <- elec
elec1 <- subset(elec1, elec1$Date == '1/2/2007'|elec1$Date == '2/2/2007')

elec1$Time <- strptime(paste(elec1$Date, elec1$Time), '%e/%m/%Y %H:%M:%S')
elec1$Date <- as.Date(elec1$Date, '%e/%m/%Y')

par(mfrow = c(1,1), mar = c(5,4,2,2))
with(elec1, hist(Global_active_power, main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)', col = 'red'))

dev.copy(png, file = 'plot1.png', width = 480, height = 480, units = 'px')
dev.off()
