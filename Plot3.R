#Load library and dataset  
library(data.table)

hpcDT <- fread(input="./data/household_power_consumption.txt", 
               sep=";",header=TRUE, na.strings="?")

#Change Date column to date type
hpcDT$Date <- as.Date(hpcDT$Date,"%d/%m/%Y")

#Fitler data by date
hpcDT<- subset(hpcDT, Date == "2007-02-01" | Date == "2007-02-02")

#create datetime variable for time of the day.
datetime <- strptime(paste(hpcDT$Date,as.character(hpcDT$Time)),"%Y-%m-%d %H:%M:%S")



# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
png("plot3.png",height = 480,width = 480)
plot(x=datetime, y=hpcDT$Sub_metering_1, 
     type="l",
     ylab="Energy sub metering",
     xlab=" "
)
lines(datetime,hpcDT$Sub_metering_2,col="red")
lines(datetime,hpcDT$Sub_metering_3,col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))
dev.off()
