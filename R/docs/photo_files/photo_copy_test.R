source("~/sample/R/docs/photo_files/photo_compare.R")

#=====================================================================================


read_exif("~/Desktop/photo/output/2021-03-13/RW2/P1120477.RW2") %>% View
# install.packages("exifr")
# ISO, PanasonicImageWidth, PanasonicImageHeight, FNumber, ExposureTime, FocalLength, LensType, ImageWidth, ImageHeight, Make, Model, 

read_exif("~/Desktop/photo/output/2021-03-13/RW2/P1120477.RW2") %>% 
  select(ISO, FNumber, ExposureTime, FocalLength, LensType, ImageWidth, ImageHeight, Make, Model)
#=====================================================================================


# 파일체크 (파일명, 파일사이즈 기준)
file_compare("~/Desktop/photo/input", "~/Desktop/photo/output") 

# 사진파일 분류. ~/Desktop/photo/input/ --> ~/Desktop/photo/output/
copy_photo_files("~/Desktop/photo/input", "~/Desktop/photo/output")
# par_copy_photo_files("~/Desktop/photo/input", "~/Desktop/photo/output")



# 파일비교2 (파일경로, 파일명 기준)
# file_compare2("/Users/imac/Desktop/photo/test_compare/disk1", "/Users/imac/Desktop/photo/test_compare/disk2")

# 2개 폴더 동기화. 서로 없는거 copy
# copy_sync("/Users/imac/Desktop/photo/test_compare/disk1", "/Users/imac/Desktop/photo/test_compare/disk2")

# 파일체크 (파일명, 파일사이즈 기준)
# output 폴더와 외장하드 디스크 비교.
re1 = file_compare("/Volumes/seagate/02_photo/2021", "~/Desktop/photo/output") 
# re1


##################################################################################
# seagate <--> SAMSUNG 외장하드로 동기화
# 파일체크 (파일명, 파일사이즈 기준)
re1 = file_compare("/Volumes/seagate/02_photo", "/Volumes/SAMSUNG/02_photo") 
re1
# 파일비교2 (파일경로, 파일명 기준)
re2 = file_compare2("/Volumes/seagate/02_photo", "/Volumes/SAMSUNG/02_photo") 
re2

# 2개 폴더 동기화. 서로 없는거 copy
copy_sync("/Volumes/seagate/02_photo", "/Volumes/SAMSUNG/02_photo")
##################################################################################

re2$path2 %>% 
  group_by(to_path) %>% 
  summarise(n()) %>% 
  print(n = Inf)





copy_sync()

re2 = file_compare2("/Volumes/seagate/02_photo/etc", "/Volumes/SAMSUNG/02_photo/etc") 
re2
re2$path1 %>% 
  filter(!str_detect(full_path, '2020-10-01|2020-10-24|2020-12-13'))


dir.create("/Volumes/SAMSUNG/02_photo/2020/2020-10-01/JPG", recursive = T)
file.copy("/Volumes/SAMSUNG/02_photo/2020/2020-10-01/JPG/P1300958.JPG", "/Volumes/seagate/02_photo/2020/2020-10-01/JPG/", overwrite = F, copy.date = T)
