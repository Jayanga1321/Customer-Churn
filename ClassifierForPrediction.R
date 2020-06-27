#read and store data
telcoCustomerChurn = read.csv("C:/Users/uwindja/OneDrive - Pearson PLC/Desktop/Data/Telco Customer Churn.csv", header = TRUE)

#view data
head(telcoCustomerChurn)
str(telcoCustomerChurn)

#filter data
telcoCustomerChurn.subset<-telcoCustomerChurn[c('tenure','PhoneService','MultipleLines','InternetService','OnlineSecurity','OnlineBackup','StreamingTV','StreamingMovies','Contract','MonthlyCharges','TotalCharges','Churn')]
head(telcoCustomerChurn.subset)

#load caTools library
library(caTools)

#split data 0.65:0.35
sample.split(telcoCustomerChurn.subset$Churn,SplitRatio = 0.65)->splitValues

#assign splitted data to trainDataSet and testDataSet
subset(telcoCustomerChurn.subset,splitValues==T)->trainDataSet
subset(telcoCustomerChurn.subset,splitValues==F)->testDataSet

#load rpart library
library(rpart)

#build the classification model
rpart(Churn~.,data=trainDataSet)->modClass
predict(modClass,testDataSet,type="class")->resultClass
table(testDataSet$Churn,resultClass)

#check accuracy level
(1703+240)/(1703+240+414+108)
