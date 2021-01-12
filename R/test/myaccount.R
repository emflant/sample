library(tidyverse)
library(readxl)


woori_2020 = read_excel(path = "~/data/woori_2020.xlsx", skip = 3)


woori_2020 %>% 
  filter(str_detect(기재내용, '카카') | str_detect(기재내용, '쿠팡') )


code = woori_2020 %>% group_by(기재내용) %>% 
  count(기재내용) %>% 
  arrange(기재내용) %>% 
  select(기재내용)

code2 = code

code[[1]]

code %>% print(n= Inf)


code %>% filter(str_detect(기재내용, '당비'))
code %>% filter(str_detect(기재내용, 'KB|ＫＢ'))
code %>% filter(str_detect(기재내용, 'SC|ＳＣ'))

code2 %>% setdiff(code %>% filter(str_detect(기재내용, '당비'))) %>% 
  setdiff(code %>% filter(str_detect(기재내용, 'KB|ＫＢ'))) %>% 
  setdiff(code %>% filter(str_detect(기재내용, 'SC|ＳＣ'))) 

filter_x = function(x){
  filter(woori_2020, 기재내용 == x)
}

purrr::map(code[[1]], filter_x) # 따로 function 정의.
purrr::map(code[[1]], ~ filter(woori_2020, 기재내용 == .)) # shortcut 으로 간단하게 한줄로 정의
