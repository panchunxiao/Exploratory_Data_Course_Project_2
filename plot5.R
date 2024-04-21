SCC <- readRDS("Source_Classification_Code.rds")
summarySCC <- readRDS("summarySCC_PM25.rds")

png("plot5.png",width=480,height=480)

motor <- grep("vehicle", SCC$EI.Sector,ignore.case = TRUE)
motorSCC <- SCC[motor,]
motorTmp <- as.vector(motorSCC$SCC)
SCC2 <- summarySCC %>% 
  filter(summarySCC$SCC %in% motorTmp) %>% 
  filter(fips=="24510") %>% 
  group_by(year) %>%
  summarize(AnuEmi=sum(Emissions)) %>%
  print

ggplot(SCC2, aes(year, AnuEmi))+
  geom_line()+
  ylab("PM2.5 Emissions")+
  ggtitle("Emissions from Motor Vehicle in Baltimore City")

dev.off()
