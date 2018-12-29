

list.files()


getwd()

file.path(getwd(), 'doc/')
setwd(file.path(getwd(), 'doc/'))

setwd('../docs')
getwd()
list.files()
dd <- system('ls -al', intern = T)
dd

getwd()

list.files(R.home(), full.names = T)

library(tidyverse)


copy_origin <- list.files(getwd(), full.names = T)[str_detect(list.files(), '^index.html$')]
file.copy(copy_origin, "../docs/index.html", overwrite = T, copy.date = T)


