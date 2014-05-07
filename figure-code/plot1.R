#PREPARING THE DATA

#Read Data Set
power = read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", stringsAsFactors=FALSE)


#join Dates-Time
power$datetime = paste(power$Date,power$Time, sep=" ")

#Set the Local Timezone of US
Sys.setlocale("LC_TIME","English_US.1252")

#Convert with strptime
power$datetime = strptime(power$datetime, format="%d/%m/%Y %H:%M:%S")
----------------------------------------------------------

#Separate hours forma date
Hours = data.frame( date=power$datetime, time=format(power$datetime, "%H:%M:%S"))

-----------------------------------------------------------
#Convert Date with as.Date()
power$Date = as.Date(power$Date, "%d/%m/%Y")

#Subset between dates.
power.sub = subset(power, Date>=as.Date("2007-02-01")&Date<=as.Date("2007-02-02"))

#Convert data in Numbers
power.sub$Global_active_power = as.numeric(power.sub$Global_active_power)
power.sub$Global_reactive_power = as.numeric(power.sub$Global_reactive_power)
power.sub$Voltage = as.numeric(power.sub$Voltage)
power.sub$Global_intensity = as.numeric(power.sub$Global_intensity)
power.sub$Sub_metering_1 = as.numeric(power.sub$Sub_metering_1)
power.sub$Sub_metering_2 = as.numeric(power.sub$Sub_metering_2)
power.sub$Sub_metering_3 = as.numeric(power.sub$Sub_metering_3)

#Create Plot 1
hist(power.sub$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

#Save plot1 as PNG 480x480
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()

