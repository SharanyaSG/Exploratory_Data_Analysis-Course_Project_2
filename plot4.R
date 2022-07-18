##-----------------------------------------------------------------------------------------------------------------##
##READ DATA FROM RDS FILES
##-----------------------------------------------------------------------------------------------------------------##
  setwd("/Users/sharanyasiddeshgowda/Documents/Macbook_Pro/SHARANYA/CERTIFICATIONS/Data_Science_Specialization_JHU/C4_Exploratory_Data_Analysis/R_Projects/Exploratory_Data_Analysis-Course_Project_2/exdata-data-NEI_data")
  SCC <- readRDS("Source_Classification_Code.rds")
  sum_SSC <- readRDS("summarySCC_PM25.rds")

##-----------------------------------------------------------------------------------------------------------------##
## PROJECT QUESTION 3 - Across the United States, how have emissions from coal combustion-related sources changed 
## from 1999–2008?
##-----------------------------------------------------------------------------------------------------------------##
  gl<-grepl("(.*)(Comb)(.*)(Coal)(.*)",SCC$Short.Name)
  SCC_sub<-SCC[gl,]
  em_coal<-subset(sum_SSC, SCC %in% SCC_sub$SCC)
  y_coal<-tapply(em_coal$Emissions, em_coal$year, sum, na.rm=T)

  par(mfrow=c(1,1),mar=c(7,7,4,3))
  barplot(y_coal, names.arg = names(y_coal), col="pink", 
          main="ANNUAL COAL COMBUSTION RELATED PM2.5 EMISSIONS", 
          xlab = "Year", ylab="M2.5 Emissions in tons", ylim = range(0,y_coal)*1.3) 
  png("plot4.png", width=700, height=600)
  dev.off()