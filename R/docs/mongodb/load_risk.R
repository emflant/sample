library(readxl)
library(tidyverse)
library(lubridate)
library(ggthemes)
library(jsonlite)
options("scipen" = 100)

getwd()

te_limit = read_excel("/Volumes/PhotoDisk/30_workspace/data/TE_LIMIT_20191213.xlsx")

T && T
c(1,2) == c(3,4)


# =AND(Y4="-", Z4<>"-", OR(Z4="SM",Z4="S+",Z4="S",Z4="D",Z4="F",Z4="D"))
te_limit 
te_limit %>% 
  mutate(`TE_유효등급미존재` = ASIS_TE한도금액 > 0 & TOBE_TE한도금액 == 0 & TOBE_신용등급 == "-") %>% 
  filter(`TE_유효등급미존재` == F) %>% 
  mutate(`(수행사확인필요)TE_자기자본미세차이` = ASIS_자기자본 != TOBE_자기자본 & abs(ASIS_자기자본 - TOBE_자기자본) < 10) %>% 
  filter(`(수행사확인필요)TE_자기자본미세차이` == F) %>% 
  mutate(`TE_직전부도등급사용` = ASIS_신용등급 == "-" & TOBE_신용등급 %in% c("SM", "S+", "S", "D", "F")) %>% 
  filter(`TE_직전부도등급사용` == F) %>% 
  mutate(`TE_재무제표이행차이` = ASIS_재무제표기준일 != TOBE_재무제표기준일 & ASIS_자기자본 != TOBE_자기자본 & ASIS_TE한도금액 != TOBE_TE한도금액) %>% 
  filter(`TE_재무제표이행차이` == F) %>% 
  mutate(`신용여신한도만다름` = ASIS_TE한도금액 == TOBE_TE한도금액 & ASIS_자기자본 == TOBE_자기자본 &
           ASIS_신용등급 == TOBE_신용등급 & ASIS_신용여신한도 != TOBE_신용여신한도) %>% 
  filter(`신용여신한도만다름` == F) %>% 
  mutate(`(수행사확인필요)TE_한도안나옴` = ASIS_TE한도금액 > 0 & TOBE_TE한도금액 == 0 & 
           ASIS_자기자본 == TOBE_자기자본 & ASIS_신용등급 == TOBE_신용등급) %>% 
  filter(`(수행사확인필요)TE_한도안나옴` == F) 
  # filter(`TE_유효등급미존재` == T)
