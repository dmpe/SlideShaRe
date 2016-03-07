api_calls <- function(){
  server_list <- c("https://www.slideshare.net/api/2/get_user_favorites",
                   "https://www.slideshare.net/api/2/get_user_contacts",
                   "https://www.slideshare.net/api/2/get_user_tags",
                   "https://www.slideshare.net/api/2/get_slideshow")
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

server_errors <- function(){
  err <- data.frame(key = c(0:17, 70:75, 99, 100),
                    desc = c("No API Key Provided",
                            "Failed API validation",
                            "Failed User authentication",
                            "Missing title",
                            "Missing file for upload",
                            "Blank title",
                            "Slideshow file is not a source object",
                            "Invalid extension",
                            "File size too big",
                            "SlideShow Not Found",
                            "User Not Found",
                            "Group Not Found",
                            "No Tag Provided",
                            "Tag Not Found",
                            "Required Parameter Missing",
                            "Search query cannot be blank",
                            "Insufficient permissions",
                            "Incorrect parameters",
                            "Account already linked",
                            "No linked account found",
                            "User not created",
                            "Invalid Application ID",
                            "Login already exists",
                            "EMail already exists",
                            "Account Exceeded Daily Limit",
                            "Your Account has been blocked"))
  return(err)
}






















