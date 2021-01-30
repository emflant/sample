install.packages("googlesheets4")
library(googlesheets4)



gs4_example("chicken-sheet")
gs4_deauth()

read_sheet("https://docs.google.com/spreadsheets/d/12_EiSZse45ZeqPFLYCcq1sQUd0tQXP3AufgchrUKYsc/edit#gid=0")
