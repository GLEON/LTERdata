
#'@import httr
#'
#'@keywords internal
get_user_agent = function(){
  return(paste0(httr:::default_ua(), ' LTERdata/', packageVersion(getPackageName())))
}