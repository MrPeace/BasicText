getwd()

#case sensitive
text <- readLines("pl.txt", encoding = "UTF-8")

#structure shows it is a character vector length 7
str(readLines("pl.txt"))

#convert to one element
text <- paste(text, collapse = " ")

#internet single quotes â€™
#text2 <- gsub(pattern="€™", replace=" ", text)
#text2 <- gsub(pattern="â", replace=" ", text)

# remove puncuation
text2 <- gsub(pattern="\\W", replace=" ", text)
# remove numbers
text2 <- gsub(pattern = "\\d", " ", text2)
# make all lowercase
text2 <- tolower(text2)
# use a package to remove repetitive low value words
# install.packages("tm")
library(tm)
text2 <-removeWords(text2, stopwords())

# remove single letters
text2 <- gsub(pattern = "\\b[A-z]\\b{1}", replace = " ", text2)

text2 <- stripWhitespace(text2)
###########################################################################
#install.packages("stringr")
#install.packages("wordcloud")
library(stringr)
library(wordcloud)

textbag <-str_split(text2, pattern = "\\s+")

textbag <- unlist(textbag)

textbag

# read in Bing Liu's word lists
poswords <-scan('.\\lexicons\\positive-words.txt', what = 'character', comment.char = ';')
negwords <-scan('.\\lexicons\\negative-words.txt', what = 'character', comment.char = ';')

# compute score
score <-sum(!is.na(match(textbag, poswords))) - sum(!is.na(match(textbag, negwords)))

# wordcloud
wordcloud(textbag
          , min.freq = 4
          , random.order = FALSE
          , scale = c(3, 0.5)
          , color=rainbow(3)
          )
 
# Video 4 covered scan() Video 5 Imports a Corpus
myfolder = "C:\\Basic\\BasicText"
filelist <- list.files(path=myfolder, pattern="*.txt")

filelist <- paste(myfolder, "\\", filelist, sep="")

filelist
