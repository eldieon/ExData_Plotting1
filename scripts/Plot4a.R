library(data.table)
file <- "/Users/vanessachanliau/Documents/Exploratory Data Analysis/household_power_consumption.txt"
vars <- c("character", "character", rep("numeric", 7))
dat <- read.table(file, h=1, sep=";", colClasses=vars, na.strings="?")
dat$datetime <- strptime( paste (dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S")
asDate <- as.Date(dat$Date, format="%d/%m/%Y")
dat$Date  <- asDate
datsub  <- dat[dat$Date==("2007-02-01")|dat$Date==("2007-02-02"),]

## Plot 4
png(filename="/Users/vanessachanliau/Documents/Exploratory Data Analysis/course project 1/plot4.png")
par(mfrow=c(2,2))
plot(datsub$datetime, datsub$Global_active_power,
     type="l",
     xlab = NA,
     ylab = "Global Active Power (kilowatts)")

plot(datsub$datetime, datsub$Voltage,
     type ="l",
     xlab = "datetime",
     ylab ="Voltage")

plot(datsub$datetime, datsub$Sub_metering_1,
     type="l",
     xlab=NA,
     ylab="Energy sub metering",
     col="black")
lines(datsub$datetime, datsub$Sub_metering_2, col="red")
lines(datsub$datetime, datsub$Sub_metering_3, col="blue")
legend("topright", 
       legend = c("Sub_metering_1", 
                  "Sub_metering_2", 
                  "Sub_metering_3"), 
       col = c("black", "red", "blue"),
       lwd = 1, 
       cex = 1)

plot(datsub$datetime, datsub$Global_reactive_power,
     type ="l",
     xlab = "datetime",
     ylab = "Global_reactive_power")
dev.off()
