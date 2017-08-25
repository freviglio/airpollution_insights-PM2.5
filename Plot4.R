#Unzip Air Pollution Zip file
unzip("Airpollution.zip")
#Import in R source RDS file
NEI <- readRDS("summarySCC_PM25.rds")
#Check first row of data
head(NEI)
#Check structure
str(NEI)
#Import Classification
SCC <- readRDS("Source_Classification_Code.rds")
#Check first row of data
head(SCC)
#Merge NEI with SCC
AIRP <- merge(NEI, SCC, by="SCC")
#Extract unique entries Level Three classification
as1 <- unique(AIRP$SCC.Level.Three)
#Extract entries related to Coal
a1 <- as1[grep("Coal", as1)]
#Filter Coal obs from AIRP
AIRP2 <- AIRP[AIRP$SCC.Level.Three %in% a1,]
#Open PNG Device
png("plot4.png", width=480, height=480)
#Plot
plot(AIRP2$year,AIRP2$Emissions, ylab="Emissions", xlab="Years", main="PM2.5 Coal Combustion related emissions in U.S. (by Year)")
#Close PNG Device
dev.off()
