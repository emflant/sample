install.packages("leaflet")
library(leaflet)

popup = c("Robin", "Jakub", "Jannes")
leaflet() |>
  addProviderTiles("NASAGIBS.ViirsEarthAtNight2012") |>
  addMarkers(lng = c(-3, 23, 11),
             lat = c(52, 53, 49), 
             popup = popup)


library(sf)
# install.packages("sf")
# install.packages("sf", configure.args = "--with-gdal-config=/opt/homebrew/bin/gdal-config", type = "source")
# install.packages("terra")
# install.packages("spData")
# install.packages("spDataLarge", repos = "https://nowosad.r-universe.dev")

vignette(package = "sf") 
vignette("sf1") 
library(spData)
class(world)
world
plot(world)

world_asia = world[world$continent == "Asia", ]
asia = st_union(world_asia)
plot(world["pop"], reset = FALSE)
plot(asia, add = TRUE, col = "red")

india = world[world$name_long == "India", ]
plot(st_geometry(india), expandBB = c(0, 0.2, 0.1, 1), col = "gray", lwd = 1)
plot(st_geometry(world_asia), add = TRUE)

korea = world[world$name_long == "Republic of Korea", ]
plot(st_geometry(korea), expandBB = c(0, 0.3, 0.1, 1), col = "gray", lwd = 1)
plot(st_geometry(world_asia), add = T)

plot(korea)

library(tidyverse)
world %>% 
  filter(str_detect(name_long, "Korea")) %>% 
  select(name_long)
# Republic of Korea


