file <- "/Users/vanessachanliau/Documents/Exploratory Data Analysis/household_power_consumption.txt"
vars <- c("character", "character", rep("numeric", 7))
dat <- read.table(file, h=1, sep=";", colClasses=vars, na.strings="?")
dat$datetime <- strptime( paste (dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S")
asDate <- as.Date(dat$Date, format="%d/%m/%Y")
dat$Date  <- asDate
datsub  <- dat[dat$Date==("2007-02-01")|dat$Date==("2007-02-02"),]

## Plot 2
png(filename="/Users/vanessachanliau/Documents/Exploratory Data Analysis/course project 1/plot2.png")
plot(datsub$datetime, datsub$Global_active_power,
     type="l",
     xlab = NA,
     ylab = "Global Active Power (kilowatts)")
dev.off()