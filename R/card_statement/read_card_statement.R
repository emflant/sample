

Sys.setlocale(category = "LC_CTYPE", locale = "ko_KR.UTF-8")
# par(family="NanumGothic")

library(tidyverse)
library(readxl)
library(lubridate)

kakko <- read_excel("/Users/emflant/Downloads/kakko_card.xlsx")
kakko

hana <- read_excel("/Users/emflant/Downloads/hana_card.xlsx")
hana



hana[c(1:3)]

x <- c('일시불 및 할부: 2018. 02. 09 ~ 2018. 03. 08')

str_sub(x, 1, 10)
str_sub(x, 11, 22)

# 매칭되는 문자열을 시각적으로 보여주는 function
str_view(x, '\\d{4}\\.\\s*\\d{2}\\.\\s*\\d{2}')
str_view_all(x, '\\d{4}\\.\\s*\\d{2}\\.\\s*\\d{2}')

# 매칭되는 문자열이 있는지 여부를 T / F 로 리턴.
str_detect(x, '\\d{4}\\.\\s*\\d{2}\\.\\s*\\d{2}')

# 매칭되는 문자열을 리턴.
str_extract(x, '\\d{4}\\.\\s*\\d{2}\\.\\s*\\d{2}')
str_extract_all(x, '\\d{4}\\.\\s*\\d{2}\\.\\s*\\d{2}')


head(hana[1])
typeof(hana[1]) # list
typeof(hana[1][[1]]) # character vector

# 데이터 가공 start.
xx <- hana[1][[1]]
xx
xxs <- str_extract_all(xx, '\\d{4}\\.\\s*\\d{2}\\.\\s*\\d{2}') # list
head(xxs)
# [[1]]
# [1] "2018. 02. 09" "2018. 03. 08"
# 
# [[2]]
# [1] "2018. 02. 09" "2018. 03. 08"
# 
# [[3]]
# [1] "2018. 02. 09" "2018. 03. 08"

xxs <- unlist(xxs)
head(xxs)
# [1] "2018. 02. 09" "2018. 03. 08" "2018. 02. 09" "2018. 03. 08" "2018. 02. 09" "2018. 03. 08"

# 중간중간 공백제거.
xxs <- str_replace_all(xxs, '\\s', '')
xxs <- str_replace_all(xxs, '\\.', '-')

head(xxs) # vector 로 리턴. 
# [1] "2018/02/09" "2018/03/08" "2018/02/09" "2018/03/08" "2018/02/09" "2018/03/08"

# 이런식의 리스트 형태를 data.frame 으로 변환하기 위해, 
# unlist 처리를 하고 matrix 후에 tibble 변환한다.
rxx <- as_tibble(matrix(xxs, ncol = 2, byrow = T))
head(rxx)


names(rxx) = c('from_dt', 'to_date')

head(rxx)
# A tibble: 6 x 2
# from_dt    to_date   
# <chr>      <chr>     
# 1 2018.02.09 2018.03.08
# 2 2018.02.09 2018.03.08
# 3 2018.02.09 2018.03.08
# 4 2018.02.09 2018.03.08
# 5 2018.02.09 2018.03.08
# 6 2018.02.09 2018.03.08

# date 형으로 변환.
# rxx$from_dt <- ymd(rxx$from_dt)
# rxx$to_date <- ymd(rxx$to_date)

head(rxx)
# A tibble: 6 x 2
# from_dt    to_date   
# <date>     <date>    
# 1 2018-02-09 2018-03-08
# 2 2018-02-09 2018-03-08
# 3 2018-02-09 2018-03-08
# 4 2018-02-09 2018-03-08
# 5 2018-02-09 2018-03-08
# 6 2018-02-09 2018-03-08

# 컬럼 데이터 추가는 아래 함수 사용.(tibble)
bind_cols(hana, rxx)

hana_sml <- select(hana, c(1,2,3,4,7,10)) %>%
  bind_cols(rxx)

#  이용기간, 이용일자, 이용가맹점, 이용금액, 원금, 해택금액, from_dt, to_date   
names(hana_sml) = c('card_period', 'tran_md', 'tran_shop', 'tran_amount', 'pay_amount', 'coupon_amount', 'from_dt', 'to_date')

hana_sml

hana_sml[c('tran_md','from_dt', 'to_date') ]

year('2018-02-09')

ex_tran <- c('02/08')

# Error in as.POSIXlt.character(x, tz = tz(x)) : 
#   character string is not in a standard unambiguous format
year('2018.02.09')


year('2018-02-09') # [1] 2018


day(ex_ymd)

str_extract(ex_tran, '\\d{2}')

# 날짜 비교.
typeof(month(ex_ymd))
as.double(str_extract(ex_tran, '\\d{2}')) == month(ex_ymd)
str_extract(ex_tran, '\\d{2}')
as.double(str_extract(ex_tran, '\\d{2}'))

# get_tran_date("01/07", "2017-12-01", "2018-01-31")
get_tran_date <- function (month_day, f_dt, t_dt){
  
  if(as.double(str_extract(month_day, '\\d{2}')) == month(f_dt)){
    str_c(year(f_dt), "-", str_replace_all(month_day, '/', '-'))
  } else {
    str_c(year(t_dt), "-", str_replace_all(month_day, '/', '-'))
  }
  
}

year("2018-01-15")

hana_sml$tran_md[1:5]

hana_smlx <- list(hana_sml$tran_md, hana_sml$from_dt, hana_sml$to_date)
hana_smlx

hana_smlz <- pmap(hana_smlx, get_tran_date)
hana_smlz[1:5]
unlist(hana_smlz)

hana_smlt <- as_tibble(unlist(hana_smlz))

hana_sml <- bind_cols(hana_sml, hana_smlt)
names(hana_sml) = c('card_period', 'tran_md', 'tran_shop', 'tran_amount', 'pay_amount', 'coupon_amount', 'from_dt', 'to_date', 'tran_date')
hana_sml

## TIME ZONE 관련.
tz(yy) # "UTC"
tz(yy) <- "Asia/Seoul"
OlsonNames()
OlsonNames()[str_detect(OlsonNames(), 'Seoul')]

fwf_sample <- readr_example("fwf-sample.txt")
cat(read_lines(fwf_sample))
