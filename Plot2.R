install.packages("lubridate")
library(lubridate) 
install.packages("data.table")
library(data.table)


# path

setwd("C:/tmp")


# download data

fileUrl <- "https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"

data <- tempfile()

download.file(fileUrl, data)

data <- unzip(data)

str(data)


# read data

data1 <- fread("household_power_consumption.txt", na.strings = "?")

#subset the dataset 
data2 <- data1[grepl("^[1,2]/2/2007", data1$Date),] 


#plot2 

data2$Datetime <- as.POSIXct(paste(as.Date(data2$Date, format = "%d/%m/%Y"), data2$Time))

plot(data2$Global_active_power ~ data2$Datetime, type = "l", xlab = "",  ylab = "Global Active Power (killowatts)")

dev.copy(png,"plot2.png", width=480, height=480)
dev.off()


