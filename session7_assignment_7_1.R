#session_assignment_7.1

#1. Histogram for all variables in a dataset mtcars. Write a program to create histograms for all columns. 

library(purrr)
library(tidyr)
library(ggplot2)
mtcars %>%
  keep(is.numeric) %>%
  gather()%>%
  ggplot(aes(value))+
  facet_wrap(~key, scales = "free")+
  geom_histogram()

#2. Check the probability distribution of all variables in mtcars 
mean(mtcars$mpg)
median(mtcars$mpg);

getmode<-fuction(mtcars$mpg) {
  uniqmpg<-unique(mtcars$mpg)
  uniqmpg[which.max(tabulate(match(mtcars$mpg,uniqmpg)))]
};
range(mtcars$mpg);
max(mtcars$mpg)-min(mtcars$mpg) # spread btwn min and max values
quantile(mtcars$mpg)
IQR(mtcars$mpg)

sd<-sd(mtcars$mpg);
var(mtcars$mpg)
mad(mtcars$mpg, center = mean(mtcars$mpg)) #mean absolute deviation
mad(mtcars$mpg, center = median(mtcars$mpg))#median absolute deviation

library(moments)
skewness(mtcars$mpg) #measure of symmetry of the distribution
kurtosis(mtcars$mpg)# peakedness for a distribution
library(outliers)
outlier(mtcars$mpg)#right- tail observation
outlier(mtcars$mpg, opposite = TRUE)#left- tail observation

 #distribution of mpg basedon automatic and manual transmission

cars_auto=subset(mtcars,am==0)
cars_manu=subset(mtcars, am==1)
mean(cars_auto$mpg); mean(cars_manu$mpg)
sd(cars_auto$mpg);sd(cars_manu$mpg)
(mean(cars_auto$mpg)-mean(cars_manu$mpg))/mean(cars_auto$mpg)
par(mfrow=c(2,1))
hist(cars_auto$mpg, main = "distribution of mpg-Auto transmission", xlab = "mpg")
abline(v=mean(cars_auto$mpg), col="read")
hist(cars_manu$mpg, main = "distribution of mpg-manual transmission", xlab = "mpg")
abline(v=mean(cars_manu$mpg), col="read")

#3. Write a program to create boxplot for all variables. 

boxplot(d, ylab="values", main="box plot of all variables")


library(ggplot2)
library(reshape2)
data("mtcars")
df.m<-melt(mtcars)
ggplot(data=df.m,aes(x=variable, y=value))+geom_boxplot()+
  facet_wrap(~variable, scales = "free")