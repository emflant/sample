# install.packages("dplyr")
# install.packages("readr")


# Sys.setlocale(category = "LC_CTYPE", locale = "ko_KR.UTF-8")
# par(family="NanumGothic")

Sys.setlocale(category = "LC_CTYPE", locale = "ko_KR.UTF-8")



library(readr)
library(dplyr)
library(stringr)
apart <- rbind(read_csv(paste0(getwd(), "/data/apart_201801.csv")), 
               read_csv(paste0(getwd(), "/data/apart_201802.csv")),
               read_csv(paste0(getwd(), "/data/apart_201803.csv")),
               read_csv(paste0(getwd(), "/data/apart_201804.csv")),
               read_csv(paste0(getwd(), "/data/apart_201805.csv")),
               read_csv(paste0(getwd(), "/data/apart_201806.csv"))) 


korean_names <- names(apart)

names(apart) <- c("address", "address_number", "1st_number", "2nd_number", "apart_name", "area", "contract_date",
  "contract_day", "trade_amount", "floor", "build_year", "street_name")


saveRDS(apart, paste0(getwd(), "/data/apart.rds"))

apart <- read_rds(paste0(getwd(), "/data/apart.rds"))


filter(apart, city == "강원도 강릉시 견소동")
filter(apart, str_detect(city,"장안동"))
r1 <- filter(apart, str_detect(apart_name,"^은마") & str_detect(city,"대치동"))

r1 <- apart %>%
    filter(str_detect(apart_name,"^은마") & 
               str_detect(city,"대치동") &
               area == 76.79)

r1$contract_date <- factor(r1$contract_date)

boxplot(trade_amount ~ contract_date, data = r1)
r1

r2 <- apart %>%
    group_by(address) %>%
    summarise(count = n(), trade_mean = mean(trade_amount)) %>%
    arrange(desc(trade_mean))

warnings()
apart
r2

names(apart)
str_view("서울특별시 동대문구 답십리동", "^[가-힣]+\\s");
trimws(str_extract("서울특별시 동대문구 답십리동", "^[가-힣]+\\s"))

result <- apart %>%
    # filter(str_detect(시군구,"대치동")) %>%
    mutate(city = trimws(str_extract(address, "^[가-힣]+\\s")))


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
