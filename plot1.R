#first we read the file
fichero <- read.table("household_power_consumption.txt", 
            head=T, sep=";", na.strings = "?", colClasses = 
            c("factor","factor", "numeric", "numeric", "numeric", 
            "numeric", "numeric", "numeric", "numeric"))
#subset to only compute the desired days
fichero[,1] <-as.Date(fichero[,1], "%d/%m/%Y")
datestoplot <- subset(fichero, Date>="2007-02-01" & Date<="2007-02-02")


png(filename = "plot1.png")
hist(datestoplot[,3], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", col="red")
#plot the png file
dev.off()

