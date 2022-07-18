##-----------------------------------------------------------------------------------------------------------------##
##READ DATA FROM RDS FILES
##-----------------------------------------------------------------------------------------------------------------##
setwd("/Users/sharanyasiddeshgowda/Documents/Macbook_Pro/SHARANYA/CERTIFICATIONS/Data_Science_Specialization_JHU/C4_Exploratory_Data_Analysis/R_Projects/Exploratory_Data_Analysis-Course_Project_2/exdata-data-NEI_data")
SCC <- readRDS("Source_Classification_Code.rds")
sum_SSC <- readRDS("summarySCC_PM25.rds")

##-----------------------------------------------------------------------------------------------------------------##
## PROJECT QUESTION 6 - Compare emissions from motor vehicle sources in Baltimore City with emissions from motor 
##vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time 
##in motor vehicle emissions?
##-----------------------------------------------------------------------------------------------------------------##
la_SCC <-subset(sum_SSC, fips=="06037")
motorla_SCC<-subset(la_SCC,SCC %in% SCC_motor$SCC)
annual_motorla_SCC<-tapply(motorla_SCC$Emissions,
                             motorla_SCC$year, sum, na.rm=TRUE)
mdca<-data.frame(year=as.numeric(names(annual_motorla_SCC)),
                    E_bmore = annual_bmotor,
                    E_la = annual_motorla_SCC)

rng<-c(0,max(mdca$E_bmore,mdca$E_la)+1000)
##png("plot6.png", width=480, height=720)
par(mfrow=c(1,1),mar=c(5,5,4,2))
plot(mdca$year, mdca$E_la, type="l", lwd=2, pch=19,  
     col="magenta", main="Emissions of PM2.5 from motor vehicles by year", 
     xlab = "Year", ylab="Amount of emissions (tons)", ylim=rng)
lines(mdca$year,mdca$E_bmore, lwd=2, col="darkorchid3")
points(mdca$year,mdca$E_bmore, lwd=2, pch=19, col="darkorchid3")
points(mdca$year,mdca$E_la, lwd=2, pch=19, col="chartreuse3")
lines(mdca$year,mdca$E_la, lwd=2, col="chartreuse3")
legend("topright", lwd=2, col=c("darkorchid3", "chartreuse3"), 
       legend=c("Baltimore City","Los Angeles County"), bty="n") ##dev.off()