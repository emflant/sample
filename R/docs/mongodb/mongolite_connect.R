library(mongolite)
library(rtweet)
library(lubridate)
library(tidyverse)
library(lobstr)

rt <- search_tweets(
  "마스크", n = 1000, include_rts = FALSE
)

rt %>% head
nrow(rt)
Sys.getenv()

# install.packages("mongolite")
# con$insert(rt)
# con$find()
# con$drop()

mask_tweets = mongo("mask_tweets", 
            db = "test", 
            url = "mongodb://localhost:27017")


Sys.getenv("MONGODB_CRUD_ID")
mask_tweets$insert(rt)
mask_tweets$count()
# rm(mask_tweets)
aa = mask_tweets$find()
mask_tweets$insert(aa)

# 필요한 필드만 추출.
aa = mask_tweets$find(fields = '{ "user_id" : 1, "status_id" : 1, "created_at" : 1, "screen_name" : 1, "text" : 1}') %>% as_tibble()
lobstr::obj_size(aa)

aa = aa %>% group_by(status_id) %>% 
  mutate(rn = row_number()) %>% 
  ungroup()

aa %>% filter(rn == 2)
aa %>% group_by(status_id) %>% 
  mutate(rn = row_number()) %>% 
  filter(rn == 2) %>% 
  select(user_id, status_id, created_at)

# install.packages('devtools')
# devtools::install_github('haven-jeon/KoNLP')
# https://brunch.co.kr/@mapthecity/9
# https://github.com/SKTBrain/KoBERT#why
library(KoNLP)

str = "학교종이땡땡땡어서모이자선생님이학교에서우리를기다리신다."
str = aa$text[1]
str
useSejongDic()


extractNoun(aa$text[1])

MorphAnalyzer(str)

SimplePos09(str)

SimplePos22(str)
