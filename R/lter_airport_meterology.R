#'@title Get high-resolution meterology data
#'
#'@description LTER Airport meterology station. Data are pulled the website here https://lter.limnology.wisc.edu/data/filter/10856
#'
#'@import httr
#'
#'@inheritParams lter_north_chla
#'
#'@note
#'This query can be very slow. There is a large amount of high-res met-station data. For robustness, I recommend querying around a year at a time. Longer queries may time out.
#'
#'@author Luke Winslow
#'
#'
#'@export
#'
lter_airport_meterology = function(){
	

  stop('currently not implemented')
  
	header = c('Accept-Encoding'='gzip, deflate',
						 'Accept-Language'='en-US,en;q=0.8', 
						 'Accept' = 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
						 'Referer' = 'https://lter.limnology.wisc.edu/data/filter/5734',
						 'Cookie' = paste0('optimizelySegments=%7B%22204658328%22%3A%22false%22%2C%22204728159%22%3A%22none%22%2C%22204736122%22%3A%22direct%22%2C%22204775011%22%3A%22gc%22%7D; optimizelyEndUserId=oeu1419761408485r0.7292844427283853; optimizelyBuckets=%7B%7D; s_lv=1419761446090; s_cc=true; s_fid=17935582FB4C301B-052CC5D95FE25110; s_sq=%5B%5BB%5D%5D; __unam=9bd5df7-14ac1773a32-1c3cdc3-2; wt3_eid=%3B935649882378213%7C2142368473800796009; _ga=GA1.2.1019974530.1423684739; __gads=ID=a5823b8b7b01f183:T=1423684732:S=ALNI_MZo6LPVi4EWg1lBqc57pecBk3ij4g; wt3_sid=%3B935649882378213; oup-cookie=1_10-3-2015; SESS5e81a5bef6fe57d03ef4ba84c3fa2737=pa8r4uglmgtdoqm11ttn9r2366; datacatalog_audit=%7B%22name%22%3A%22', name, '%22%2C%22email%22%3A%22', email, '%22%2C%22purpose%22%3A%22', reason, '%22%7D; has_js=1; __utma=80507144.1019974530.1423684739.1428358072.1428595564.4; __utmb=80507144.4.10.1428595564; __utmc=80507144; __utmz=80507144.1425321014.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none)'),
						 'Connection' = 'keep-alive',
						 'Cache-Control'='max-age=0')
	
	body = list(chk_year4=1, chk_daynum=1, chk_month=1, chk_sampledate=1, chk_sample_time=1, chk_data_freq=1, chk_tot_precip=1, chk_flag_tot_precip=1, chk_air_temp=1, chk_flag_air_temp=1, chk_rel_hum=1, chk_flag_rel_hum=1, chk_max_wind_speed_1min=1, chk_flag_max_wind_speed_1min=1, chk_wind_speed=1, chk_flag_wind_speed=1, chk_resultant_wind_speed=1, chk_flag_resultant_wind_speed=1, chk_resultant_wind_direction=1, chk_flag_resultant_wind_direction=1, chk_std_dev_wind_direction=1, chk_flag_std_dev_wind_direction=1, chk_dewpoint_temp=1, chk_flag_dewpoint_temp=1, chk_par=1, chk_flag_par=1, chk_shortwave_rad_licor=1, chk_flag_shortwave_rad_licor=1, chk_sw_sol_rad_eppley=1, chk_flag_sw_sol_rad_eppley=1, chk_longwave_rad_eppley=1, chk_flag_longwave_rad_eppley=1, chk_wind_dir=1, chk_flag_wind_direction=1, filter_year4_min=0, filter_year4_max=0, filter_month_min=0, filter_month_max=0, 'filter_sampledate_from[date]'=start, 'filter_sampledate_from[time]'='00:00', 'filter_sampledate_to[date]'=end, 'filter_sampledate_to[time]'='00:00', op='CSV', form_build_id='form-596c675cb7d66ae6c91e181d92615558', form_id='datacatalog_datadownload_form')
	
	res = POST("https://lter.limnology.wisc.edu/data/filter/10856", body=body, add_headers(.headers=header), encode="form")
	
	stop_for_status(res)
	
	#convert date to POSIXct for awesomeness
	data = content(res)
	hour = floor(data$sample_time[1:100]/100)
	min  = data$sample_time %% 100
	
	data$sampledate = lter_POSIXct(data$sampledate, data$sample_time, tz="GMT")
	
	return(data)
}