library(tidyverse)
library(readxl)
# library(sloop)
# install.packages("sloop")


woori_2020 = read_excel(path = "~/data/woori_2020.xlsx", skip = 3)


# woori_account = structure(

code = woori_2020 %>% group_by(기재내용) %>% 
  count(기재내용) %>% 
  arrange(기재내용) %>% 
  select(기재내용)

code2 = code

code %>% filter(str_detect(기재내용, '당비'))
code %>% filter(str_detect(기재내용, 'KB|ＫＢ'))
code %>% filter(str_detect(기재내용, 'SC|ＳＣ'))
woori_2020 %>% filter(str_detect(기재내용, '당비'))
woori_2020 %>% filter(str_detect(기재내용, '카드'))


code2 %>% setdiff(code %>% filter(str_detect(기재내용, '당비'))) %>% 
  setdiff(code %>% filter(str_detect(기재내용, 'KB|ＫＢ'))) %>% 
  setdiff(code %>% filter(str_detect(기재내용, 'SC|ＳＣ'))) 

filter_x = function(x){
  filter(woori_2020, 기재내용 == x)
}

purrr::map(code[[1]], filter_x) # 따로 function 정의는 방식
purrr::map(code[[1]], ~ filter(woori_2020, 기재내용 == .)) # shortcut 으로 간단하게 한줄로 정의

woori_2020 %>% 
  group_by(기재내용) %>% nest() %>% arrange(기재내용) %>% 
  mutate(비용합계 = map(data, ~ .x %>% summarise(sum(찾으신금액))) %>% unlist()) %>% 
  mutate(수익합계 = map(data, ~ .x %>% summarise(sum(맡기신금액))) %>% unlist()) %>% 
  arrange(desc(비용합계))

woori_2020 %>% 
  group_by(분류) %>% nest() %>% arrange(분류) %>% 
  mutate(비용합계 = map(data, ~ .x %>% summarise(sum(찾으신금액))) %>% unlist()) %>% 
  mutate(수익합계 = map(data, ~ .x %>% summarise(sum(맡기신금액))) %>% unlist()) %>% 
  arrange(desc(비용합계))

(209811+6489) * 0.03


woori_2020 %>% 
  group_by(분류) %>% nest() %>% arrange(분류) %>% 
  transmute(비용합계 = map(data, ~ .x %>% summarise(sum(찾으신금액))) %>% unlist()) %>% 
  arrange(desc(비용합계)) %>% 
  print(n = 20)

nest_data = woori_2020 %>% 
  group_by(기재내용) %>% 
  nest() %>% 
  arrange(기재내용)
  
nest_data
nest_data %>% filter(str_detect(기재내용, "SKT")) 
nest_data %>% filter(str_detect(기재내용, "SKT")) %>% 
  mutate(sumamt = map(data, ~ .x %>% summarise(sum(찾으신금액))) %>% unlist()) 

nest_data %>% filter(str_detect(기재내용, "SKT")) %>% 
  mutate(sumamt = map(data, ~ .x %>% summarise(sum(찾으신금액))) )


woori_2020 %>% filter(str_detect(기재내용, "SKT")) %>% 
  summarise(sum(찾으신금액))


is_even <- function(x) x %% 2 == 0
c(1,2,3) %>% keep(is_even)

c(1,2,3) %>% keep(~ .x %% 2 == 0)


list(c(1), c(2,3,4), c(7,8,9)) %>% keep(~ .x[1] %% 2 == 0)





