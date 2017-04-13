#load from plot1.R created dataframe
datesubset<-read.table("datesubset.txt",header=T,sep=";")
datesubset$datetime<-strptime(datesubset$datetime,format="%Y-%m-%d %H:%M:%S")

#Plot4
Sys.setlocale("LC_TIME", "English") #For days to appear in English
png("plot4.png")
par(mfrow=c(2,2)) # 2 by 2 plots, rowwise

plot(datesubset$datetime,datesubset$Global_active_power,type="l",
     xlab="", ylab="Global Active Power") #1,1 panel

plot(datesubset$datetime,datesubset$Voltage,type="l",
     xlab="datetime", ylab="Voltage") #1,2 panel

plot(datesubset$datetime,datesubset$Sub_metering_1,type="l",
     xlab="",ylab="Energy sub metering",col="black")
lines(datesubset$datetime,datesubset$Sub_metering_2,col="red")
lines(datesubset$datetime,datesubset$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=1,bty="n") #2,1 panel

plot(datesubset$datetime,datesubset$Global_reactive_power,type="l",
     xlab="datetime", ylab="Global_reactive_power") #2,2 panel

dev.off()
Sys.setlocale("LC_TIME", "Spanish_Spain.1252") #return to original locale