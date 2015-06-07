#first we read the file

fichero <- read.table("household_power_consumption.txt", 
              head=T, sep=";", na.strings = "?", colClasses = 
              c("factor","factor", "numeric", "numeric", "numeric", 
              "numeric", "numeric", "numeric", "numeric"))

#subset to only compute the desired days
fichero[,1] <-as.Date(fichero[,1], "%d/%m/%Y")
datestoplot <- subset(fichero, Date>="2007-02-01" & Date<="2007-02-02")

#load the necessary library
library("lubridate")

png(filename = "plot3.png")

plot(ymd_hms(paste(datestoplot[,1], datestoplot[,2])), 
     datestoplot[,7], type = "l", xlab="", 
     ylab="Energy sub metering")
points(ymd_hms(paste(datestoplot[,1], datestoplot[,2])),
       datestoplot[,8], col="red",type="l")
points(ymd_hms(paste(datestoplot[,1], datestoplot[,2])),
       datestoplot[,9], col="blue",type="l")
legend("topright", c("Sub_metering_1", "Sub_metering_2",
      "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"))
#plot the png file
dev.off()