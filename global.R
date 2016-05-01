# Read in WHR data
# May have to clean up first
file_csv<-"data_whr2016.csv"
data<- read.csv(file_csv)

data$Life.Expectancy<-data$Healthy.life.expectancy.at.birth
data$GDP<-data$Log.GDP.per.capita
#GDP,Life.Expectancy,Life.Ladder,Population2005

data_world<-read.csv("World - Country Boundaries.csv")
data_merge<-merge(x = data, y = data_world[,1:6], by.x = "country", by.y ="CountryName")
unique(data_merge[is.na(data_merge$Region),2])
data<-data_merge
reg<-as.character(data$Region)
reg[reg=="Latin America"]<-"Latin America & Caribbean"
reg[reg=="Caribbean"]<-"Latin America & Caribbean"
reg[reg=="Asia"]<-"Asia & Pacific"
reg[reg=="Pacific"]<-"Asia & Pacific"
data$Region<-as.factor(reg)
data$Year<-data$year
#Latin America and Carribean together

#graphics to plot
#select year = 2015
#year
#Life.Ladder
#Log.GDP.per.capita

#plot(data$Life.Ladder,data$Log.GDP.per.capita)