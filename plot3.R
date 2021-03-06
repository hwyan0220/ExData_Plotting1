setwd('H:/exploratory/assignment')
elec <- read.table('household_power_consumption.txt', header = T, sep = ';', na.strings = '?')

elec1 <- elec
elec1 <- subset(elec1, elec1$Date == '1/2/2007'|elec1$Date == '2/2/2007')

elec1$Time <- strptime(paste(elec1$Date, elec1$Time), '%e/%m/%Y %H:%M:%S')
elec1$Date <- as.Date(elec1$Date, '%e/%m/%Y')

par(mfrow = c(1,1), mar = c(5,4,2,2))

with(elec1, plot(Time, Sub_metering_1, type = 'n', ylab = 'Energy sub metering'))
with(elec1, lines(Time, Sub_metering_1, type = 'l'))
with(elec1, lines(Time, Sub_metering_2, type = 'l', col = 'red'))
with(elec1, lines(Time, Sub_metering_3, type = 'l', col = 'blue'))
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty = 1, col = c('black', 'red', 'blue'))

dev.copy(png, file = 'plot3.png', width = 480, height = 480, units = 'px')
dev.off()
