#Call required libraries
library(dplyr)
library(ggplot2)
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
#Sum emissions by year and type
sumby <- NEI_BC %>% group_by(year, type) %>% 
        summarise(emissions = sum(Emissions))
#Open PNG device
png("plot3.png", width=480, height=480)
#Plot
ggplot(sumby, aes(year, emissions)) +  geom_point() + geom_line(stat="identity") +  facet_grid(.~type)+ggtitle('Total Emissions in Baltimore City, Maryland from 1999 to 2008')
#Close PNG Device
dev.off()

