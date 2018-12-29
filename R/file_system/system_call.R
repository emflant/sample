

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

copy_origin
copy_origin <- list.files(getwd(), full.names = T)[str_detect(list.files(), '^index.html$')]
file.copy(copy_origin, "../docs/index.html", overwrite = T, copy.date = T)
search_file <- str_detect(list.files(full.names = T, recursive = T), 
                          'index.html|credit_card.nb.html|file_system.nb.html|normal_distribution.nb.html|interest_rate_risk.nb.html|covariance.nb.html')
copy_origin <- list.files(full.names = T, recursive = T)[search_file]
copy_origin
file.copy(copy_origin, "../docs/", overwrite = T, copy.date = T)
