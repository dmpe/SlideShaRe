# #'
# #'
# #'
# #' key: 7CECRDW0HnGsKmAJ8sjQ
# #' secret: Z8Pk4MJ4WPX1BefN6exBjkhs9vd74UfTnxDqz7LfQ
#
# userAPIauth <- function(){
#   "https://www.goodreads.com/api/auth_user"
# }
#
#
# #' @import httr
# #' @export
# goodReads_auth <- function(key = "", secret = "") {
#
#   myGoodReadsApp <- httr::oauth_app("MyRTestApi", key = "N2xPQzGKVqWnJVeuSGZsQ", secret = "QlcmUOop2x32n4bfzOnZIJkA358nEQ15s4XcMDXc")
#   myGoodReadsEndpoints <- httr::oauth_endpoint("request_token", "authorize", "access_token", base_url = "https://www.goodreads.com/oauth")
#   goodReads_token <- httr::oauth1.0_token(myGoodReadsEndpoints, myGoodReadsApp, as_header = T, cache = F)
#
#   params <- list(permission = NULL, as_header = T)
#   # asdx <- Token1.0$new(app = myGoodReadsApp, endpoint = myGoodReadsEndpoints, params = params,private_key = NULL, cache_path = T)
#
#   oauth_sig <- function(url, method, token = NULL, token_secret = NULL, private_key = NULL, ...) {
#     oauth_header(oauth_signature(url, method, myGoodReadsApp, token, token_secret, private_key, ...,
#                                  callback = oauth_callback()))
#   }
#
#   # 1. Get an unauthorized request token
#   authssss_sig <-
#
#   response <- httr::POST(myGoodReadsEndpoints$request, oauth_sig(myGoodReadsEndpoints$request, "POST", private_key = NULL))
#   stop_for_status(response)
#   params <- content(response, type = "application/x-www-form-urlencoded")
#   token <- params$oauth_token
#   secret <- params$oauth_token_secret
#
#   # 2. Authorize the token
#   authorize_url <- modify_url(myGoodReadsEndpoints$authorize, query = list(oauth_token = token, permission = "read"))
#   verifier <- oauth_listener(authorize_url, interactive())[[1]]
#
#   # 3. Request access token
#   response2 <- POST(myGoodReadsEndpoints$access, oauth_sig(myGoodReadsEndpoints$access, "POST", token, secret,
#                                                            verifier = verifier, private_key = NULL), body = "")
#   stop_for_status(response2)
#   content(response2, type = "application/x-www-form-urlencoded")
#
#
#
#
#
#   qwer <- init_oauth1.0(myGoodReadsEndpoints, myGoodReadsApp,is_interactive =T)
#
#
#
#
#
#
#
#
#
#
#
#
#
#   return(goodReads_token)
# }
#
# # scope = "https://www.goodreads.com/api/auth_user",
# # as <- goodReads_auth("7CECRDW0HnGsKmAJ8sjQ", "Z8Pk4MJ4WPX1BefN6exBjkhs9vd74UfTnxDqz7LfQ")
# # yFXierFQ5ZFpwKJwDN7xA
