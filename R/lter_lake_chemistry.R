#' @title LTER lakes Chemical Limnology
#' 
#' @description 
#' Return the chemical limnology data for the NTL-LTER lakes. 
#' 
#' 
#' 
#' @import httr
#' 
#' 
#' @export
lter_lake_chemistry = function(){
  
  r = GET('https://lter.limnology.wisc.edu/file/11784/download?token=vqhU4mTNX5CgXa7ifQXFhQJHvwXcImlSp-Yq4mrPyYI')
  
  d = content(r)
  d$date = as.POSIXct(d$sampledate)
  
  return(as.data.frame(d))
}