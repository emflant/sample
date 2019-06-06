library(readxl)
library(tidyverse)
library(lubridate)
library(ggthemes)

get_apart_data = function (){
  # options(digits = 10)
  # file.path(getwd(), 'docs', 'apart', 'data', '아파트(매매)_실거래가_서울_2017.xlsx')
  apart_2013 = read_xlsx(path = file.path(getwd(), 'docs', 'apart', 'data', '아파트(매매)_실거래가_서울_2013.xlsx'))
  apart_2014 = read_xlsx(path = file.path(getwd(), 'docs', 'apart', 'data', '아파트(매매)_실거래가_서울_2014.xlsx'))
  apart_2015 = read_xlsx(path = file.path(getwd(), 'docs', 'apart', 'data', '아파트(매매)_실거래가_서울_2015.xlsx'))
  apart_2016 = read_xlsx(path = file.path(getwd(), 'docs', 'apart', 'data', '아파트(매매)_실거래가_서울_2016.xlsx'))
  apart_2017 = read_xlsx(path = file.path(getwd(), 'docs', 'apart', 'data', '아파트(매매)_실거래가_서울_2017.xlsx'))
  apart_2018 = read_xlsx(path = file.path(getwd(), 'docs', 'apart', 'data', '아파트(매매)_실거래가_서울_2018.xlsx'))
  apart_2019 = read_xlsx(path = file.path(getwd(), 'docs', 'apart', 'data', '아파트(매매)_실거래가_서울_2019.xlsx'))
  
  # 3개 data 하나로 바인딩.
  apart = bind_rows(apart_2013, apart_2014, apart_2015, apart_2016, 
                    apart_2017, apart_2018, apart_2019)
  
  # 나머지3개 데이터 삭제.
  rm(list = c("apart_2013", "apart_2014", "apart_2015", "apart_2016", 
              "apart_2017", "apart_2018", "apart_2019"))
  ls()
  
  # 전용면적 chr --> dbl 로 변환
  apart$`전용면적(㎡)` = as.numeric(apart$`전용면적(㎡)`)
  
  # 평형 변환 및 10/20/30/40 평형대인지 코드성 필드 추가.
  apart = apart %>% 
    mutate(평수 = `전용면적(㎡)` * 0.3025) %>% 
    mutate(평형대 = 평수 %/% 10 * 10) %>% 
    mutate(거래가 = as.numeric(str_remove(`거래금액(만원)`, ','))) %>% 
    mutate(계약일자 = ymd(paste0(계약년월, '01'))) %>% # 계약년월에 01 일자로만 셋팅.
    mutate(계약년도 = year(계약일자)) %>% 
    mutate(계약분기 = quarter(계약일자))
  apart
}
apart = get_apart_data()
apart

# dataframe 컬럼수, row수
nrow(apart)
ncol(apart)


monthly_trade_count = apart %>% 
  group_by(계약년월) %>% 
  summarise(월별거래건수 = n())
length(monthly_trade_count$counts)

monthly_trade_count

# 마지막 vector 삭제시. 음수를 활용하면 뒤에서부터 갯수만큼 제거.
head(1:10, n = -1)

# 맨앞의 vector 삭제시. 음수를 활용하면 뒤에서부터 갯수만큼 제거.
tail(1:10, n = -1)


monthly_trade_count %>% 
  mutate(전월거래건수 = c(0, head(월별거래건수, n = -1))) %>% 
  mutate(익월거래건수 = c(tail(월별거래건수, n = -1), 0)) %>% 
  mutate(전월대비 = 월별거래건수 - 전월거래건수) %>% 
  mutate(익월대비 = 익월거래건수 - 월별거래건수) %>% 
  filter(전월대비 < 0, 익월대비 > 0)

args(rep)
rep
# 월별 아파트 매매 추이.
ggplot(monthly_trade_count, aes(x = 계약년월, y = 월별거래건수)) + 
  geom_col()  +
  theme_wsj()

ggplot(monthly_trade_count, aes(x = 계약년월, y = 월별거래건수, group = 1)) + 
  geom_line() + geom_point()+ theme_wsj()

# 월별 아파트 매매 추이. (동일한 뷰)
ggplot(apart, aes(계약년월)) + 
  geom_bar()

# 래미안위브라는 단지가 한지역에만 있는지 확인.
apart %>%
  filter(단지명 == '래미안위브') %>% 
  group_by(`시군구`) %>% 
  summarise(counts = n())

# 단순한 중복건수 확인은 group by 없이 count 로 가능.
apart %>%
  filter(str_detect(단지명, '래미안')) %>%  # like 검색.
  count(시군구, 단지명) %>% 
  arrange(desc(n)) 

# 특정 아파트 단지내 평형단위별 평균가/최저가/최고가
dap_apart1 = apart %>%
  filter(단지명 == '래미안위브') %>% 
  group_by(평형대) %>% 
  summarise(건수 = n(), 
              평균가 = mean(거래가, na.rm = T), 
              하한가 = min(거래가, na.rm = T),
              최고가 = max(거래가, na.rm = T)) %>% 
  arrange(평형대)
dap_apart1
colnames(apart)
# 특정 아파트 단지내 년도별/평형단위별 평균가/최저가/최고가
dap_apart2 = apart %>%
  filter(단지명 == '래미안위브') %>% 
  group_by(계약년도, 평형대) %>% 
  summarise(건수 = n(), 
              평균가 = mean(거래가, na.rm = T), 
              하한가 = min(거래가, na.rm = T),
              최고가 = max(거래가, na.rm = T)) %>% 
  arrange(계약년도, 평형대)
dap_apart2


# 특정 아파트 단지내 분기별/평형단위별 평균가/최저가/최고가
dap_apart3 = apart %>%
  filter(단지명 == '래미안위브') %>% 
  group_by(계약년도, 계약분기, 평형대) %>% 
  summarise(건수 = n(), 
              평균가 = mean(거래가, na.rm = T), 
              하한가 = min(거래가, na.rm = T),
              최고가 = max(거래가, na.rm = T)) %>% 
  arrange(계약년도, 계약분기, 평형대)

dap_apart3

#################################################

x <- ymd(c("2012-03-26", "2012-05-04", "2012-09-23", "2012-12-31", "2013-12-31"))
quarter(x, with_year = T) # 분기
semester(x, with_year = T) # 반기
yq("2001: Q1")

quarter(ymd("2012-03-26"), with_year = T) - 0.2

apart %>% 
  mutate(계약분기 = quarter(ymd(str_c(계약년월, '01')), with_year = T))

apart

  
dap_apart

dap_apart = apart %>%
  filter(단지명 == '래미안위브') %>% 
  filter(`전용면적(㎡)` > 80 , `전용면적(㎡)` < 90  ) %>% # 30평대.
  group_by(`계약년월`) %>% 
  summarise(건수 = n()) %>% 
  arrange(`계약년월` )
dap_apart
dap_apart = apart %>%
  filter(단지명 == '래미안위브') %>% 
  group_by(`전용면적(㎡)`) %>% 
  summarise(실거래가 = mean(`거래금액(만원)`, na.rm = T))

dap_apart = apart %>%
  filter(단지명 == '래미안위브') %>% 
  group_by(`전용면적(㎡)`, `계약년월`) %>% 
  summarise(건수 = n()) %>% 
  arrange(`전용면적(㎡)`, `계약년월`)
  # filter(`전용면적(㎡)` %in% c('84.99', '84.98'))

dap_apart
ggplot(dap_apart, aes(x = 계약년월, y = 건수, group = `전용면적(㎡)`, colour = `전용면적(㎡)`)) +
  geom_line() 

mean(c(NA, 1,4,2), na.rm = T)

# install.packages("gcookbook")
library(gcookbook)

tg
ggplot(tg, aes(x = dose, y = length, fill = supp)) +
  geom_line() +
  geom_point(size = 4, shape = 21)

apart_2019 %>% 
  filter(단지명 == '래미안위브') %>% 
  count(`계약년월`, `전용면적(㎡)`)

apart_2019 %>% count(`전용면적(㎡)`)
apart %>% 
  filter(단지명 == '래미안위브') %>% 
  group_by( `전용면적(㎡)`) %>% 
  summarise(n = n()) %>% 
  mutate(py = aa(`전용면적(㎡)`)) %>% 
  mutate(py_cd = py %/% 10 * 10)
apart %>% 
  filter(단지명 == '래미안위브') %>% 
  group_by( `전용면적(㎡)`) %>% 
  summarise(n = n()) 

# 20/30/40평형대로 출력
aa = function(mm){
  mm * 0.3025
}
(122.23 * 0.3025) %/% 10 * 10
24 %/% 10 * 10
24 %% 10


levels(gss_cat$relig)

options(tibble.sigfig = 100)

gss_cat %>%
  count(race)
ggplot(gss_cat, aes(race)) +
  geom_bar()
ggplot(gss_cat, aes(race)) +
  geom_bar() +
  scale_x_discrete(drop = FALSE)


cabbage_exp

ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col(position = "stack") # stack 이 default option.
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col(position = "dodge")
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col(position = position_dodge2())


ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col(position = position_fill())
