##-----------------------------------------------------------------------------------------------------------------##
##READ DATA FROM RDS FILES
##-----------------------------------------------------------------------------------------------------------------##
  setwd("/Users/sharanyasiddeshgowda/Documents/Macbook_Pro/SHARANYA/CERTIFICATIONS/Data_Science_Specialization_JHU/C4_Exploratory_Data_Analysis/R_Projects/Exploratory_Data_Analysis-Course_Project_2/exdata-data-NEI_data")
  SCC <- readRDS("Source_Classification_Code.rds")
  sum_SSC <- readRDS("summarySCC_PM25.rds")

##-----------------------------------------------------------------------------------------------------------------##
## PROJECT QUESTION 1 - Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the 
## years 1999, 2002, 2005, and 2008.
##-----------------------------------------------------------------------------------------------------------------##
  emi_total<-tapply(sum_SSC$Emissions, sum_SSC$year, sum, na.rm=T)
  par(mfrow=c(1,1),mar=c(7,7,4,3))
  barplot(emi_total/10000, names.arg = names(emi_total), col="yellow", main="Annual PM2.5 Emissions", 
          xlab = "Year", ylab="PM2.5 Emissions in Kilotons", ylim = range(0,emi_total/10000) * 1.3)
  lines(names(emi_total), emi_total/10000,col="yellow") 
  png("plot1.png", width=500, height=500)
  dev.off()