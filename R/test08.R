# install.packages("dplyr")
# install.packages("readr")
library(readr)

# Sys.setlocale(category = "LC_CTYPE", locale = "ko_KR.UTF-8")
# par(family="NanumGothic")
Sys.setlocale(category = "LC_CTYPE", locale = "ko_KR.UTF-8")
apart_201801 <- read_csv("D:/workspace/data/apart_201801.csv")

apart_201802 <- read_csv("D:/workspace/data/apart_201802.csv")
apart_201802
apart <- rbind(apart_201801, apart_201802) 
apart

library(dplyr)
library(stringr)
filter(apart, 시군구 == "강원도 강릉시 견소동")
filter(apart, str_detect(시군구,"답십리"))
r1 <- filter(apart, str_detect(단지명,"^은마") & str_detect(시군구,"대치동"))

r1 <- apart %>%
    filter(str_detect(단지명,"^은마") & str_detect(시군구,"대치동"))

r2 <- apart %>%
    group_by(시군구) %>%
    summarise(count = n(), trade = mean(`거래금액(만원)`)) %>%
    arrange(desc(trade))

warnings()
apart
r2
