source("~/sample/R/test/photo_compare.R")

seagate_iphone7 = list.files(path = "/Volumes/seagate/phone_photo/iphone7/input", full.names = T, recursive = T) %>% 
  enframe(value = "full_path") %>% 
  mutate(file_name = basename(full_path), dir_name = dirname(full_path), ext = file_ext(full_path)) %>% 
  mutate(file_size = file.size(full_path), myear = year(file.info(full_path)$mtime), mdate = date(file.info(full_path)$mtime)) %>% 
  mutate(myearmonth = str_sub(as.character(mdate), 1, 7)) %>% 
  mutate(copy_path_img = str_c("/Volumes/seagate/phone_photo/iphone7/output/", myear, "/", myearmonth, "/", ext)) %>% 
  mutate(copy_path_mov = str_c("/Volumes/seagate/phone_photo/iphone7/output/", myear, "/MOV")) %>% 
  mutate(copy_path_png = str_c("/Volumes/seagate/phone_photo/iphone7/output/PNG")) %>% 
  filter(ext != "AAE") %>% # AAE 파일은 필요없음. 
  arrange(mdate)

# IMG 폴더 미리 생성
# seagate_iphone7 %>% distinct(copy_path) 
seagate_iphone7 %>% 
  filter(!ext %in% c("MOV", "MP4")) %>% 
  distinct(copy_path_img) %>% 
  pull(copy_path_img) %>% 
  map_lgl(dir.create, recursive = T) %>% enframe(name = NULL) %>% 
  summarise(total = n(), success = sum(value), fail = total - success)

# copy 전처리.
n_seagate_iphone7 = seagate_iphone7 %>% 
  filter(!ext %in% c("MOV", "MP4")) %>% 
  rename(copy_path = copy_path_img) %>% 
  group_by(myear, myearmonth) %>% nest()

n_seagate_iphone7

# copy 처리.
n_seagate_iphone7 %>% 
  mutate(result = map2(myearmonth, data, copy_func))



################################################################################

# mov 폴더만들기
seagate_iphone7 %>% 
  filter(ext %in% c("MOV", "MP4")) %>% 
  distinct(copy_path_mov) %>% 
  pull(copy_path_mov) %>% 
  map_lgl(dir.create, recursive = T) %>% enframe(name = NULL) %>% 
  summarise(total = n(), success = sum(value), fail = total - success)

# copy 전처리.
n_seagate_iphone7_mov = seagate_iphone7 %>% 
  filter(ext %in% c("MOV", "MP4")) %>% 
  rename(copy_path = copy_path_mov) %>% 
  group_by(myear, myearmonth) %>% nest()

n_seagate_iphone7_mov

# copy 처리.
n_seagate_iphone7_mov %>% 
  mutate(result = map2(myearmonth, data, copy_func))



# copy 검증
list.files(path = "/Volumes/seagate/phone_photo/iphone7/input", full.names = T, recursive = T) %>% 
  enframe(value = "full_path") %>% 
  mutate(ext = file_ext(full_path)) %>% 
  filter(ext != "AAE") %>% 
  summarise(folder = "input", total_count = n()) %>% 
  union_all(list.files(path = "/Volumes/seagate/phone_photo/iphone7/output", full.names = T, recursive = T) %>% 
              enframe(value = "full_path") %>% 
              summarise(folder = "output", total_count = n()))


################################################################################
# PNG 파일은 한개 폴더에 
n_seagate_iphone7_png = seagate_iphone7 %>% 
  filter(ext %in% c("PNG")) %>% 
  rename(copy_path = copy_path_png) %>% 
  group_by(myearmonth) %>% nest()


n_seagate_iphone7_png

seagate_iphone7 %>%
  filter(ext %in% c("PNG"))

# copy 처리.
n_seagate_iphone7_png %>% 
  mutate(result = map2(myearmonth, data, copy_func))
