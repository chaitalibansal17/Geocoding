library(leaflet)
library(dplyr)
ct <- read.csv("output.csv", stringsAsFactors=FALSE) # Brings in the file 'ctlist.csv'
# Be sure to first set the working directory in R to where the file is listed


m <- leaflet(ct) %>% addTiles('http://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}.png', attribution='Map tiles by <a href="http://stamen.com">Stamen Design</a>, <a href="http://creativecommons.org/licenses/by/3.0">CC BY 3.0</a> &mdash; Map data &copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>') %>% 
  setView(-72.690940, 41.651426, zoom = 8) %>% 
  addCircles(~lng, ~lat, popup=ct$type, weight = 3, radius=150, 
             color="#B22222", stroke = TRUE, fillOpacity = 1) %>% 
  addLegend("bottomright", colors= "#B22222", labels="Street crimes")

m