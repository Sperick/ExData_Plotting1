
## Check to see if data.table is installed. If not install it
if("data.table" %in% rownames(installed.packages()) == FALSE) 
        {install.packages("data.table")};

## Load data.table package
library(data.table);

## read in contents of file
dt <- fread("household_power_consumption.txt", na.strings = "?");

## subset to only the days we're interested in
twoDaysValues <- dt[(dt$Date=="1/2/2007" | dt$Date=="2/2/2007") ,];

## launch pdf graphics device
png(file="plot1.png");

## plot histogram
hist(twoDaysValues$Global_active_power, col="red", main = "Global Active Power"
     , xlab = "Global Active Power (kilowatts)");

## close device (thereby saving file to directory)
dev.off()