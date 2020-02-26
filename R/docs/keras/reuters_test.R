library(keras)
library(tidyverse)

# reuters = dataset_reuters(num_words = 10000)
# write_rds(reuters, file.path(getwd(), "data", "reuters.rds"))
dataset_reuters
reuters = read_rds(file.path(getwd(), "data", "reuters.rds"))

c(c(train_data, train_labels), c(test_data, test_labels)) %<-% reuters
train_data
length(train_data)
str(train_data)
train_data[[1]]

word_index = dataset_reuters_word_index()
str(word_index)

names(word_index[c(1:10)])
