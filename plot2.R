##-----------------------------------------------------------------------------------------------------------------##
##READ DATA FROM RDS FILES
##-----------------------------------------------------------------------------------------------------------------##
  setwd("/Users/sharanyasiddeshgowda/Documents/Macbook_Pro/SHARANYA/CERTIFICATIONS/Data_Science_Specialization_JHU/C4_Exploratory_Data_Analysis/R_Projects/Exploratory_Data_Analysis-Course_Project_2/exdata-data-NEI_data")
  SCC <- readRDS("Source_Classification_Code.rds")
  sum_SSC <- readRDS("summarySCC_PM25.rds")

##-----------------------------------------------------------------------------------------------------------------##
## PROJECT QUESTION 2 - Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510"
##fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.
##-----------------------------------------------------------------------------------------------------------------##
  sum_SSC_PMdec<-subset(sum_SSC, fips == "24510")
  MD_annual<-tapply(sum_SSC_PMdec$Emissions, sum_SSC_PMdec$year, sum, na.rm=TRUE)
  par(mfrow=c(1,1),mar=c(7,7,4,3))
  barplot(MD_annual, names.arg = names(MD_annual), col="green", 
        main="ANNUAL PM2.5 EMISSIONS (Baltimore City,MD)", xlab = "Year", 
        ylab="PM2.5 Emissions in tons", ylim = range(0,MD_annual)*1.3) 
  png("plot2.png", width=640, height=640)
  dev.off()