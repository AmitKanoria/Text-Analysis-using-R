print(getwd())
setwd("C:/Users/User/Desktop")
library(syuzhet)
library(ggplot2)
library(tm)
library(wordcloud)
texts<-readLines("WhatsApp Chat with Tushar.txt")
print(texts)
sentiment=get_nrc_sentiment(texts)
print(sentiment)
text=cbind(texts,sentiment)
TotalSentiment=data.frame(colSums(text[,c(2:11)]))
TotalSentiment
names(TotalSentiment)="count"

TotalSentiment=cbind("sentiment"=rownames(TotalSentiment),TotalSentiment)
rownames(TotalSentiment)=NULL

ggplot(data=TotalSentiment,aes(x=sentiment,y=count))+
  geom_bar(aes(fill=sentiment),stat = "identity")+theme(legend.position = "none")+
  xlab("sentiment")+ylab("Total Count")+ ggtitle("Total Sentiment Score")