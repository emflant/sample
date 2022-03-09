source("~/github/sample/R/docs/photo_files/photo_compare.R")


aa = file_list('/Volumes/SAMSUNG2/phone_photo');
aa %>% group_by(file_name, file_size) %>% 
  mutate(cnt = n()) %>% 
  filter(cnt > 1, ext == 'mov') %>% 
  select(full_path, file_size) %>% 
  arrange(file_size)

# 파일체크 (파일명, 파일사이즈 기준)
bb = file_compare("~/Desktop/photo/iphone7-202202", "/Volumes/SAMSUNG2/phone_photo/iphone7-202202") 
bb
