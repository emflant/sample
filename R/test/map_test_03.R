

library(tidyverse)
library(rgdal)
library(magrittr)
sido = readOGR("~/data/map/Z_SOP_BND_SIDO_PG/Z_SOP_BND_SIDO_PG.shp",
               layer = "Z_SOP_BND_SIDO_PG",
               encoding = "CP949")

class(sido)
sido@data %>% str
sido@data

df_sido = ggplot2::fortify(sido)
df_sido %>% count()
df_sido %>% str
df_sido %>% head



df_sido1 = df_sido %>% as_tibble() %>% 
  filter(order %% 100 == 1)
df_sido1
ggplot(df_sido1, aes(long, lat, group = group)) +
  geom_polygon()



df_sido1 = df_sido %>% as_tibble() %>% 
  filter(id == 1, piece == 1, order %% 300 == 1)
ggplot(df_sido1, aes(long, lat, group = group)) +
  geom_polygon(fill = "gray70", colour = "black")



df_sido1 = df_sido %>% as_tibble() %>% 
  filter(piece == 1, order %% 10 == 1)
df_sido1 = df_sido %>% as_tibble() %>% 
  filter(id == 12)
ggplot(df_sido1, aes(long, lat, group = group)) +
  geom_polygon(fill = "gray70", colour = "black") 

# 좌표계를 변환하는 함수를 생성합니다. (GRS80 -> WGS84)
convertCoords <- function(lon, lat) {
  
  # 2개의 벡터를 입력 받아 데이터프레임으로 만들고
  # SpatialPoints 타입으로 변환합니다.
  xy <- data.frame(lon = lon, lat = lat)
  coordinates(obj = xy) <- ~ lon + lat
  
  # CRS(Coordinate Reference System)을 설정합니다. 
  fmCRS <- CRS('+proj=tmerc +lat_0=38 +lon_0=127.5 +k=0.9996 +x_0=1000000 +y_0=2000000 +ellps=GRS80 +units=m +no_defs')
  toCRS <- CRS('+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs')
   
  # GRS80 좌표를 WGS84 좌표로 변환하여 반환합니다.
  xy %>% 
    SpatialPoints(proj4string = fmCRS) %>% 
    spTransform(CRSobj = toCRS) %>% 
    SpatialPoints() %>% 
    as.data.frame() %>% 
    set_colnames(c('lonWGS84', 'latWGS84')) %>% 
    return()
}

# sidoDf 위경도 좌표를 변환합니다.
changedCoords <- convertCoords(lon = df_sido1$long, lat = df_sido1$lat)
changedCoords
# 변환된 자표를 sidoDf에 열 기준으로 추가합니다.
df_sido2 <- cbind(df_sido1, changedCoords)
df_sido2

ggplot(df_sido2, aes(lonWGS84, latWGS84, group = group)) +
  geom_polygon(fill = "gray70", colour = "black") +
  coord_map() +
  theme_minimal()
