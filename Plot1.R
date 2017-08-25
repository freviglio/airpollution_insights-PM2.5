#Unzip Air Pollution Zip file
unzip("Airpollution.zip")
#Import in R source RDS file
NEI <- readRDS("summarySCC_PM25.rds")
#Check first row of data
head(NEI)
#Check structure
str(NEI)
#Sum emissions by year
sumbyyear <- with(NEI, tapply(Emissions, year, sum, na.rm=T))
#Extract years
years <- names(sumbyyear)
#Open PNG device
png("plot1.png", width=480, height=480)
#Plot 
plot(years, sumbyyear/1000, type='l', ylab="Emissions (thousands of PM2.5)", main="Total emissions PM2.5 by Year")
#Close PNG Device
dev.off()
