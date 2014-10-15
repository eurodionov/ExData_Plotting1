# initialize path to the data file
path <- "C:\\hh.txt"

# read the data
data <- read.csv(path, sep = ';', na.strings = c('?'))

splitted <- split(data, data$Date)
subseted <- rbind(splitted[['1/2/2007']], splitted[['2/2/2007']])

time_series <- ts(subseted$Global_active_power, frequency = 60 * 24, start = c(1,1), end = 2)

plot.ts(time_series, axes = FALSE, frame.plot= TRUE, ylab = "Global Active Power (kilowatts)", xlab = NA)
axis(2)
axis(1, at=c(1,1.5, 2), labels = c("Thu", "Fri", "Sat"))
dev.copy(png, "C:\\plot2.png", height = 480, width = 480)
dev.off()
