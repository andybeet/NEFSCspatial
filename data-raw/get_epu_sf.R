## Ecological Production Units

# A function to process and make ecological production unit (EPU) shapefiles available in the ecodata package.

# Read more about the delineation of EPUs at https://noaa-edab.github.io/tech-doc/epu.html

library(sf)
library(rgdal)

gis.dir <- here::here('data-raw','gis')


get_epu_sf <- function(save_clean){
  crs <- "+proj=longlat +lat_1=35 +lat_2=45 +lat_0=40 +lon_0=-77+x_0=0
+y_0=0 +datum=NAD83 +no_defs +ellps=GRS80 +towgs84=0,0,0"
  epu_shp <- rgdal::readOGR(file.path(gis.dir, "EPU_Extended.shp"), verbose = F)
  raster::crs(epu_shp) <- crs
  epu_sf <- as(epu_shp, "sf")
  
  if (save_clean){
    usethis::use_data(epu_sf)
  } else {
    return(epu_sf)
  }
}

get_epu_sf(save_clean = TRUE)

