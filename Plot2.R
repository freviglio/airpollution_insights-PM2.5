#Unzip Air Pollution Zip file
unzip("Airpollution.zip")
#Import in R source RDS file
NEI <- readRDS("summarySCC_PM25.rds")
#Check first row of data
head(NEI)
#Check structure
str(NEI)
#Extract Baltimora obs
NEI_BC <- subset(NEI, fips =="24510")
#Sum emissions by year
sumbyyear <- with(NEI_BC, tapply(Emissions, year, sum, na.rm=T))
#Extract years
years <- names(sumbyyear)
#Open PNG device
png("plot2.png", width=480, height=480)
#Plot 
plot(years, sumbyyear, type='l', ylab="Emissions", main="Total PM2.5 emissions in Baltimora City by Year")
#Close PNG Device
dev.off()
