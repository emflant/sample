# install.packages("dplyr")
# install.packages("readr")


# Sys.setlocale(category = "LC_CTYPE", locale = "ko_KR.UTF-8")
# par(family="NanumGothic")

library(readr)
apart <- rbind(read_csv("D:/workspace/data/apart_201801.csv"), 
               read_csv("D:/workspace/data/apart_201802.csv"), 
               read_csv("D:/workspace/data/apart_201803.csv"),
               read_csv("D:/workspace/data/apart_201804.csv"),
               read_csv("D:/workspace/data/apart_201805.csv"),
               read_csv("D:/workspace/data/apart_201806.csv")
               ) 




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

names(apart)
str_view("서울특별시 동대문구 답십리동", "^[가-힣]+\\s");
trimws(str_extract("서울특별시 동대문구 답십리동", "^[가-힣]+\\s"))

result <- apart %>%
    # filter(str_detect(시군구,"대치동")) %>%
    mutate(대분류 = trimws(str_extract(시군구, "^[가-힣]+\\s")))


result <- apart %>%
    mutate(대분류 = trimws(str_extract(시군구, "^[가-힣]+\\s"))) %>%
    group_by(대분류, 계약년월) %>%
    summarise(count = n()) %>%
    arrange(desc(count))
dim(result)
result

result$대분류 <- factor(result$대분류)
# result$계약년월 <- factor(result$계약년월)
summary(result)



result_seoul <- result %>%
    filter(대분류 == "서울특별시") %>%
    arrange(계약년월)
result_seoul
summary(result_seoul)

plot(result_seoul$계약년월, result_seoul$count, type = "l")
