# install.packages("dplyr")
# install.packages("readr")


# Sys.setlocale(category = "LC_CTYPE", locale = "ko_KR.UTF-8")
# par(family="NanumGothic")

library(readr)
apart_201801 <- read_csv("D:/workspace/data/apart_201801.csv")

apart_201802 <- read_csv("D:/workspace/data/apart_201802.csv")
#apart_201802
apart <- rbind(apart_201801, apart_201802) 
apart

library(dplyr)
library(stringr)
filter(apart, 시군구 == "강원도 강릉시 견소동")
filter(apart, str_detect(시군구,"장안동"))
r1 <- filter(apart, str_detect(단지명,"^은마") & str_detect(시군구,"대치동"))

r1 <- apart %>%
    filter(str_detect(단지명,"^은마") & 
               str_detect(시군구,"대치동") &
               `전용면적(㎡)` == 76.79)

r1$계약년월 <- factor(r1$계약년월)

boxplot(`거래금액(만원)` ~ 계약년월, data = r1)
r1

r2 <- apart %>%
    group_by(시군구) %>%
    summarise(count = n(), trade = mean(`거래금액(만원)`)) %>%
    arrange(desc(trade))

warnings()
apart
r2
