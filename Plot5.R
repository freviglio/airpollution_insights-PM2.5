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
#Extract entries related to Vehicles
a1 <- as1[grepl("Vehicle", as1, ignore.case=TRUE)]
#Filter Vehicles obs from AIRP
AIRP2 <- AIRP[AIRP$SCC.Level.Three %in% a1,]
#Filter Baltimora obs
AIRP_BC <- subset(AIRP2, fips =="24510")
#Open PNG Device
png("plot5.png", width=480, height=480)
#Plot
ggplot(AIRP_BC, aes(as.factor(year), Emissions)) + geom_bar(stat="identity", fill=rgb(0.6,0.2,0)) + theme_bw() +  labs(title="Vehicle emissions in Baltimora City (by Year)") + labs(x="Year", y="Emissions")
#Close PNG Device
dev.off()

