#Load library and dataset  
  library(data.table)

  hpcDT <- fread(input="./data/household_power_consumption.txt", 
                sep=";",header=TRUE, na.strings="?")

#Change Date column to date type
  hpcDT$Date <- as.Date(hpcDT$Date,"%d/%m/%Y")

#Fitler data by date
  hpcDT<- subset(hpcDT, Date == "2007-02-01" | Date == "2007-02-02")

# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
  png("plot1.png",height = 480,width = 480)
  hist(hpcDT$Global_active_power, col = "red", 
       main = "Global Active Power",
       xlab="Global Active Power (kilowatts)",
      ylab="Frequency")
  dev.off()
