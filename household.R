setwd('C:\\Users\\caro\\Desktop\\directory')
house <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)

# Prevents histogram from printing in scientific notation
house[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Change Date Column to Date Type
house[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Filter Dates for 2007-02-01 and 2007-02-02
house <- house[(Date >= "2007-02-01") & (Date <= "2007-02-02")]



## Plot 1
hist(house[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
plot(house$Global_active_power)

png("plot1.png", width=600, height=600)



library("data.table")

setwd('C:\\Users\\caro\\Desktop\\directory')

#Reads in data from file then subsets data for specified dates
house <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)

# Prevents Scientific Notation
house[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Making a POSIXct date capable of being filtered and graphed by time of day
house[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates for 2007-02-01 and 2007-02-02
house <- house[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]



## Plot 2
plot(x = house[, dateTime]
     , y = house[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

png("plot2.png", width=600, height=600)
dev.off()


library("data.table")
setwd('C:\\Users\\caro\\Desktop\\directory')

#Reads in data from file then subsets data for specified dates
house <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)

# Prevents Scientific Notation
house[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Making a POSIXct date capable of being filtered and graphed by time of day
house[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates for 2007-02-01 and 2007-02-02
house <- house[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]



# Plot 3
plot(house[, dateTime], house[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(house[, dateTime], house[, Sub_metering_2],col="red")
lines(house[, dateTime], house[, Sub_metering_3],col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))
png("plot3.png", width=600, height=600)
dev.off()


library("data.table")

setwd('C:\\Users\\caro\\Desktop\\directory')

#Reads in data from file then subsets data for specified dates
house <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)

# Prevents Scientific Notation
house[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Making a POSIXct date capable of being filtered and graphed by time of day
house[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates for 2007-02-01 and 2007-02-02
house <- house[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]



par(mfrow=c(2,2))

# Plot 1
plot(house[, dateTime], house[, Global_active_power], type="l", xlab="", ylab="Global Active Power")

# Plot 2
plot(house[, dateTime],house[, Voltage], type="l", xlab="datetime", ylab="Voltage")

# Plot 3
plot(house[, dateTime], house[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(house[, dateTime], house[, Sub_metering_2], col="red")
lines(house[, dateTime], house[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty=c(1,1)
       , bty="n"
       , cex=.5) 

# Plot 4
plot(house[, dateTime], house[,Global_reactive_power], type="l", xlab="datetime", ylab="Global_reactive_power")
png("plot4.png", width=600, height=600)
dev.off()