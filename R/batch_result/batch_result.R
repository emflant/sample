library(tidyverse)
library(lubridate)

getwd()
batch_result = read.delim(file.path( "..", "..", "data", "batch_201901.txt"), stringsAsFactors = F)
head(batch_result)

job1 = batch_result %>% 
  filter(실행시간 != "")

job2 = mutate(job1,
       hms = hms(`실행시간`),
       duration = as.duration(hms(`실행시간`)),
       seconds = as.numeric(as.duration(hms(`실행시간`)), "seconds"))


batch_result %>% 
  filter(str_detect(`JOB명`, "EDW")) 
str(job1)
batch_result[,16]
batch_result[,13]
unique(batch_result[,16])





library(lubridate)
hour("2017-01-31 01:05:28")

x <- ymd("2012-03-26")
hour(x) <- 1
x


Sys.timezone()
minute(Sys.time())
second(Sys.time())


duration("05:00:00")

dif = hms("01:04:00")

difd = as.duration(dif)
as.numeric(difd, "year")

as.POSIXct(x, tz = "Asia/Seoul")

x <- "2018-01-01 06:00:00"
y <- "2018-01-01 07:40:15"
interval(x, y)
as.duration(interval(x, y))
as.numeric(as.duration(interval(x, y)), "minute")
as.numeric(as.duration(interval(x, y)), "day")


make_difftime()

dif = as.POSIXct(y, tz = "Asia/Seoul") - as.POSIXct(x, tz = "Asia/Seoul")

make_difftime(dif, units = "hour")

dif == 21

make_difftime()

as.POSIXct(x, tz = "UTC1")
as.POSIXct(x, tz = "Asia/Seoul")
