library(tidyverse)

tb = tibble(name = c("a", "b", "c", "a", "d"),
            desc = c("aaaaa", "bbbbb", "ccccc", "ddddd", "eeeee"))
tb
# A tibble: 5 × 2
# name  desc 
# <chr> <chr>
#   1 a     aaaaa
# 2 b     bbbbb
# 3 c     ccccc
# 4 a     ddddd
# 5 d     eeeee
tb %>% 
  group_by(name) %>% 
  summarise(result = paste0(desc, collapse = ","))
