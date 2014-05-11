## EDA May 2014
## plot1.R

hpc <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, 
           sep = ";", na.strings="?",
           col.names = colnames(read.table(
           "household_power_consumption.txt", nrow = 1, header = TRUE, sep=";"))) 

## convert Date and Time from factor to character
 hpc[, 1] <- as.character(hpc[, 1])
 hpc[, 2] <- as.character(hpc[, 2])

## set PNG width and height to 480 pixels
png("plot1.png", width=480, height=480)

## make plot1
hist(hpc$Global_active_power, 
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab=" ", col="red")

dev.off()

