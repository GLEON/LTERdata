
#'@title Convert LTER date and numeric sampletime into POSIXct
#'
#'@param sampledate LTER sampledate, typically in YYYY-MM-DD format. Sometimes has additional 00:00:00 appended.
#'@param sampletime LTER sampletime, a numeric value where 100 is 1:00, 130 is 1:30, 30 is 0:30, and etc.
#'@param tz Timezone for output POSIXct value.
#'
#'@description
#'LTER has a integer numeric format for times where the 100's place is used for hours, and the 10's place is 
#'used for minutes. This function takes a date and that LTER time and returns a POSIXct representation.
#'
#'@examples
#'
#'nice_r_datetime = lter_POSIXct('2014-01-01', 1230)
#'
#'@export
lter_POSIXct = function(sampledate, sampletime, tz="GMT"){
	
	hour = floor(sampletime/100)
	min  = sampletime %% 100
	
	##merge together, truncate sampledate to day as *sometimes* this comes in with time, sometimes it doesn't. Hard to check
	##  when, so it is easie
	datetime = trunc(as.POSIXct(sampledate, tz=tz), units='days') + unclass(ISOdatetime(1970, 1, 1, hour, min, 0, tz=tz))
	return(datetime)
}
