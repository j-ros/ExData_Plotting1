#load from plot1.R created dataframe
datesubset<-read.table("datesubset.txt",header=T,sep=";")
datesubset$datetime<-strptime(datesubset$datetime,format="%Y-%m-%d %H:%M:%S")

#Plot2
Sys.setlocale("LC_TIME", "English") #For days to appear in English
png("plot2.png")
plot(datesubset$datetime,datesubset$Global_active_power,type="l",
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
Sys.setlocale("LC_TIME", "Spanish_Spain.1252") #return to original locale
