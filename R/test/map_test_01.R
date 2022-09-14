# install.packages("rgdal")

library(rgdal)
library(tidyverse)
v_map = readOGR("~/data/map/CTPRVN_20220324/ctp_rvn.shp", encoding = "euc-kr")
class(v_map)

v_map@data
v_map@polygons

df_map = fortify(v_map)

df_map %>% count()
df_map %>% head(1)

df_map1 = df_map %>% filter(id == 0 | id == 1 | id == 2)
ggplot(df_map1, aes(x = long, y = lat, group = group)) +
  geom_polygon(fill = "gray100", colour = "gray0") +
  coord_map()






