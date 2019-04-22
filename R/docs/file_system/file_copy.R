library(tidyverse)


source_files = list.files(full.names = T, 
           path = "/Volumes/PhotoDisk/99_etc/LSR",
           recursive = T,
           include.dirs = F)

source_files
target_files = file.path("/Volumes/PhotoDisk/99_etc/LSR_result", str_sub(basename(source_files), start = 4))

target_files
# file.copy(copy_origin, "../docs/", overwrite = T, copy.date = T)
file.copy(source_files, target_files, overwrite = T)



