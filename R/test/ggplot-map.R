
library(tidyverse)
library(sf)

v_shp = st_read("~/Downloads/CTPRVN_20220324/ctp_rvn.shp")

ggplot(v_shp) +
  geom_sf()

# https://github.com/gkaramanis/tidytuesday/tree/master/2021/2021-week19
# https://github.com/gkaramanis/tidytuesday/tree/master/2021/2021-week35
# https://github.com/gkaramanis/tidytuesday/tree/master/2020/2020-week09
# https://github.com/gkaramanis/tidytuesday/tree/master/2020/2020-week17
# https://r-graphics.org/recipe-miscgraph-map-shapefile
# https://github.com/davidsjoberg/ggbump
# https://github.com/slowkow/ggrepel