install.packages("TTR")
install.packages("quantmod")
install.packages("highcharter")
library("quantmod")
library("highcharter")
system("defaults write org.R-project.R force.LANG en_US.UTF-8")
# https://cran.r-project.org/bin/macosx/RMacOSX-FAQ.html#Internationalization-of-the-R_002eapp
hcmap("countries/nz/nz-all")


highchart() %>% 
  hc_chart(type = "column") %>% 
  hc_title(text = "A highcharter chart") %>% 
  hc_xAxis(categories = 2012:2016) %>% 
  hc_add_series(data = c(3900,  4200,  5700,  8500, 11900),
                name = "Downloads")


install.packages("DBI")
