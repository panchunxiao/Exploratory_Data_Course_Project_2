SCC <- readRDS("Source_Classification_Code.rds")
summarySCC <- readRDS("summarySCC_PM25.rds")

png("plot6.png",width=480,height=480)

SCC3 <- summarySCC %>% 
  filter(summarySCC$SCC %in% motorTmp) %>% 
  filter(fips=="24510" | fips=="06037") %>% 
  group_by(fips, year) %>%
  summarize(AnuEmi=sum(Emissions)) %>%
  print

ggplot(SCC3, aes(year, AnuEmi, color=fips))+
  geom_line()+
  ylab("PM2.5 Emissions")+
  ggtitle("Emissions of Vehicles in Baltimore City and Los Angeles County")

dev.off()
