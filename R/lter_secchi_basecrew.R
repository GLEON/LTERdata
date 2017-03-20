#' @title Get secchi and other standard base crew observed data
#' 
#' @description Data from here https://lter.limnology.wisc.edu/dataset/north-temperate-lakes-lter-secchi-disk-depth-other-auxiliary-base-crew-sample-data-1981-curr
#' 
#' @import httr
#' 
#' 
#' 
#' @export
#' 
lter_secchi_basecrew = function(){
	

	res = GET("https://lter.limnology.wisc.edu/file/11787/download?token=U1hCs6r6Pt6YKiRsgaZJUJHd9YySzsAO4hp0kDX-qlo")
	
	stop_for_status(res)
	table = read.csv(text=content(res, type = 'text/csv', as = 'text'))
	table$date = as.POSIXct(table$sampledate)
	
	return(table)
}