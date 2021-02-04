source("~/sample/R/test/photo_compare.R")

# 파일체크 (파일명, 파일사이즈 기준)
file_compare("~/Desktop/photo/input", "~/Desktop/photo/output") 

# 사진파일 분류. ~/Desktop/photo/input/ --> ~/Desktop/photo/output/
copy_photo_files("~/Desktop/photo/input", "~/Desktop/photo/output")
# par_copy_photo_files("~/Desktop/photo/input", "~/Desktop/photo/output")



# 파일비교 (파일경로, 파일명 기준)
file_compare2("/Users/imac/Desktop/photo/test_compare/disk1", "/Users/imac/Desktop/photo/test_compare/disk2")

# 2개 폴더 동기화. 서로 없는거 copy
copy_sync("/Users/imac/Desktop/photo/test_compare/disk1", "/Users/imac/Desktop/photo/test_compare/disk2")
