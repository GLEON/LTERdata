
#'@title Get North LTER Chlorphyll Data
#'
#'@param name Your name for LTER record keeping
#'@param email Your email address for LTER record keeping (you will not be unneccessarily contacted)
#'@param reason Your reason for usage of the data
#'@param start The earliest date to request data
#'@param end The latest date to request data
#'
#'@import httr
#'
#'@export
#'
lter_north_chla = function(name='Anonymous Aardvark', email='anonymous@1.edu', reason="Academic+Research", start='1950-01-01', end='2020-01-01'){
	
	header = c('Accept-Encoding'='gzip, deflate',
						 'Accept-Language'='en-US,en;q=0.8', 
						 'User-Agent' = get_user_agent(),
						 'Accept' = 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
						 'Referer' = 'https://lter.limnology.wisc.edu/data/filter/5734',
						 'Cookie' = paste0('optimizelySegments=%7B%22204658328%22%3A%22false%22%2C%22204728159%22%3A%22none%22%2C%22204736122%22%3A%22direct%22%2C%22204775011%22%3A%22gc%22%7D; optimizelyEndUserId=oeu1419761408485r0.7292844427283853; optimizelyBuckets=%7B%7D; s_lv=1419761446090; s_cc=true; s_fid=17935582FB4C301B-052CC5D95FE25110; s_sq=%5B%5BB%5D%5D; __unam=9bd5df7-14ac1773a32-1c3cdc3-2; wt3_eid=%3B935649882378213%7C2142368473800796009; _ga=GA1.2.1019974530.1423684739; __gads=ID=a5823b8b7b01f183:T=1423684732:S=ALNI_MZo6LPVi4EWg1lBqc57pecBk3ij4g; wt3_sid=%3B935649882378213; oup-cookie=1_10-3-2015; SESS5e81a5bef6fe57d03ef4ba84c3fa2737=pa8r4uglmgtdoqm11ttn9r2366; datacatalog_audit=%7B%22name%22%3A%22', name, '%22%2C%22email%22%3A%22', email, '%22%2C%22purpose%22%3A%22', reason, '%22%7D; has_js=1; __utma=80507144.1019974530.1423684739.1428358072.1428595564.4; __utmb=80507144.4.10.1428595564; __utmc=80507144; __utmz=80507144.1425321014.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none)'),
						 'Connection' = 'keep-alive',
						 'Cache-Control'='max-age=0')
	body = list(chk_lakeid=1, chk_year4=1, chk_sampledate=1, chk_depth_range_m=1,chk_rep=1, chk_tri_chl_spec=1, chk_mono_chl_spec=1, chk_phaeo_spec=1, chk_uncorrect_chl_fluor=1, chk_correct_chl_fluor=1, chk_phaeo_fluor=1, chk_flag_spec=1, chk_flag_fluor=1, filter_year4_min=0, filter_year4_max=0, 'filter_sampledate_from[date]'=start, 'filter_sampledate_from[time]'='00:00', 'filter_sampledate_to[date]'=end, 'filter_sampledate_to[time]'='00:00', op='CSV', form_build_id='form-772c635e12d1d8d67507132afd94c9dc', form_id='datacatalog_datadownload_form')
	
	res = POST("https://lter.limnology.wisc.edu/data/filter/5734", body=body, add_headers(.headers=header), encode="form")
	
	stop_for_status(res)
	
	return(content(res))

}
