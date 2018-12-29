

p <- file.path(getwd())
p

list.files("/Volumes/PhotoDisk/30_workspace/sample/R")
list.dirs("/Volumes/PhotoDisk/30_workspace/sample/R")

R.home()
list.files(R.home())

list.dirs(R.home("doc"))


list.files("/Volumes/PhotoDisk/30_workspace/sample/R", full.names = T)[1]

file.info("/Volumes/PhotoDisk/30_workspace/sample/R/Quandl.R")

Sys.getenv()

getwd()
file.info(c("./file_system/A.txt", "./file_system/C.txt"))


options(tz="Asia/Seoul")
Sys.getenv()

attributes(t)$tzone
Sys.timezone()
Sys.time()
x <- "2018-01-01 06:00:00 UTC"
as.POSIXct(x)
as.POSIXct(x, tz = "Asia/Seoul")


as.POSIXct(Sys.time())


as.POSIXlt(Sys.time(), tz = "Asia/Seoul")



OlsonNames()


# Warning messages:
#   1: In strptime(xx, f <- "%Y-%m-%d %H:%M:%OS", tz = tz) :
#   unknown timezone 'zone/tz/2018g.1.0/zoneinfo/Asia/Seoul'
# 2: In as.POSIXct.POSIXlt(x) :
#   unknown timezone 'zone/tz/2018g.1.0/zoneinfo/Asia/Seoul'
# 3: In strptime(x, f, tz = tz) :
#   unknown timezone 'zone/tz/2018g.1.0/zoneinfo/Asia/Seoul'
# 4: In as.POSIXct.POSIXlt(as.POSIXlt(x, tz, ...), tz, ...) :
#   unknown timezone 'zone/tz/2018g.1.0/zoneinfo/Asia/Seoul'
# 5: In as.POSIXlt.POSIXct(x, tz) :
#   unknown timezone 'zone/tz/2018g.1.0/zoneinfo/Asia/Seoul'


file.info(c("A.txt", "C.txt"))


R.home()

############################
# 아래 내용 추가함. R.home() / ⁨etc/Renviron 파일에,
### default time zone
# TZ="Asia/Seoul"
############################


Sys.time()
Sys.timezone()
Sys.Date()
Sys.getenv()
