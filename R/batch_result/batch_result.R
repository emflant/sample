library(tidyverse)
library(lubridate)
options("scipen" = 100)


getwd()
batch_result = read.delim(file.path( "..", "..", "data", "batch_201901.txt"), stringsAsFactors = F)
batch_result = as.tibble(batch_result)
str(batch_result)
batch_result

as.tibble(batch_result)

job1 = batch_result %>% 
  filter(JOB명 == "IMSRSAH0000-자산건전성매일배치", 실행시간 != "") %>% 
  select(WDATE, JOB명)

job1[[1]]

job2 = batch_result %>% 
  filter(JOB명 %in% c("IMSRSAH0000-자산건전성매일배치", "05.신용공여한도산출"), WDATE %in% job1[[1]])


job2 = batch_result %>% 
  filter(JOB명 %in% c("IMSRSAH0000-자산건전성매일배치"), WDATE %in% job1[[1]]) %>% 
  select(JOB명, WDATE, 시작시간)

names(job2)[3] = "TIME"

job2

job3 = batch_result %>% 
  filter(JOB명 %in% c("05.신용공여한도산출"), WDATE %in% job1[[1]]) %>% 
  select(JOB명, WDATE, 종료시간)

names(job2)[3] = "TIME"
names(job3)[3] = "TIME"

job2
job3

result = bind_rows(job2, job3) %>% 
  arrange(WDATE, TIME)
result
result %>% 
  spread(key = JOB명, value = TIME) %>% 
  select(WDATE, `IMSRSAH0000-자산건전성매일배치`, `05.신용공여한도산출`) %>% 
  rename(start_time = `IMSRSAH0000-자산건전성매일배치`, end_time = `05.신용공여한도산출`) %>% 
  mutate(duration = as.numeric(as.duration(interval(ymd_hms(start_time), ymd_hms(end_time))), "hours") )




job_group = batch_result %>% 
  mutate(seconds = as.numeric(as.duration(hms(실행시간)), "hours"),
         wdate = ymd(WDATE)) %>% 
  filter(WDATE %in% job1[[1]])

job_group

job_group2 = job_group %>% 
  group_by(wdate) %>% 
  summarise(sum_time = sum(seconds, na.rm = TRUE))
job_group2
str(job_group2 )

plot(job_group2, type = "l")

job1
job1 = batch_result %>% 
  group_by()
  filter(실행시간 != "")

job2 = batch_result %>% 
  mutate(seconds = as.numeric(as.duration(hms(실행시간)), "seconds"))
job2
job3 = job2 %>% 
  filter(WDATE == "20190201")

str(job2)
batch_result %>% 
  filter(str_detect(`JOB명`, "EDW")) 
str(job1)
batch_result[,16]
batch_result[,13]
unique(batch_result[,16])
unique(batch_result[,1])
wsz