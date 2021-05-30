library(tm)
library(SnowballC)
library(topicmodels)

# TEXT RETRIEVAL

#set working directory (modify path as needed)
ld

#load files into corpus
#get listing of .txt files in directory
filenames <- list.files(getwd(),pattern="*.txt")
#read files into a character vector
files <- lapply(filenames,readLines)
#create corpus from vector
articles.corpus <- Corpus(VectorSource(files))

# TEXT PROCESSING

# make each letter lowercase
articles.corpus <- tm_map(articles.corpus, tolower)

# stemming
articles.corpus <- tm_map(articles.corpus, stemDocument);

# Ceate the Document Term Matrix (DTM)
articleDtm <- DocumentTermMatrix(articles.corpus, control = list(minWordLength = 3));
articleDtm2 <- removeSparseTerms(articleDtm, sparse=0.98)

# TOP MODELING

k = 5;
SEED = 1234;
article.lda <- LDA(articleDtm2, k, method="Gibbs", control=list(seed = SEED))
lda.topics <- as.matrix(topics(article.lda))
lda.topics
lda.terms <- terms(article.lda)
lda.terms

> lda.terms
    Topic 1     Topic 2     Topic 3     Topic 4     Topic 5 
     "theo" "customers"    "angela"       "crm"      "paul"
     
    
