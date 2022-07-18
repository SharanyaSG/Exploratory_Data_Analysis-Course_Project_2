##-----------------------------------------------------------------------------------------------------------------##
##READ DATA FROM RDS FILES
##-----------------------------------------------------------------------------------------------------------------##
setwd("/Users/sharanyasiddeshgowda/Documents/Macbook_Pro/SHARANYA/CERTIFICATIONS/Data_Science_Specialization_JHU/C4_Exploratory_Data_Analysis/R_Projects/Exploratory_Data_Analysis-Course_Project_2/exdata-data-NEI_data")
SCC <- readRDS("Source_Classification_Code.rds")
sum_SSC <- readRDS("summarySCC_PM25.rds")

##-----------------------------------------------------------------------------------------------------------------##
## PROJECT QUESTION 5 - How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
##-----------------------------------------------------------------------------------------------------------------##
sum_SSC_PMdec<-subset(sum_SSC, fips == "24510")
gl<-grepl("(.*)(Highway Veh)(.*)",SCC$Short.Name)
SCC_motor<-SCC[gl,]
bmotor<-subset(sum_SSC_PMdec, SCC %in% SCC_motor$SCC)
annual_bmotor<-tapply(bmotor$Emissions,bmotor$year, sum, na.rm=T)


par(mfrow=c(1,1),mar=c(7,7,4,3))
barplot(annual_bmotor, names.arg = names(annual_bmotor), col="orange", 
        main="ANNUAL MOTOR VEHICLE PM2.5 EMISSIONS (Baltimore City,MD)", 
        xlab = "Year", ylab="PM2.5 Emissions in tons", 
        ylim = range(0,annual_bmotor)*1.3) 

png("plot5.png", width=640, height=480)
dev.off()

