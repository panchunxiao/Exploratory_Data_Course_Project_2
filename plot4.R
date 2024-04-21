SCC <- readRDS("Source_Classification_Code.rds")
summarySCC <- readRDS("summarySCC_PM25.rds")


coalcb <- grep("Coal", SCC$EI.Sector)
coalcombust <- SCC[coalcb,]
SCCTmp <- as.vector(coalcombust$SCC)

SCC1 <- summarySCC %>% 
  filter(summarySCC$SCC %in% SCCTmp) %>% 
  group_by(year) %>% 
  summarize(AnuEmi=sum(Emissions)) %>% 
  print

png("plot4.png",width=480,height=480)

ggplot(SCC1, aes(year, AnuEmi))+
  geom_line()+
  ylab("PM2.5 Emissions")+
  ggtitle("Coal combustions related PM2.5 Emissions")
dev.off()
