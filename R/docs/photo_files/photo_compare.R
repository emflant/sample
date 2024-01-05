library(tidyverse)
library(tools)
library(lubridate)
library(furrr)
library(tictoc)
# library(mongolite)
# library(gcookbook)
# library(exifr)


# 특정 경로의 파일 리스트 생성. 
file_list = function(path){
  list.files(path = path, full.names = T, recursive = T) %>% 
    enframe(value = "full_path") %>% 
    mutate(path = path, file_name = basename(full_path), dir_name = dirname(full_path), ext = file_ext(full_path)) %>% 
    mutate(file_size = file.size(full_path), mdate = date(file.info(full_path)$mtime)) %>% 
    arrange(mdate, file_name)
}

# 2개경로의 파일들 비교. 
file_compare = function(path1, path2){
  
  files_path1 = file_list(path1)
  files_path2 = file_list(path2)
  
  # 총 용량 및 개수 체크
  compare_result = files_path1 %>% summarise(path = path1, total_size = sum(file_size), total_count = n()) %>% 
    union_all(files_path2 %>% summarise(path = path2, total_size = sum(file_size), total_count = n()))
  
  # files_path1 에만 있는 파일.
  result_path1 = files_path1 %>% anti_join(files_path2, by = c("file_name", "file_size")) %>% 
    select (path, file_name, file_size, dir_name)
  
  # files_path2 에만 있는 파일.
  result_path2 = files_path2 %>% anti_join(files_path1, by = c("file_name", "file_size")) %>% 
    select (path, file_name, file_size, dir_name)
  
  list(path1 = result_path1, path2 = result_path2, result = compare_result)
}

# 2개경로의 파일들 비교. 
file_compare2 = function(path1, path2){
  
  files_path1 = file_list(path1) %>% mutate(compare_path = str_sub(full_path, str_length(path1)+1), to_root = path2) %>% mutate(compare_dir = dirname(compare_path))
  files_path2 = file_list(path2) %>% mutate(compare_path = str_sub(full_path, str_length(path2)+1), to_root = path1) %>% mutate(compare_dir = dirname(compare_path))
  
  # 총 용량 및 개수 체크
  compare_result = files_path1 %>% summarise(path = path1, total_size = sum(file_size), total_count = n()) %>% 
    union_all(files_path2 %>% summarise(path = path2, total_size = sum(file_size), total_count = n()))
  
  # files_path1 에만 있는 파일.
  result_path1 = files_path1 %>% anti_join(files_path2, by = c("compare_path")) %>% 
    mutate(to_path = str_c(to_root, compare_dir, "/")) %>% 
    select(full_path, to_path, file_name, file_size, mdate)
  
  # files_path2 에만 있는 파일.
  result_path2 = files_path2 %>% anti_join(files_path1, by = c("compare_path")) %>% 
    mutate(to_path = str_c(to_root, compare_dir, "/")) %>% 
    select(full_path, to_path, file_name, file_size, mdate)
  
  list(path1 = result_path1, path2 = result_path2, result = compare_result)
}

copy_sync = function(path1, path2){
  result = file_compare2(path1, path2)
  
  map_lgl(result$path1$to_path, dir.create, recursive = T, showWarnings = F)
  map2_lgl(result$path1$full_path, result$path1$to_path, file.copy, overwrite = F, copy.date = T)
  
  map_lgl(result$path2$to_path, dir.create, recursive = T, showWarnings = F)
  map2_lgl(result$path2$full_path, result$path2$to_path, file.copy, overwrite = F, copy.date = T)
  print("done.")
}

# copy 사용자함수
copy_func = function(mdate, copy_df) {
  re = map2_lgl(copy_df$full_path, copy_df$copy_path, file.copy, overwrite = F, copy.date = T) %>% 
    enframe(name = NULL) %>% 
    summarise(info = mdate, total = n(), success = sum(value), fail = total - success)
  print(re)
  return(re)
}

# 
copy_photo_files = function(from_path, to_path){
  desktop_photo = file_list(from_path) %>% 
    mutate(copy_path = str_c(to_path, "/", mdate, "/", ext)) 
  
  # 폴더 미리 생성
  desktop_photo %>% distinct(copy_path) %>% 
    pull(copy_path) %>% 
    map_lgl(dir.create, recursive = T, showWarnings = F) %>% enframe(name = NULL) %>% 
    summarise(total = n(), success = sum(value), fail = total - success)
  tic()
  # copy 처리.
  desktop_photo %>% 
    group_by(mdate) %>% nest() %>% 
    mutate(result = map2(mdate, data, copy_func))
  toc()
  print("done.")
}

par_copy_photo_files = function(from_path, to_path){
  desktop_photo = file_list(from_path) %>% 
    mutate(copy_path = str_c(to_path, "/", mdate, "/", ext)) 
  
  # 폴더 미리 생성
  desktop_photo %>% distinct(copy_path) %>% 
    pull(copy_path) %>% 
    map_lgl(dir.create, recursive = T, showWarnings = F) %>% enframe(name = NULL) %>% 
    summarise(total = n(), success = sum(value), fail = total - success)
  
  n_files = desktop_photo %>% 
    group_by(mdate) %>% nest() 
  tic()
  plan(multisession, workers = 3)
  # copy 처리
  future_map2(n_files$mdate, n_files$data, copy_func)
  toc()
  print("done.")
}









