library(tidyverse)
library(tools)
library(lubridate)

seagate = list.files(path = "/Volumes/seagate/02_photo", full.names = T, recursive = T) %>% 
  enframe(value = "full_path") %>% 
  mutate(disk = "/Volumes/seagate/02_photo", file_name = basename(full_path), dir_name = dirname(full_path), ext = file_ext(full_path)) %>% 
  mutate(file_size = file.size(full_path))


seagate %>% 
  filter(file_name == "P1050386.JPG")

