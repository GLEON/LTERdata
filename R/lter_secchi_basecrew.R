#lter_secchi_basecrew()

#'@title Get secchi and other standard base crew observed data
#'
#'@description Data from here https://lter.limnology.wisc.edu/data/filter/5724
#'
#'@import httr
#'
#'@inheritParams lter_north_chla
#'
#'
#'@export
lter_secchi_basecrew = function(name='Anonymous Aardvark', email='anonymous@1.edu', reason="Academic+Research", start='1950-01-01', end='2020-01-01'){
	
	#CURL Command
	# curl "https://lter.limnology.wisc.edu/data/filter/5724" 
	# -H "Cookie: optimizelySegments="%"7B"%"22204658328"%"22"%"3A"%"22false"%"22"%"2C"%"22204728159"%"22"%"3A"%"22none"%"22"%"2C"%"22204736122"%"22"%"3A"%"22direct"%"22"%"2C"%"22204775011"%"22"%"3A"%"22gc"%"22"%"7D; optimizelyEndUserId=oeu1419761408485r0.7292844427283853; optimizelyBuckets="%"7B"%"7D; s_lv=1419761446090; s_cc=true; s_fid=17935582FB4C301B-052CC5D95FE25110; s_sq="%"5B"%"5BB"%"5D"%"5D; __unam=9bd5df7-14ac1773a32-1c3cdc3-2; wt3_eid="%"3B935649882378213"%"7C2142368473800796009; _ga=GA1.2.1019974530.1423684739; __gads=ID=a5823b8b7b01f183:T=1423684732:S=ALNI_MZo6LPVi4EWg1lBqc57pecBk3ij4g; wt3_sid="%"3B935649882378213; oup-cookie=1_10-3-2015; SESS5e81a5bef6fe57d03ef4ba84c3fa2737=pa8r4uglmgtdoqm11ttn9r2366; datacatalog_audit="%"7B"%"22name"%"22"%"3A"%"22Luke+Winslow"%"22"%"2C"%"22email"%"22"%"3A"%"22lwinslow"%"40usgs.gov"%"22"%"2C"%"22purpose"%"22"%"3A"%"22Academic+Research"%"22"%"7D; has_js=1; __utma=80507144.1019974530.1423684739.1428595564.1428604407.5; __utmb=80507144.6.10.1428604407; __utmc=80507144; __utmz=80507144.1425321014.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none)" 
	# -H "Origin: https://lter.limnology.wisc.edu" -H "Accept-Encoding: gzip, deflate" -H "Accept-Language: en-US,en;q=0.8" -H "User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36" -H "Content-Type: application/x-www-form-urlencoded" -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8" -H "Cache-Control: max-age=0" -H "Referer: https://lter.limnology.wisc.edu/data/filter/5724" -H "Connection: keep-alive" 
	# --data "chk_lakeid=1&chk_year4=1&chk_daynum=1&chk_sampledate=1&chk_sta=1&chk_secview=1&chk_secnview=1&chk_timeon=1&chk_timeoff=1&chk_airtemp=1&chk_windir=1&chk_windspd=1&chk_waveht=1&chk_cloud=1&chk_ice=1&filter_year4_min=0&filter_year4_max=0&filter_sampledate_from"%"5Bdate"%"5D=1981-04-22&filter_sampledate_from"%"5Btime"%"5D=00"%"3A00&filter_sampledate_to"%"5Bdate"%"5D=2014-11-13&filter_sampledate_to"%"5Btime"%"5D=00"%"3A00&op=CSV&form_build_id=form-82ce073d67a10377ea054aa42bbd76a3&form_id=datacatalog_datadownload_form" --compressed
	
	header = c('Accept-Encoding'='gzip, deflate',
						 'Accept-Language'='en-US,en;q=0.8', 
						 'User-Agent' = 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36',
						 'Accept' = 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
						 'Referer' = 'https://lter.limnology.wisc.edu/data/filter/5734',
						 'Cookie' = paste0('optimizelySegments=%7B%22204658328%22%3A%22false%22%2C%22204728159%22%3A%22none%22%2C%22204736122%22%3A%22direct%22%2C%22204775011%22%3A%22gc%22%7D; optimizelyEndUserId=oeu1419761408485r0.7292844427283853; optimizelyBuckets=%7B%7D; s_lv=1419761446090; s_cc=true; s_fid=17935582FB4C301B-052CC5D95FE25110; s_sq=%5B%5BB%5D%5D; __unam=9bd5df7-14ac1773a32-1c3cdc3-2; wt3_eid=%3B935649882378213%7C2142368473800796009; _ga=GA1.2.1019974530.1423684739; __gads=ID=a5823b8b7b01f183:T=1423684732:S=ALNI_MZo6LPVi4EWg1lBqc57pecBk3ij4g; wt3_sid=%3B935649882378213; oup-cookie=1_10-3-2015; SESS5e81a5bef6fe57d03ef4ba84c3fa2737=pa8r4uglmgtdoqm11ttn9r2366; datacatalog_audit=%7B%22name%22%3A%22', name, '%22%2C%22email%22%3A%22', email, '%22%2C%22purpose%22%3A%22', reason, '%22%7D; has_js=1; __utma=80507144.1019974530.1423684739.1428358072.1428595564.4; __utmb=80507144.4.10.1428595564; __utmc=80507144; __utmz=80507144.1425321014.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none)'),
						 'Connection' = 'keep-alive',
						 'Cache-Control'='max-age=0')
	
	body = list(chk_lakeid=1, chk_year4=1, chk_daynum=1, chk_sampledate=1, chk_sta=1, chk_secview=1, chk_secnview=1, chk_timeon=1, chk_timeoff=1, chk_airtemp=1, chk_windir=1, chk_windspd=1, chk_waveht=1, chk_cloud=1, chk_ice=1, filter_year4_min=0, filter_year4_max=0, 'filter_sampledate_from[date]'=start, 'filter_sampledate_from[time]'='00:00', 'filter_sampledate_to[date]'=end, 'filter_sampledate_to[time]'='00:00', op='CSV', form_build_id='form-82ce073d67a10377ea054aa42bbd76a3', form_id='datacatalog_datadownload_form')
	
	res = POST("https://lter.limnology.wisc.edu/data/filter/5724", body=body, add_headers(.headers=header), encode="form")
	
	stop_for_status(res)
	
	return(content(res))
}