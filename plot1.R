#Set the working directory to the correct folder
setwd("~/DataScience/Git/ExData_Plotting1")

#Download files

url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
dir<-"~/DataScience/Git/ExData_Plotting1/data.zip"
download.file(url,dir)
dateDownloaded<-date() "Thu Apr 13 16:29:04 2017"

#Open a file connection to the zip file to read
unzip(dir,exdir="data")
data <- read.table("data/household_power_consumption.txt",na.strings="?",sep=";",header=T)

#Convert dates and times and drop old ones
datetime<-paste(data$Date,data$Time)
data$datetime<-strptime(datetime,format="%d/%m/%Y %H:%M:%S")
drop <- c("Date","Time")
data<-data[,!(names(data) %in% drop)]
datesubset<-subset(data,as.Date(datetime)>=as.Date("2007-02-01") 
                   & as.Date(datetime)<=as.Date("2007-02-02"))

#Write the subsetted file to use in all parts of the assignement
write.table(datesubset,file="datesubset.txt",sep=";")

#Plot1
png("plot1.png")
hist(datesubset$Global_active_power,main="Global Active Power",
     xlab="Global Active Power (kilowatts)",col="red")
axis(2,at=c(200,400,600,800,1000,1200))
dev.off()
