#load from plot1.R created dataframe
datesubset<-read.table("datesubset.txt",header=T,sep=";")
datesubset$datetime<-strptime(datesubset$datetime,format="%Y-%m-%d %H:%M:%S")

#Plot3
Sys.setlocale("LC_TIME", "English") #For days to appear in English
png("plot3.png")
plot(datesubset$datetime,datesubset$Sub_metering_1,type="l",
     xlab="",ylab="Energy sub metering",col="black")
lines(datesubset$datetime,datesubset$Sub_metering_2,col="red")
lines(datesubset$datetime,datesubset$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=1)
dev.off()
Sys.setlocale("LC_TIME", "Spanish_Spain.1252") #return to original locale