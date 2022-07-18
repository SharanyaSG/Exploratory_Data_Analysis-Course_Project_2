##-----------------------------------------------------------------------------------------------------------------##
##READ DATA FROM RDS FILES
##-----------------------------------------------------------------------------------------------------------------##
  setwd("/Users/sharanyasiddeshgowda/Documents/Macbook_Pro/SHARANYA/CERTIFICATIONS/Data_Science_Specialization_JHU/C4_Exploratory_Data_Analysis/R_Projects/Exploratory_Data_Analysis-Course_Project_2/exdata-data-NEI_data")
  SCC <- readRDS("Source_Classification_Code.rds")
  sum_SSC <- readRDS("summarySCC_PM25.rds")

##-----------------------------------------------------------------------------------------------------------------##
## PROJECT QUESTION 3 - Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
## variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
## Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer 
## this question.
##-----------------------------------------------------------------------------------------------------------------##
  sum_SSC_PMdec<-subset(sum_SSC, fips == "24510")
  MD<-melt(sum_SSC_PMdec,id=c("year","type"), measure.vars = "Emissions")
  Bmore<-dcast(MD,year~type,sum)
  b_type<-melt(Bmore,id=c("year"),measure.vars=names(Bmore)[-c(1)])

  gt<-ggplot(b_type, aes(x=year,y=value)) + geom_col(width = 1.5,mapping=aes(fill=variable)) + 
    facet_grid(.~variable) + theme_bw() + geom_smooth(method = "lm") +
    labs(title="TYPES OF PM2.5 EMISSIONS (Baltimore City,MD)") +
    xlab("Year") + ylab("PM2.5 Emissions in tons")+
    theme(text= element_text(size = 15), plot.title = element_text(size=15, hjust = 0.5, face="bold"), 
        plot.margin = margin(1, 1, 1, 1, "cm"))
  gt 
  
  png("plot3.png", width=640, height=480)
  dev.off()