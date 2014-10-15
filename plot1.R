# initialize path to the data file
path <- "C:\\hh.txt"

# read the data
data <- read.csv(path, sep = ';', na.strings = c('?'))

# subset the data related to  1/2/2007 and 2/2/2007
splitted <- split(data, data$Date)
subseted <- rbind(splitted[['1/2/2007']], splitted[['2/2/2007']])

# draw the histogram and save it into a file
hist(subseted$Global_active_power, col = c('red'), main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, "C:\\plot1.png", height = 480, width = 480)
dev.off()