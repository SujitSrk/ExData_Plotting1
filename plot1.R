# Read the large original dataset
p <- read.table("household_power_consumption.txt", sep=";", header=T)

# Convert to date for filetering the two dates required
p$Date = as.Date(p$Date,format="%d/%m/%Y")

# Filter large data set on 1&2/Feb/20007
x <- subset(p, p$Date == as.Date("2007-02-01") | p$Date == as.Date("2007-02-02"))

#Save the filtered dataset and use that in  the other plots - plot2,plot3 and plot 4 
#to avoid reloading  the initial large data set everytime

write.table(x, "2007_Feb01_02.csv", sep=",")

#Read back the data; Strings are converted to numeric automatically

y <- read.csv("2007_Feb01_02.csv")

#Plot the histogram  ; change x & y axis labels
hist (y$Global_active_power, col="red" , xlab="Global Active Power (kilowatts) ", main="Global Active Power")

##Copy plot to file 
dev.copy(png,filename="plot1.png");
dev.off ();
