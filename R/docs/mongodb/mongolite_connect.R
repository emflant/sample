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
aa
aa = aa %>% group_by(status_id) %>% 
  mutate(rn = row_number()) %>% 
  ungroup()

aa %>% group_by(status_id) %>% 
  summarise(cnt = n()) %>% 
  filter(cnt > 1)

aa %>% filter(status_id == "1237259520780283904")

aa %>% filter(rn == 2)
aa %>% group_by(status_id) %>% 
  mutate(rn = row_number()) %>% 
  filter(rn == 2) %>% 
  select(user_id, status_id, created_at)


aa %>% setdiff(aa %>% top_n(100000))
aa %>% top_n(100000)%>% setdiff(aa)
aa %>% setdiff(aa)


aa = mask_tweets$find(fields = '{ "user_id" : 1, "status_id" : 1, "created_at" : 1, "_id": 0}') %>% as_tibble()
lobstr::obj_size(aa)
aa
aa %>% unite(all) %>% 
  mutate(all_sha = digest::digest(object=all, algo="md5")) 

aa %>% unite(all) %>% 
  mutate(all_sha = map_chr(all, digest::digest, algo="md5")) 


digest::digest(object="1222854300444921856_1237387137835651076_2020-03-10 23:37:37", algo="sha256")
data = c("1234", "5678")
data = c("1234")
data = "1234"
digest::digest(object=data, algo="sha256")


# install.packages('devtools')
# devtools::install_github('haven-jeon/KoNLP')
# https://brunch.co.kr/@mapthecity/9
# https://github.com/SKTBrain/KoBERT#why
# library(KoNLP)
# 
# str = "학교종이땡땡땡어서모이자선생님이학교에서우리를기다리신다."
# str = aa$text[1]
# str
# useSejongDic()
# 
# 
# extractNoun(aa$text[1])
# 
# MorphAnalyzer(str)
# 
# SimplePos09(str)
# 
# SimplePos22(str)

df <- tibble(
  grp = rep(1:2, each = 5), 
  x = c(rnorm(5, -0.25, 1), rnorm(5, 0, 1.5)),
  y = c(rnorm(5, 0.25, 1), rnorm(5, 0, 0.5)),
)
df
df %>% 
  group_by(grp) %>% 
  summarise(cnt = n())
df2 = df %>% 
  group_by(grp) %>% 
  summarise(rng = list(range(x)), cnt = n())

df3 = df %>% 
  group_by(grp) %>% 
  summarise(rng = str_c(range(x), collapse = "/"), remarks = "min/max")

df3 %>% separate_rows(rng, remarks, sep = "/")


relig_income %>% 
  pivot_longer(-religion, names_to = "income", values_to = "count")

family1 <- tribble(
  ~family,  ~dob_child1,  ~dob_child2, ~gender_child1, ~gender_child2,
  1L, "1998-11-26", "2000-01-29",             1L,             2L,
  2L, "1996-06-22",           NA,             2L,             NA,
  3L, "2002-07-11", "2004-04-05",             2L,             2L,
  4L, "2004-10-10", "2009-08-27",             1L,             1L,
  5L, "2000-12-05", "2005-02-28",             2L,             1L,
)

family2 <- tribble(
  ~family,  ~dob_child1,  ~dob_child2, ~gender_child1, ~gender_child2,
  1L, "1998-11-26", "2000-01-29",             1L,             2L,
  2L, "1996-06-22",           NA,             2L,             NA,
  3L, "2001-07-11", "2004-04-05",             3L,             2L,
  4L, "2004-10-10", "2009-08-27",             1L,             1L,
  5L, "2000-12-05", "2005-02-28",             2L,             1L,
)

family1_longer = family1 %>% mutate_all(str_replace_na) %>% 
  pivot_longer(cols = -family, names_to = "column", values_to = "dev_value", values_drop_na = F)
family1_longer
family2_longer = family2 %>% mutate_all(str_replace_na) %>% 
  pivot_longer(cols = -family, names_to = "column", values_to = "prd_value")

family1_longer %>% bind_cols(family2_longer[,3]) %>% 
  mutate(same = dev_value == prd_value) %>% 
  mutate(nums = abs(as.numeric(dev_value) - as.numeric(prd_value))) %>% 
  filter(same == F)

  

df <- data.frame(x = c(1:4))
scale_num <- ggplot(df, aes(x)) + 
  geom_point(size = 3, color = "#0072B2", y = 1) + 
  scale_y_continuous(limits = c(0.8, 1.2), expand = c(0, 0), breaks = 1, label = "position  ") +
  scale_x_continuous(limits = c(.7, 4.4), breaks = 1:5, labels = c("1", "2", "3", "4", "5"), name = NULL, position = "top") +
  theme_dviz_grid() +
  theme(axis.ticks.length = grid::unit(0, "pt"),
        axis.text = element_text(size = 14),
        axis.title.y = element_blank(),
        axis.ticks.y = element_blank())


c(1, 3, 6, 8, 6, 5, 3, 1, 5, 2)
a = tibble(x = c(1, 3, 6, 8, 6, 5, 3, 1, 5, 2))
a %>% mutate(cummax_x = cummax(x),
             cummin_x = cummin(x),
             cumsum_x = cumsum(x),
             cumsum_x2 = cumsum(x %in% c(3,6,9)),
             cume_dist_x = cume_dist(x), 
             dense_rank_x = dense_rank(x), 
             min_rank_x = min_rank(x), 
             ntile_x = ntile(x, 3),
             percent_rank_x = percent_rank(x), 
             lead_x = lead(x), 
             lag_x = lag(x)
             )


aa = mask_tweets$find(fields = '{ "_id":0, "text" : 1}') %>% as_tibble()
aa
library(tidytext)
install.packages("tidytext")


aa1 = aa %>% mutate(line = row_number()) %>% select(line, text) %>% 
  filter(!str_detect(text, "사모님|미녀"))
aa1

aa2 = aa1 %>% unnest_tokens(word, text)

aa2 %>% count(word) %>% arrange(desc(n))

aa3 = aa2 %>% group_by(word) %>% summarise(n = n(), min_line = min(line)) %>% arrange(desc(n))
aa3 %>% head(50)

aa4 = aa2 %>% group_by(word) %>% summarise(n = n(), min_line = list(line)) %>% arrange(desc(n))
aa4 %>% head %>% view
aa1 %>%  filter(line == 31)
