# example getting mendota epi Chlorophyll concentration

library(LTERdata)
library(dplyr)
library(lubridate)

##The Request:
# Specifically, I am looking for a June-August average +/- SD 
# in the buoy year (2010 for Mendota) for Epilimnetic chl-a, 
# 1% PAR depth, and secchi depth.


chl_data = lter_chla()
chl_data$sampledate = as.POSIXct(chl_data$sampledate)
chl_data$month      = month(chl_data$sampledate)

#filter for lake and depths
##Just grab shallow (<8 m) depths for Mendota
chl_data = filter(chl_data, lakeid=='ME', depth < 8)

mean(chl_data$chlor, na.rm=TRUE)
sd(chl_data$chlor, na.rm=TRUE)


#do the same for secchi values
secchi = lter_secchi_basecrew()

secchi = filter(secchi, lakeid=='ME')
mean(secchi$secnview, na.rm=TRUE)
sd(secchi$secnview, na.rm=TRUE)


