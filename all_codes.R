setwd("C:/Users/Chunxiao Pan/Documents/R_Tutorial/Data_Science_Foundations_using_R_Specialization/ExploratoryDataAnalysis/Week4_Assignment")
rm(list=ls())
library(dplyr)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip","./exdatafi.zip")
unzip("exdatafi.zip", exdir = "./")
SCC <- readRDS("Source_Classification_Code.rds")
summarySCC <- readRDS("summarySCC_PM25.rds")
str(SCC)
View(SCC)
str(summarySCC)
View(summarySCC)

#Q1
pm25emi <- summarySCC%>%
  group_by(year)%>%
  summarize(anuEmi=sum(Emissions))%>%
  print(n=4)

plot(pm25emi,type="l")

#Q2
pm25balti <- summarySCC%>%
  filter(fips=="24510")%>%
  group_by(year)%>%
  summarize(totalEmi=sum(Emissions))%>%
  print

plot(pm25balti,type="l")

#Q3
library(ggplot2)
typm25balti <- summarySCC%>%
  filter(fips=="24510")%>%
  group_by(year, type)%>%
  summarize(totalEmi=sum(Emissions))%>%
  print

ggplot(typm25balti,aes(year, totalEmi,colour=type))+
  geom_line()+
  ylab("Annual Emissions")
  
#Q4
coalcb <- grep("Coal", SCC$EI.Sector)
coalcombust <- SCC[coalcb,]
SCCTmp <- as.vector(coalcombust$SCC)
SCCTmp


SCC1 <- summarySCC %>% 
  filter(summarySCC$SCC %in% SCCTmp) %>% 
  group_by(year) %>% 
  summarize(AnuEmi=sum(Emissions)) %>% 
  print

ggplot(SCC1, aes(year, AnuEmi))+
  geom_line()+
  ylab("Annual Emissions")

#Q5 

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
  ylab("Annual Emissions")

#Q6

SCC3 <- summarySCC %>% 
  filter(summarySCC$SCC %in% motorTmp) %>% 
  filter(fips=="24510" | fips=="06037") %>% 
  group_by(fips, year) %>%
  summarize(AnuEmi=sum(Emissions)) %>%
  print

ggplot(SCC3, aes(year, AnuEmi, color=fips))+
  geom_line()+
  ylab("Annual Emissions")
