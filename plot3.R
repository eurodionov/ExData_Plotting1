# initialize path to the data file
path <- "C:\\hh.txt"

# read the data
data <- read.csv(path, sep = ';', na.strings = c('?'))

splitted <- split(data, data$Date)
subseted <- rbind(splitted[['1/2/2007']], splitted[['2/2/2007']])

time_series_1 <- ts(subseted$Sub_metering_1, frequency = 60 * 24, start = c(1,1), end = 2)
time_series_2 <- ts(subseted$Sub_metering_2, frequency = 60 * 24, start = c(1,1), end = 2)
time_series_3 <- ts(subseted$Sub_metering_3, frequency = 60 * 24, start = c(1,1), end = 2)

plot.ts(time_series_1, axes = FALSE, frame.plot= TRUE, ylab = "Energy metering", xlab = NA)
lines(time_series_2, col ="red")
lines(time_series_3, col ="blue")

legend(x = "topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
axis(2)
axis(1, at=c(1,1.5, 2), labels = c("Thu", "Fri", "Sat"))

dev.copy(png, "C:\\plot3.png", height = 480, width = 480)
dev.off()
