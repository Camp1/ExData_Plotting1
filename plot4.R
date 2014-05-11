## EDA May 2014
## plot4.R

## Read 2881 rows since plot has tick and label for Saturday
hpc <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2881, 
           sep = ";", na.strings="?",
           col.names = colnames(read.table(
           "household_power_consumption.txt", nrow = 1, header = TRUE, sep=";"))) 

## convert Date and Time from factor to character
 hpc[, 1] <- as.character(hpc[, 1])
 hpc[, 2] <- as.character(hpc[, 2])

## set the Saturday power measurements to NA
for(i in 3:9){
  hpc[2881, i] <- NA
}

## make interval for x-axis. 
 # Nothing with dates on x-axis, so only
 # need consecutive integers. Thursday
 # starts at 1, Friday at 1441, Saturday at 2881. 

datetime <- 1:2881 
hpc <- cbind(datetime, hpc)

## set PNG width and height to 480 pixels
  png("plot4.png", width=480, height=480)

  par(mfcol = c(2,2))

# use with() so don't continually specify dataframe 
  with(hpc, {

## make plot1
  plot(datetime, Global_active_power, type="l",
       axes=FALSE, xlab="", ylab="Global Active Power")
  axis(1, at= c(1, 1441, 2881), labels = c("Thu", "Fri", "Sat"))
  axis(2)
  box()  # to make it look "as usual"

## make plot2
  plot(datetime, Sub_metering_1, type="l",
       axes=FALSE, xlab="", ylab="Energy sub metering")
  lines(datetime, Sub_metering_2, col="red")
  lines(datetime, Sub_metering_3, col="blue")
  axis(1, at= c(1, 1441, 2881), labels = c("Thu", "Fri", "Sat"))
  axis(2)
  legend("topright", box.lty= 0, lty = 1 , col=c("black", "red", "blue"),
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  box()

## make plot3
  plot(datetime, Voltage, type="l", axes=FALSE)
  axis(1, at= c(1, 1441, 2881), labels = c("Thu", "Fri", "Sat"))
  axis(2)
  box()

## make plot4
  plot(datetime, Global_reactive_power, type="l", axes=FALSE)
  axis(1, at= c(1, 1441, 2881), labels = c("Thu", "Fri", "Sat"))
  axis(2)
  box()
  })

dev.off()

