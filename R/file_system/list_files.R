

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




############################
# 아래 내용 추가함. R.home()/⁨etc/Renviron 파일에,
file.path(R.home(), 'etc', 'Renviron')
### default time zone
# TZ="Asia/Seoul"
############################


Sys.time()
Sys.timezone()
Sys.Date()
Sys.getenv()



120000 * 1000

getwd()

dir.exists(list.files())
rmarkdown::render()
list.files(getwd(), full.names = T)
list.files(getwd(), full.names = T)[str_detect(list.files(), '.html$')]

str_view(list.files(getwd(), full.names = T), '.html$')

options("scipen" = 100)


Sys.getenv('R_WD')




dd <- system('ls -al', intern = T)
as_tibble(dd)
as_tibble(dd) %>% 
  filter(str_detect(value, 'index\\.'))

dd_t <- read_fwf(dd, fwf_empty(dd))
dd_t %>% 
  filter(str_detect(X9, 'index.+html'))

read_lines('index.html', n_max = 10)

read_file('index.Rmd')
system.time(read_lines('index.html', n_max = 10))


system.time(read_lines('index.html', n_max = 10, skip = 200))
read_lines('index.html', n_max = 10, skip = 200)


system.time(read_lines('index.html'))
dd <- read_lines('index.html')

dd_t <- as_tibble(dd)

dd_t[c(31:40),]


library(tidyverse)

install.packages("tidyverse")

t_lines
getwd()

dd <- list.files(full.names = T, recursive = T) # 61
dd

Sys.setlocale(category = "LC_CTYPE", locale = "ko_KR.UTF-8")

### 특정폴더 하위의 파일들의 파일내용을 tibble 로 리턴.
get_file_text <- function (p = "."){
  dd <- list.files(p, full.names = T, recursive = T)
  t_lines <- tibble(file = character(), line_number = double(), source = character())
  
  for(f_name in dd){
    d1 <- read_lines(f_name)
    t_file_source = tibble(file = rep(f_name, length(d1)), line_number = seq(length(d1)), source = d1)
    t_lines <- bind_rows(t_lines, t_file_source)
  }
  t_lines # return
}

ddd <- get_file_text()
d1 <- ddd %>%
  filter(str_detect(source, "for"))
View(d1)

R.home()
R
R.Version()
