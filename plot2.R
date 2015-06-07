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

png(filename = "plot2.png")

plot(ymd_hms(paste(datestoplot[,1], datestoplot[,2])), 
     datestoplot[,3], type = "l", xlab="", 
     ylab="Global Active Power (kilowatts)")
#plot the png file
dev.off()

