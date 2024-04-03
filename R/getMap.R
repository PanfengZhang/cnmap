# Hide variables from R CMD check
if (getRversion() >= "2.15.1") {
  utils::globalVariables("ad")
}

#' @title China Map Data from AutoNavi Map
#' @description
#' According to the code and name of the administrative division at the county 
#' level and above provided by the Ministry of Civil Affairs of the People's 
#' Republic of China in 2022 (<https://www.mca.gov.cn/mzsj/xzqh/2022/202201xzqh.html>), 
#' get the map vector file online from the website of AutoNavi Map (<http://datav.aliyun.com/portal/school/atlas/area_selector>).
#' @param name character. An name of the China's administrative division at the 
#' county level or above. The name of administrative division needs to be consistent 
#' with the website provided by the Ministry of Civil Affairs of the People's 
#' Republic of China in 2022 (<https://www.mca.gov.cn/mzsj/xzqh/2022/202201xzqh.html>).
#' @param code character. A code of the China's administrative division at the 
#' county level or above. The code of administrative division needs to be consistent 
#' with the website provided by the Ministry of Civil Affairs of the People's 
#' Republic of China in 2022 (<https://www.mca.gov.cn/mzsj/xzqh/2022/202201xzqh.html>).
#' @param subRegion A logical evaluating to TRUE or FALSE indicating whether the
#' sub regions of the administrative region should be included. The default is 
#' FALSE, not included.
#' @param returnClass A string determining the spatial object to return. Either 
#' "sf" for for simple feature (from 'sf' package, the default) or "sv" for a 
#' 'SpatVector' (from 'terra' package).
#' @return a 'sf' or a 'SpatVector' object.
#' @examples
#' library(cnmap)
#' 
#' map1 <- getMap(code = "110000") # get the map data of Beijing City
#' 
#' map2 <- getMap(code = "100000") # get the map data of China.
#' 
#' # get the map data of Beijing City, and sub regions is also included.
#' map1 <- getMap(code = "110000", subRegion = TRUE)
#' 
#' @importFrom terra vect
#' @importFrom sf read_sf
#' @export
getMap <- function(name = NULL, code = "100000", subRegion = FALSE, 
                   returnClass = c("sf", "sv")) {
  urlmap1 <- "https://geo.datav.aliyun.com/areas_v3/bound/"
  # diri <- "C:/documents/datasets/map_data/China_amap/administrativeDivisionCode行政区划代码.csv"
  # ad <- read.csv(diri, skip = 3)
  
  # select region
  if (!is.null(name)) {
    name <- charToRaw(name) |> paste(collapse = "")
    code <- ad[ad$name == name, "ID"]
    urlmap2 <- paste0(urlmap1, code)
    
  } else {
    urlmap2 <- paste0(urlmap1, code)
  }
  
  # Whether or not to include sub-regions
  if (subRegion) {
    urlmap <- paste0(urlmap2, "_full.json")
  } else {
    urlmap <- paste0(urlmap2, ".json")
  }
  
  # Either "sf" for for simple feature (from 'sf', the default) or "sv" for a 'SpatVector' (from 'terra')
  returnClass <- match.arg(returnClass)
  if (returnClass == "sf") {
    cmap <- sf::read_sf(urlmap)
  } else {
    cmap <- terra::vect(urlmap)
  }
  return(cmap)
}


