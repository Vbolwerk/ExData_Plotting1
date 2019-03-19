rm(list=ls())
setwd("~/Personal development/R course/Part_4")

df <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

df$Date <- as.Date(df$Date, "%d/%m/%Y")

df <-subset(df,Date == as.Date("2007-2-1") | Date == as.Date("2007-2-2"))

df <- df[complete.cases(df),]

df$dateTime <- paste(df$Date, df$Time)

df$dateTime <- strptime(df$dateTime, format="%Y-%m-%d %H:%M:%S")


##Plot 4
plot(y = df$Sub_metering_1, x = df$dateTime,col="Red", type = "l", ylab="Global Active Power (kilowatts)", xlab="")
lines(y = df$Sub_metering_2, x = df$dateTime, col="Red")
lines(y = df$Sub_metering_3, x = df$dateTime, col="Blue")
legend("topright", lwd=c(1,1,1), col=c("black", "red", "blue"),  c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.copy(png,"plot4.png", width=480, height=480)
dev.off()