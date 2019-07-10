
install.packages("tm")  # for text mining
install.packages("SnowballC") # for text stemming
install.packages("wordcloud") # word-cloud generator 
install.packages("RColorBrewer") # color palettes
install.packages("sentimentr")
install.packages("wordcloud2")
# Load
library("tm")
library("SnowballC")
library("RColorBrewer")
library("wordcloud")

library(wordcloud2)
library(sentimentr)
library("tm")
library("wordcloud")
library("RColorBrewer")

reviewFile = read.csv("WineReviews.csv",header = TRUE)
str(reviewFile)
wine_data<-data.frame(reviewFile)
red<-subset(wine_data, wine_data$color=="Red")
white<-subset(wine_data, wine_data$color=="White")
rose<-subset(wine_data, wine_data$color=="Rose")
red$description
wine_data[which(red,arr.ind = TRUE), 'description']
rose_desc<-rose$description

z <- as.character(rose_desc)

docs <- Corpus(VectorSource(rose_desc))
inspect(docs)
toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
docs <- tm_map(docs, toSpace, "/")
docs <- tm_map(docs, toSpace, "@")
docs <- tm_map(docs, toSpace, "\\|")

# Convert the text to lower case
docs <- tm_map(docs, content_transformer(tolower))
# Remove numbers
docs <- tm_map(docs, removeNumbers)
# Remove english common stopwords
docs <- tm_map(docs, removeWords, stopwords("english"))
# Remove your own stop word
# specify your stopwords as a character vector
docs <- tm_map(docs, removeWords, c("blabla1", "blabla2")) 
# Remove punctuations
docs <- tm_map(docs, removePunctuation)
# Eliminate extra white spaces
docs <- tm_map(docs, stripWhitespace)
# Text stemming
docs <- tm_map(docs, stemDocument)


dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 50)
d

set.seed(1234)
wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words=200, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))


