# kospi 
# https://finance.yahoo.com/quote/%5EKS11/

library(tidyverse)


#read_csv(paste0(getwd(), "/data/KS11_20181102.csv"))
# saveRDS(read_csv(paste0(getwd(), "/data/KS11_20181102.csv")), 
#         paste0(getwd(), "/data/KS11_20181102.rds"))


ks11 <- read_rds(paste0(getwd(), "/data/KS11_20181102.rds"))

plot (ks11$Date, ks11$Close, type = "l")

