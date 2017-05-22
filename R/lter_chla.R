
#' @title Get LTER Chlorphyll Data
#' 
#' @description
#' Return a merged data frame of Northern and Southern lake chlorophyll 
#' data 
#' 
#' 
#' 
#' @import httr
#' @import dplyr
#' 
#' @export
lter_chla = function(){
	
	res = GET("https://lter.limnology.wisc.edu/file/11473/download?token=BC5qpqq2MeQZPH9EuKy-H144GVd-QLaVeSvwHGg3emQ")
	
	stop_for_status(res)
	north = read.csv(text=content(res, type = 'text/csv', as = 'text'))
	north$date = as.POSIXct(north$sampledate)
	
	northsub = select(north, lakeid, sampledate, depth, chlor, phaeo)
	
	
	res = GET("https://lter.limnology.wisc.edu/file/11695/download?token=SYBJAPiClv7HvK2q4ruZn-3ur-eEG99KKVItI5b2H_Q")
	
	stop_for_status(res)
	south = read.csv(text=content(res, type = 'text/csv', as = 'text'))
	south$date = as.POSIXct(south$sampledate)
	
	southsub = transmute(south, lakeid, sampledate, depth=depth_range_m, chlor=mono_chl_spec, phaeo=phaeo_spec)
	
	bothchla = rbind(northsub, southsub)
	
	return(bothchla)
}
