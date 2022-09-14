world <- map_data(map = 'world', region = '.')

world

neAsia <- map_data(map = 'world',
                   region = c('South Korea', 'North Korea', 'China',
                              'Japan', 'Mongolia', 'Taiwan'))



ggplot(data = neAsia,
         mapping = aes(x = long,
                       y = lat,
                       group = group)) +
  geom_polygon(fill = 'white',
               color = 'black') +
  coord_map()


neKorea <- map_data(map = 'world',
                   region = c('South Korea'))

neKorea
ggplot(data = neKorea,
       mapping = aes(x = long,
                    y = lat,
                    group = group)) +
  geom_polygon(fill = 'white',
              color = 'black') +
  coord_map()
