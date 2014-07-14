source('./download.R')

hist(data$V3, col='red', xlab='Global Active Power (kilowatts)', main='Global Active Power')

dev.copy(png, file = 'plot1.png')
dev.off()