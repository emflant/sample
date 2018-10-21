# install.packages(c("hflights"))
library(dplyr)
library(hflights)
dim(hflights) # Dimensions

hflights_df <- as_tibble(hflights)
hflights_df


filter(hflights_df, Month == 1, DayofMonth == 1)


