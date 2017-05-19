#' @title LTER lakes Northern Ice data
#' 
#' @description 
#' Return the information on ice on/out for the LTER lakes. 
#' 
#' @note 
#' Northern and southern ice on/off data are not described in exactly the same way, so some liberty was taken here. 
#' Southern data are reported only as "ice_on" and "ice_off". To match the northern data, I have renamed them 
#' "datelastopen" and "datefirstopen" respectively. I feel this is the closest analog. 
#' 
#' 
#' @import httr
#' @import dplyr
#' @importFrom lubridate mdy
#' @import methods
#' @import utils
#' 
#' @export
lter_ice_onoff = function(){
  
  r = GET('https://lter.limnology.wisc.edu/file/11470/download?token=HNlsCKw9OOZTgFLLcnpwCHPxhlrBHBeVtcXlvfQVAXs')
  north = content(r) %>% select(lakeid, year, datefirstopen, datelastopen, datelastice, datefirstice)
  
  r = GET('https://lter.limnology.wisc.edu/file/11471/download?token=nXC_mWDNhqvwGL8JiqS2Zu9Dg1qGK6Jq0FzmBYFT1E8')
  south = content(r) %>% transmute(lakeid, year=year4, datelastopen=mdy(ice_on), datefirstopen=mdy(ice_off), 
                                   datelastice=NA, datefirstice=NA)
  #d$date = as.POSIXct(d$sampledate)
  
  d = rbind(north, south)
  
  return(as.data.frame(d))
}