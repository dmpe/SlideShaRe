# oauth_signature <- function(url, method = "GET", app, token = NULL, token_secret = NULL,
#                             private_key = NULL, ...) {
#   if (!is.null(private_key)) {
#     signature_method <- "RSA-SHA1"
#   } else {
#     signature_method <- "HMAC-SHA1"
#   }
#   method <- toupper(method)
#
#   url2 <- parse_url(url)
#   base_url <- build_url(url2[c("scheme", "hostname", "port", "url", "path")])
#
#   oauth <- compact(list(
#     oauth_consumer_key = app$key,
#     oauth_nonce = nonce(),
#     oauth_signature_method = signature_method,
#     oauth_timestamp = as.integer(Sys.time()),
#     oauth_version = "1.0",
#     oauth_token = token
#   ))
#
#   other_params <- list(...)
#   if (length(other_params) > 0) {
#     names(other_params) <- paste0("oauth_", names(other_params))
#     oauth <- c(oauth, other_params)
#   }
#
#   # Collect params, oauth_encode, sort and concatenated into a single string
#   params <- c(url$query, oauth)
#   params_esc <- stats::setNames(oauth_encode(params), oauth_encode(names(params)))
#   params_srt <- sort_names(params_esc)
#   params_str <- paste0(names(params_srt), "=", params_srt, collapse = "&")
#
#   base_string <- paste0(method, "&", oauth_encode(base_url), "&",
#                         oauth_encode(params_str))
#
#   # Generate signature
#   if (signature_method == "HMAC-SHA1") {
#     private_key <- paste0(oauth_encode(app$secret), "&", oauth_encode(token_secret))
#   }
#   oauth$oauth_signature <- sha1_hash(private_key, base_string, signature_method)
#
#   sort_names(oauth)
# }
#
# #' @rdname oauth_signature
# #' @export
# oauth_header <- function(info) {
#   oauth <- paste0("OAuth ", paste0(
#     oauth_encode(names(info)), "=\"", oauth_encode(info), "\"", collapse = ", "))
#   add_headers(Authorization = oauth)
# }
#
# oauth_encode <- function(x) vapply(x, oauth_encode1, character(1))
#
# # As described in http://tools.ietf.org/html/rfc5849#page-29
# oauth_encode1 <- function(x) {
#   encode <- function(x) paste0("%", toupper(as.character(charToRaw(x))))
#
#   x <- as.character(x)
#   chars <- strsplit(x, "")[[1]]
#   ok <- !str_detect(chars, "[^A-Za-z0-9_.~-]")
#
#   if (all(ok)) return(x)
#
#   chars[!ok] <- unlist(lapply(chars[!ok], encode))
#   paste0(chars, collapse = "")
# }
