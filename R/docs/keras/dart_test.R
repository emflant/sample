library(tidyverse)
library(xml2)

# x = read_xml(file.path(getwd(), "data", "CORPCODE_20200226.xml"))
# x1 = xml_children(x)
# x2 = xml_children(x1)
# x3 = xml_text(x2, trim = T) 
# x4 = matrix(x3, ncol = 4, byrow = T)

# xml_child 인덱스로 찾는 방식은 느림.
# col_name = read_xml(file.path(getwd(), "data", "CORPCODE_20200226.xml")) %>% 
#   xml_child(1) %>% 
#   xml_children() %>% 
#   xml_name

# xpath 방식으로 찾는게 더 빠름. 
col_name = read_xml(file.path(getwd(), "data", "CORPCODE_20200226.xml")) %>% 
  xml_find_first(".//list") %>% 
  xml_children %>% 
  xml_name



result = read_xml(file.path(getwd(), "data", "CORPCODE_20200226.xml")) %>% 
  xml_children() %>% 
  xml_children() %>% 
  xml_text(trim = T) %>% 
  matrix(ncol = 4, byrow = T)

colnames(result) = col_name

result = result %>% 
  as_tibble()

