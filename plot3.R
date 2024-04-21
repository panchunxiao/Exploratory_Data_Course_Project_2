SCC <- readRDS("Source_Classification_Code.rds")
summarySCC <- readRDS("summarySCC_PM25.rds")

library(ggplot2)
typm25balti <- summarySCC%>%
  filter(fips=="24510")%>%
  group_by(year, type)%>%
  summarize(totalEmi=sum(Emissions))%>%
  print

png("plot3.png",width=480,height=480)
ggplot(typm25balti,aes(year, totalEmi,colour=type))+
  geom_line()+
  ylab("PM2.5 Annual Emissions")+
  xlab("Year")+
  ggtitle("PM2.5 Emissions in Baltimore City in 4 Types")

dev.off()
