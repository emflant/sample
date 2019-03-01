library(tidyverse)
library(lubridate)



getwd()
batch_result = read.delim(file.path( "..", "..", "data", "batch_201901.txt"), stringsAsFactors = F)
batch_result = as.tibble(batch_result)
str(batch_result)

work_date = batch_result %>% 
  filter(JOB명 == "IMSRSAH0000-자산건전성매일배치", 실행시간 != "") %>% 
  select(WDATE)

job2 = batch_result %>% 
  filter(JOB명 %in% c("IMSRSAH0000-자산건전성매일배치"), WDATE %in% work_date[[1]]) %>% 
  select(JOB명, WDATE, 시작시간) %>% 
  rename(JOB = JOB명, TIME = 시작시간)

job3 = batch_result %>% 
  filter(JOB명 %in% c("05.신용공여한도산출"), WDATE %in% work_date[[1]]) %>% 
  select(JOB명, WDATE, 종료시간) %>% 
  rename(JOB = JOB명, TIME = 종료시간)

result = bind_rows(job2, job3) %>% 
  arrange(WDATE, TIME)

r1 = result %>% 
  spread(key = JOB, value = TIME) %>% 
  select(WDATE, `IMSRSAH0000-자산건전성매일배치`, `05.신용공여한도산출`) %>% 
  rename(start_time = `IMSRSAH0000-자산건전성매일배치`, end_time = `05.신용공여한도산출`) %>% 
  mutate(duration = as.numeric(as.duration(interval(ymd_hms(start_time), ymd_hms(end_time))), "hours"))

mean(r1$duration)

