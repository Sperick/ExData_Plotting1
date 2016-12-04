
## Check to see if data.table is installed. If not install it
if("data.table" %in% rownames(installed.packages()) == FALSE) 
{install.packages("data.table")};

## Check to see if data.table is installed. If not install it
if("lubridate" %in% rownames(installed.packages()) == FALSE) 
{install.packages("lubridate")};

## Load data.table package
library(data.table);

## Load data.table package
library(lubridate);

## read in contents of file
dt <- fread("household_power_consumption.txt", na.strings = "?");

## subset to only the days we're interested in
twoDaysValues <- dt[(dt$Date=="1/2/2007" | dt$Date=="2/2/2007") ,];

## Combine the Date and TIme Columns
datetimeCol <- paste(twoDaysValues$Date, twoDaysValues$Time);

## Convert this new Column to a DateTime type
datetimes <- dmy_hms(datetimeCol);

## launch pdf graphics device
png(file="plot3.png");

## plot graph
with(twoDaysValues, plot(datetimes, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
with(twoDaysValues, points(datetimes, Sub_metering_1, type="l"))
with(twoDaysValues, points(datetimes, Sub_metering_2, type="l", col="red"))
with(twoDaysValues, points(datetimes, Sub_metering_3, type="l", col="blue"))
legend("topright", lwd=1, col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


## close device (thereby saving file to directory)
dev.off()