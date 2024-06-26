% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getMap.R
\name{getMap}
\alias{getMap}
\title{China Map Data from AutoNavi Map}
\usage{
getMap(
  name = NULL,
  code = "100000",
  subRegion = FALSE,
  returnClass = c("sf", "sv")
)
}
\arguments{
\item{name}{character. An name of the China's administrative division at the
county level or above. The name of administrative division needs to be consistent
with the website provided by the Ministry of Civil Affairs of the People's
Republic of China in 2022 (\url{https://www.mca.gov.cn/mzsj/xzqh/2022/202201xzqh.html}).}

\item{code}{character. A code of the China's administrative division at the
county level or above. The code of administrative division needs to be consistent
with the website provided by the Ministry of Civil Affairs of the People's
Republic of China in 2022 (\url{https://www.mca.gov.cn/mzsj/xzqh/2022/202201xzqh.html}).}

\item{subRegion}{A logical evaluating to TRUE or FALSE indicating whether the
sub regions of the administrative region should be included. The default is
FALSE, not included.}

\item{returnClass}{A string determining the spatial object to return. Either
"sf" for for simple feature (from 'sf' package, the default) or "sv" for a
'SpatVector' (from 'terra' package).}
}
\value{
a 'sf' or a 'SpatVector' object.
}
\description{
According to the code and name of the administrative division at the county
level and above provided by the Ministry of Civil Affairs of the People's
Republic of China in 2022 (\url{https://www.mca.gov.cn/mzsj/xzqh/2022/202201xzqh.html}),
get the map vector file online from the website of AutoNavi Map (\url{http://datav.aliyun.com/portal/school/atlas/area_selector}).
}
\examples{
library(cnmap)

map1 <- getMap(code = "110000") # get the map data of Beijing City

map2 <- getMap(code = "100000") # get the map data of China.

# get the map data of Beijing City, and sub regions is also included.
map1 <- getMap(code = "110000", subRegion = TRUE)

}
