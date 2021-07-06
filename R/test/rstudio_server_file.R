library(tidyverse)
library(tools)
library(lubridate)

list.files("source/test")
list.files("mount/seagate/02_photo/2011/2011-01-01/GX1/JPG/")
file_list("mount/seagate/02_photo/2011/2011-01-01/GX1/JPG/")

file_list = function(path){
  list.files(path = path, full.names = T, recursive = T) %>% 
    enframe(value = "full_path") %>% 
    mutate(path = path, file_name = basename(full_path), dir_name = dirname(full_path), ext = file_ext(full_path)) %>% 
    mutate(file_size = file.size(full_path), mdate = date(file.info(full_path)$mtime)) %>% 
    arrange(mdate, file_name)
}
