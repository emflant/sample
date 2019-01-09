

list.files()


getwd()

file.path(getwd(), 'doc/')
setwd(file.path(getwd(), 'doc/'))

setwd('../docs')
getwd()
list.files()
dd <- system('ls -al', intern = T)
dd

library(tidyverse)

getwd()

system('ls -al')

list.files(R.home(), full.names = T)

library(tidyverse)
str_c(c("a", NA, "b"), "-d")
search_file
# [1] "covariance.nb.html|credit_card.nb.html|file_system.nb.html|index.html|interest_rate_risk.nb.html|normal_distribution.nb.html"

list.files('../docs', pattern = '\\.html$', full.names = T)
str_c(list.files('../docs', pattern = '\\.html$'), collapse = "|")
search_file <- str_detect(list.files(full.names = T, recursive = T), 
                          str_c(list.files('../docs', '\\.html$'), collapse = "|"))
copy_origin <- list.files(full.names = T, recursive = T)[search_file]
copy_origin

file.copy(copy_origin, "../docs/", overwrite = T, copy.date = T)



