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

#plot1
hist(data2$Global_active_power,  col = "red", main = "Global Active Power", xlab = "Global Active Power (killowatts)")


# Save file and close device
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()