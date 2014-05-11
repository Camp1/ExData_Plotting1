## EDA May 2014
## plot2.R

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
 # Could use functions to put Date and Time
 # together, then convert to intervals 
 # with as.POSIXct(), but all we need is
 # consecutive integers. Thursday begins at 1, 
 # Friday at 1441 and Saturday at 2881. 

datetime <- 1:2881 
hpc <- cbind(datetime, hpc)

## set PNG width and height to 480 pixels
png("plot2.png", width=480, height=480)

## make plot2
plot(hpc$datetime, hpc$Global_active_power, type="l",
     axes=FALSE, xlab="", ylab="Global Active Power (kilowatts)")
axis(1, at= c(1, 1441, 2881), labels = c("Thu", "Fri", "Sat"))
axis(2)
box()  # to make it look "as usual"

dev.off()

