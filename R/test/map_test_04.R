library(tmap)
library(sf)

library(raster)
library(dplyr)
library(spData)
library(spDataLarge)

nz %>% str
tm_shape(spData::us_states) +
  tm_fill()

tm_shape(us_states) +
  tm_borders() 


spData::us_states

map_sido = st_read("~/data/map/sido_20220324/ctp_rvn.shp")

map_sido$CTP_KOR_NM = iconv(map_sido$CTP_KOR_NM,
                            from='CP949',
                            to='UTF-8', 
                            sub=NA,
                            mark=TRUE,
                            toRaw=FALSE)

map_sido

map_sido_spatial = as_Spatial(map_sido)
map_sido_spatial


map_sido_df <- fortify(map_sido_spatial)
map_sido_df
ggplot(map_sido_df, aes(x=long, y=lat, group = group)) +
  geom_polygon(fill='white', color='black')+
  coord_quickmap()
