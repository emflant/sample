library(tidyverse)
library(nycflights13)
# install.packages("nycflights13")
install.packages("sqldf")
library(sqldf)

str(Orange)


flights

head(sqldf("select year, t.* from flights t"))

airlines

airports

planes %>% 
  count(tailnum)

x <- tribble(
  ~key, ~val_x,
  1, "x1",
  2, "x2",
  3, "x3"
)
y <- tribble(
  ~key, ~val_y,
  1, "y1",
  2, "y2",
  4, "y3"
)


x
y


x %>% 
  right_join(y, by = "key")
airports %>% count(alt, lon)
union_all(x, y)

install.packages("RSelenium")

remDr <- remoteDriver(
  remoteServerAddr = "localhost",
  port = 4445L,
  browserName = "firefox"
)

