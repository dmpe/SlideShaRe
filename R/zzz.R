api_calls <- function(){
  server_list <- c("https://www.slideshare.net/api/2/get_user_favorites",
                   "https://www.slideshare.net/api/2/get_user_contacts",
                   "https://www.slideshare.net/api/2/get_user_groups")
  return(server_list)
}

#' @import openssl
hash_concat <- function() {
  concatinatedString <- paste0(auth_shared_secret(NULL), unix_timestamp())
  hash <- openssl::sha1(concatinatedString)
  return(hash)
}

#' @import lubridate
unix_timestamp <- function() {
  return(round(as.numeric(lubridate::now())))
}
