# example getting mendota epi Chlorophyll concentration

library(LTERdata)
library(dplyr)
library(lubridate)

##The Request:
# Specifically, I am looking for a June-August average ± SD 
# in the buoy year (2010 for Mendota) for Epilimnetic chl-a, 
# 1% PAR depth, and secchi depth.


chl_data = lter_north_chla(name = 'Luke Winslow', email = 'lwinslow@usgs.gov', start='2010-05-01', end='2010-09-01')
chl_data$sampledate = as.POSIXct(chl_data$sampledate)
chl_data$month      = month(chl_data$sampledate)

#filter for lake and depths
##Ok, now depths are annoying. They are both discrete (e.g., 2m) and integrated (e.g., 0-8m) 
#  Most data are integrated 0-2 and 0-8, which are both epi, which I want
chl_data = filter(chl_data, lakeid=='ME', depth_range_m=='0-2' | depth_range_m=='0-8')

mean(chl_data$correct_chl_fluor)
sd(chl_data$correct_chl_fluor)


#do the same for secchi values
secchi = lter_secchi_basecrew(name = 'Luke Winslow', email = 'lwinslow@usgs.gov', start='2010-05-01', end='2010-09-01')

mean(secchi$secnview)
sd(secchi$secnview)


