library(tidyverse)

# copy list
list.files('../docs', pattern = '\\.html$', full.names = T)
str_c(list.files('../docs', pattern = '\\.html$'), collapse = "|")

# copy list
search_file <- str_detect(list.files(full.names = T, recursive = T), 
                          str_c(list.files('../docs', '\\.html$'), collapse = "|"))
copy_origin <- list.files(full.names = T, recursive = T)[search_file]
copy_origin

file.copy(copy_origin, "../docs/", overwrite = T, copy.date = T)




