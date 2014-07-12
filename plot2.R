#Read the subset of the data which is filtered and saved in Plot1
#instead of reading the full data set again as the same subset is used for all plots

y <- read.csv("2007_Feb01_02.csv")

#Concatenate Date & Time fields and convert to DateTime 
y$DTime <- paste (y$Date,y$Time,sep=" ")
y$DTime = strptime(y$DTime, format="%Y-%m-%d %H:%M:%S")

#Plot the Line
plot(y$DTime, y$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

##Copy plot to file 
dev.copy(png,filename="plot2.png");
dev.off ();