
region_1 <- district_geo[district_geo$ustp_region == '1', ]

region1 <- st_union(region_1)
region1 <- st_as_sf(region1)

plot(district_geo[0], reset = F)
plot(region1, add = T, color = 'green')

leaflet(options = leafletOptions(dragging = TRUE,
                                 minZoom = 4, 
                                 maxZoom = 8)) %>%
  addProviderTiles(provider = 'CartoDB') %>%            
  setView(lng = -95.7129, lat = 37.0902, zoom = 4) %>%
  addPolygons(data = region1,
              weight = 1,                     
              highlightOptions = highlightOptions(color = "white", weight = 2,
                                                  bringToFront = FALSE),
              fillOpacity = 0.4)
