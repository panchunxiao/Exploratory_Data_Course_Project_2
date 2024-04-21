SCC <- readRDS("Source_Classification_Code.rds")
summarySCC <- readRDS("summarySCC_PM25.rds")

pm25balti <- summarySCC%>%
  filter(fips=="24510")%>%
  group_by(year)%>%
  summarize(totalEmi=sum(Emissions))%>%
  print

png("plot2.png",width=480,height=480)
barplot(pm25balti$totalEmi, names.arg=pm25balti$year, xlab="Year", ylab="PM25 Emissions", main="PM2.5 Emissions in Baltimore City")
dev.off()
