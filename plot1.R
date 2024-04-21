SCC <- readRDS("Source_Classification_Code.rds")
summarySCC <- readRDS("summarySCC_PM25.rds")

pm25emi <- summarySCC%>%
  group_by(year)%>%
  summarize(anuEmi=sum(Emissions)/10^5)%>%
  print(n=4)

png("plot1.png",width=480,height=480)

barplot(
  pm25emi$anuEmi,
  names.arg=pm25emi$year,
  xlab="Year",
  ylab="Total PM25 Emissions(10^5 Tons)",
  main="Total PM2.5 Emissions From the USA"
)

dev.off()
