library(tidyverse)
library(tools)
library(lubridate)



photodisk = list.files(path = "/Volumes/PhotoDisk/02_photo", full.names = T, recursive = T) %>% 
  enframe(value = "full_path") %>% 
  mutate(disk = "photodisk", file_name = basename(full_path), dir_name = dirname(full_path), ext = file_ext(full_path)) %>% 
  mutate(file_size = file.size(full_path))

seagate = list.files(path = "/Volumes/seagate/02_photo/", full.names = T, recursive = T) %>% 
  enframe(value = "full_path") %>% 
  mutate(disk = "segate", file_name = basename(full_path), dir_name = dirname(full_path), ext = file_ext(full_path)) %>% 
  mutate(file_size = file.size(full_path))

samsung = list.files(path = "/Volumes/SAMSUNG/02_photo/", full.names = T, recursive = T) %>% 
  enframe(value = "full_path") %>% 
  mutate(disk = "samsung", file_name = basename(full_path), dir_name = dirname(full_path), ext = file_ext(full_path)) %>% 
  mutate(file_size = file.size(full_path))

# 루믹스 gx1 
lumix = list.files(path = "/Volumes/LUMIX/DCIM/", full.names = T, recursive = T) %>% 
  enframe(value = "full_path") %>% 
  mutate(file_name = basename(full_path), dir_name = dirname(full_path), ext = file_ext(full_path)) %>% 
  mutate(file_size = file.size(full_path))


550156087699 / 1024 / 1024 / 1024

# 총 용량 및 개수 체크
photodisk %>% summarise(disk = 'photodisk', total_size = sum(file_size), total_count = n()) %>% 
  union_all(seagate %>% summarise(disk = 'seagate', total_size = sum(file_size), total_count = n())) %>% 
  union_all(samsung %>% summarise(disk = 'samsung', total_size = sum(file_size), total_count = n()))

# photodisk 에만 있는 파일.
photodisk %>% anti_join(seagate, by = c("file_name", "file_size")) %>% 
  select (file_name, file_size, dir_name) %>% print(n = Inf)

# seagate 에만 있는 파일.
seagate %>% anti_join(photodisk, by = c("file_name", "file_size")) %>% 
  select (file_name, file_size, dir_name) %>% print(n = Inf)




# 동일파일 여러건..
# photodisk %>% group_by(file_name, file_size) %>% 
#   mutate(cnt = n()) %>% 
#   filter(cnt > 1, ext == 'RW2') %>% 
#   arrange(file_name) %>% ungroup() %>% 
#   distinct(dir_name) %>% 
#   filter(str_detect(dir_name, "/Volumes/PhotoDisk/02_photo/2016/gx1"))

# 루믹스 gx1 
desktop_photo = list.files(path = "~/Desktop/photo", full.names = T, recursive = T) %>% 
  enframe(value = "full_path") %>% 
  mutate(file_name = basename(full_path), dir_name = dirname(full_path), ext = file_ext(full_path)) %>% 
  mutate(file_size = file.size(full_path), mdate = date(file.info(full_path)$mtime)) %>% 
  mutate(copy_path = str_c("/Volumes/SAMSUNG/", mdate, "/", ext)) 

desktop_photo %>% distinct(mdate) %>% 
  mutate(copy_path = str_c("/Volumes/SAMSUNG/", mdate, "/")) 


# 폴더 미리 생성
desktop_photo %>% distinct(mdate, ext) %>% 
  mutate(copy_path = str_c("/Volumes/SAMSUNG/", mdate, "/", ext)) %>% 
  pull(copy_path) %>% 
  map(dir.create, recursive = T)

# 폴더 미리 생성
# desktop_photo %>% distinct(mdate) %>% 
#   mutate(copy_path = str_c("/Volumes/SAMSUNG/", mdate, "/")) %>% 
#   left_join(enframe(c("raw", "jpg", "mp4"), name = NULL), by = character()) %>%  #character() 로 키없이 조인가능.
#   mutate(create_dir = str_c(copy_path, value)) %>% 
#   pull(create_dir) %>% 
#   map(dir.create, recursive = T)


# copy 처리.
map2_lgl(desktop_photo$full_path, desktop_photo$copy_path, file.copy, overwrite = T, copy.date = T) %>% 
  enframe(name = NULL) %>% 
  summarise(total = n(), success = sum(value), fail = total - success)





