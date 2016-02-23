#'
#'
#'
#' key: 7CECRDW0HnGsKmAJ8sjQ
#' secret: Z8Pk4MJ4WPX1BefN6exBjkhs9vd74UfTnxDqz7LfQ

userAPIauth <- function(){
  "https://www.goodreads.com/api/auth_user"
}


#' @import httr
#' @export
goodReads_auth <- function(key = "", secret = "") {

  myGoodReadsApp <- httr::oauth_app("MyRTestApi", key = "7CECRDW0HnGsKmAJ8sjQ", secret = "Z8Pk4MJ4WPX1BefN6exBjkhs9vd74UfTnxDqz7LfQ")

  goodReads_token <- httr::oauth1.0_token(httr::oauth_endpoint("request_token", "authorize", "access_token",
                                                               base_url = "https://www.goodreads.com/oauth"),
                                      myGoodReadsApp,
                                      as_header = T, cache = T)
  return(goodReads_token)
}
# scope = "https://www.goodreads.com/api/auth_user",
# as <- goodReads_auth("7CECRDW0HnGsKmAJ8sjQ", "Z8Pk4MJ4WPX1BefN6exBjkhs9vd74UfTnxDqz7LfQ")
# yFXierFQ5ZFpwKJwDN7xA
