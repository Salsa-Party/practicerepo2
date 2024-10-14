#
#SDS 320E - Independent t Test
#

#Pull in class data:
mydata <- read.csv("ClassSurvey.csv")

#Remove values out of reasonable range:
mydata <- mydata[mydata$Text<=1000,]

#Conduct the test:
t.test(mydata$Text~mydata$Relationship, var.eq=TRUE)

#Visual check of normality and equal variance assumptions:
boxplot(mydata$Text~mydata$Relationship, col=c('dark green','purple'), main='Text by Relationship Status',xlab='Relationship Status',ylab='Texts Sent/Week')

#Test for equal variance
library(car)
leveneTest(mydata$Text~mydata$Relationship)

#Conduct Welch's test (unequal variances):
t.test(mydata$Text~mydata$Relationship)
