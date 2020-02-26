library(tidyverse)
library(xml2)

x = read_xml(file.path(getwd(), "data", "CORPCODE_20200226.xml"))
x1 = xml_children(x)
x2 = xml_children(x1)
x3 = xml_text(x2, trim = T) 
x4 = matrix(x3, ncol = 4, byrow = T)

result = read_xml(file.path(getwd(), "data", "CORPCODE_20200226.xml")) %>% 
  xml_children() %>% 
  xml_children() %>% 
  xml_text(trim = T) %>% 
  matrix(ncol = 4, byrow = T)
