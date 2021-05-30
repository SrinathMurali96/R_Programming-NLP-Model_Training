# Implementing Linear model
#  lm(), or “linear model,” function can be used to create a simple regression model.


Insdata <- read.csv("SwedishMotorInsurance.csv")
View(Insdata)

dim(Insdata)

#--------------------------------------------

summary(Insdata)
#--------------------------------------------

cor(Insdata$Claims,Insdata$Payment) #--high +ve correlation

cor(Insdata$Insured,Insdata$Payment) #--high +ve correlation

plot(Insdata$Insured,Insdata$Payment) 

plot(Insdata$Claims,Insdata$Payment) 

#----------------------------------------------

lineModel <- lm(Payment ~ ., data = Insdata)
summary(lineModel)

#----------------------------------------------

?apply
ZoneResult <- apply(Insdata[,c(5,6,7)],2, function(x)tapply(x, Insdata$Zone, mean))
ZoneResult

KmResult <- apply(Insdata[,c(5,6,7)],2, function(x)tapply(x, Insdata$Kilometres, mean))
KmResult

BonusResult <- apply(Insdata[,c(5,6,7)],2, function(x)tapply(x, Insdata$Bonus, mean))
BonusResult

#----------------------------------------------------

md <- lm(Insdata$Claims ~ Insdata$Kilometres + Insdata$Zone + Insdata$Bonus + Insdata$Make + Insdata$Insured) 

summary(md) 
