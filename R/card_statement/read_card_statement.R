

Sys.setlocale(category = "LC_CTYPE", locale = "ko_KR.UTF-8")
par(family="NanumGothic")

library(readxl)


#result <- read.csv("/Users/emflant/Downloads/kakko_card.csv"
#                   , header = T, stringsAsFactors = F)

kakko <- read_excel("/Users/emflant/Downloads/kakko_card.xlsx")

kakko
hana <- read_excel("/Users/emflant/Downloads/hana_card.xlsx")


