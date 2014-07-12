#Read the subset of the data which is filtered and saved in Plot1
#instead of reading the full data set again as the same subset is used for all plots

y <- read.csv("2007_Feb01_02.csv")

#Concatenate Date & Time fields and convert to DateTime 
y$DTime <- paste (y$Date,y$Time,sep=" ")
y$DTime = strptime(y$DTime, format="%Y-%m-%d %H:%M:%S")

#Plot the lines by overlaying the three line graphs. The X-axis limit is scaled with the maximum value of the three submetering values
plot(y$DTime, y$Sub_metering_1, type="l", ylim=c(0, max(y$Sub_metering_1,y$Sub_metering_2,y$Sub_metering_3)) ,xlab="", ylab="Energy Submetering")
lines(y$DTime, y$Sub_metering_2, type="l", xlab="", ylab="",col="red")
lines(y$DTime, y$Sub_metering_3, type="l", xlab="", ylab="",col="blue")
legend("topright",  lty=1, col=c("black","red", "blue"), cex=0.7, legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

#Copy plot to file 
dev.copy(png,filename="plot3.png");
dev.off ();

