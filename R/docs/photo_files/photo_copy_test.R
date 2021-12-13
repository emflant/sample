source("~/github/sample/R/docs/photo_files/photo_compare.R")

#=====================================================================================


# 파일체크 (파일명, 파일사이즈 기준)
file_compare("~/Desktop/photo/input", "~/Desktop/photo/output") 

# 사진파일 분류. ~/Desktop/photo/input/ --> ~/Desktop/photo/output/
copy_photo_files("~/Desktop/photo/input", "~/Desktop/photo/output")
# par_copy_photo_files("~/Desktop/photo/input", "~/Desktop/photo/output")


a = c('이케아코리아 유한회사 고양지점', '롯데물산(주)', '나다2')
b = c(100, 20, 50000)

tibble(a,b)


# 파일비교2 (파일경로, 파일명 기준)
# file_compare2("/Users/imac/Desktop/photo/test_compare/disk1", "/Users/imac/Desktop/photo/test_compare/disk2")

# 2개 폴더 동기화. 서로 없는거 copy
# copy_sync("/Users/imac/Desktop/photo/test_compare/disk1", "/Users/imac/Desktop/photo/test_compare/disk2")

# 파일체크 (파일명, 파일사이즈 기준)
# output 폴더와 외장하드 디스크 비교.
re1 = file_compare("/Volumes/seagate/02_photo/2021", "~/Desktop/photo/output") 

# pc에는 있고, seagate 는 없는 디렉토리 목록.
# 이건 ctrl+c,v 로 복사함.
re1$path2 %>% 
  mutate(dir_date = str_sub(dir_name, 1, 44)) %>% 
  distinct(dir_date)

# OUTPUT 폴더에서는 불필요한 raw 파일을 지우기때문에 차이가 나는 케이스가 있음.
# 이런 건은 다시 복사할 필요가 없는 날짜 폴더이므로 제외한다.
re1$path2 %>% 
  mutate(dir_date = str_sub(dir_name, 1, 43)) %>% 
  mutate(file_ext = str_sub(file_name, -3)) %>% 
  filter(file_ext != "RW2") %>% 
  distinct(dir_date)



##################################################################################
# seagate <--> SAMSUNG 외장하드로 동기화
# 파일체크 (파일명, 파일사이즈 기준)
re1 = file_compare("/Volumes/seagate/02_photo", "/Volumes/SAMSUNG/02_photo") 
re1 = file_compare("/Volumes/seagate/02_photo/2021", "/Volumes/SAMSUNG/02_photo/2021") 
re1

re1$path1 %>% 
  mutate(dir_date = str_sub(dir_name, 1, 50)) %>% 
  distinct(dir_date)

# 파일비교2 (파일경로, 파일명 기준)
re2 = file_compare2("/Volumes/seagate/02_photo", "/Volumes/SAMSUNG/02_photo") 
re2

# 2개 폴더 동기화. 서로 없는거 copy
copy_sync("/Volumes/seagate/02_photo/2021", "/Volumes/SAMSUNG/02_photo/2021")
##################################################################################



##################################################################################
# seagate <--> SAMSUNG 외장하드로 동기화
# 파일체크 (파일명, 파일사이즈 기준)
re1 = file_compare("/Volumes/seagate/02_photo", "/Volumes/SAMSUNG2/02_photo") 
re1 = file_compare("/Volumes/seagate/02_photo/2021", "/Volumes/SAMSUNG2/02_photo/2021") 
re1

re1$path1 %>% 
  mutate(dir_date = str_sub(dir_name, 1, 50)) %>% 
  distinct(dir_date)

# 파일비교2 (파일경로, 파일명 기준)
re2 = file_compare2("/Volumes/seagate/02_photo/2021", "/Volumes/SAMSUNG2/02_photo/2021") 
re2

# 2개 폴더 동기화. 서로 없는거 copy
copy_sync("/Volumes/seagate/02_photo/2021", "/Volumes/SAMSUNG2/02_photo/2021")
##################################################################################





##################################################################################
# seagate <--> disk01 외장하드로 동기화
# 파일체크 (파일명, 파일사이즈 기준)
re1 = file_compare("/Volumes/seagate/02_photo", "/Volumes/PhotoDisk/02_photo") 
re1
# 파일비교2 (파일경로, 파일명 기준)
re2 = file_compare2("/Volumes/seagate/02_photo", "/Volumes/PhotoDisk/02_photo") 
re2

re2$path1 %>% 
  mutate(dir_date = str_sub(full_path, 1, 42)) %>% 
  distinct(dir_date)

re2$path1 %>% 
  mutate(dir_date = str_sub(full_path, 1, 30)) %>% 
  distinct(dir_date)

re2$path2 %>% 
  mutate(dir_date = str_sub(full_path, 1, 32)) %>% 
  distinct(dir_date)
  

# 2개 폴더 동기화. 서로 없는거 copy
copy_sync("/Volumes/seagate/02_photo", "/Volumes/PhotoDisk/02_photo")
##################################################################################




flist = file_list(path = "/Volumes/seagate/02_photo/")

flist %>% 
  filter(file_name == "DSC06296.JPG")
#=====================================================================================


read_exif("~/Desktop/photo/output/2021-03-13/RW2/P1120477.RW2") %>% View
# install.packages("exifr")
# ISO, PanasonicImageWidth, PanasonicImageHeight, FNumber, ExposureTime, FocalLength, LensType, ImageWidth, ImageHeight, Make, Model, 

read_exif("~/Desktop/photo/output/2021-03-13/RW2/P1120477.RW2") %>% 
  select(ISO, FNumber, ExposureTime, FocalLength, LensType, ImageWidth, ImageHeight, Make, Model)
