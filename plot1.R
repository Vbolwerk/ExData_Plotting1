rm(list=ls())
setwd("~/Personal development/R course/Part_4")

df <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

df$Date <- as.Date(df$Date, "%d/%m/%Y")

df <-subset(df,Date == as.Date("2007-2-1") | Date == as.Date("2007-2-2"))

df <- df[complete.cases(df),]

df$dateTime <- paste(df$Date, df$Time)


df$dateTime <- strptime(df$dateTime, format="%Y-%m-%d %H:%M:%S")

##Plot 1
hist(x = df$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.copy(png,"plot1.png", width=480, height=480)
dev.off()