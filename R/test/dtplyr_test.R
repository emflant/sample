library(dtplyr)
library(bench)
library(nycflights13)
library(data.table)
# install.packages("bench")
install.packages("data.table")


mtcars2 = lazy_dt(mtcars)
mtcars
mtcars2


mtcars2 %>% 
  filter(wt < 5) %>% 
  mutate(l100k = 235.21 / mpg) %>% # liters / 100 km
  group_by(cyl) %>% 
  summarise(l100k = mean(l100k))


`mtcars2`[wt < 5][, `:=`(l100k = 235.21/mpg)][, .(l100k = mean(l100k)), 
                                            keyby = .(cyl)]



flights_dt <- lazy_dt(flights)
flights_dt
delay_by_dest <- function(df) {
  df %>%
    filter(!is.na(arr_delay)) %>% 
    group_by(dest) %>% 
    summarise(n = n(), delay = mean(arr_delay))
}

bench::mark(
  flights %>% delay_by_dest(),
  flights_dt %>% delay_by_dest(),
  # flights_dt %>% delay_by_dest() %>% as_tibble(),
  check = FALSE
)


file_lists = list.files(path = "/Volumes/seagate/02_photo/", full.names = T, recursive = T)

file_lists %>% lazy_dt() %>% 
  rename(full_path = x)


fl1 = file_lists %>% enframe(value = "full_path", name = NULL) 

fl2 = file_lists %>% lazy_dt() %>% rename(full_path = x)

fl1 %>% 
  mutate(path = "/Volumes/seagate/02_photo/", file_name = basename(full_path), dir_name = dirname(full_path), ext = file_ext(full_path)) %>% 
  mutate(file_size = file.size(full_path), mdate = date(file.info(full_path)$mtime)) %>% 
  arrange(mdate, file_name)


fuc_dplyr <- function(df) {
  df %>%
    mutate(path = "/Volumes/seagate/02_photo/", file_name = basename(full_path), dir_name = dirname(full_path), ext = file_ext(full_path)) %>% 
    mutate(file_size = file.size(full_path), mdate = date(file.info(full_path)$mtime)) %>% 
    arrange(mdate, file_name) %>% 
    summarise(sum(file_size))
}
fuc_dplyr(fl1)
fuc_dplyr(fl2)
bench::mark(
  fl1 %>% fuc_dplyr,
  fl2 %>% fuc_dplyr, 
  # fl2 %>% fuc_dplyr %>% as_tibble(), 
  # fl2 %>% fuc_dplyr %>% as.data.table(),
  check = FALSE)


fl1 %>% fuc_dplyr
fl2 %>% fuc_dplyr