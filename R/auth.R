#' @title SlideShare authentication
#'
#' @examples
#' options(API_key = "nRWFyyZI", Shared_Secret = "dmvSBNkR")
#'
#' @export
auth_api_key <- function(x) {
  tmp <- if(is.null(x)) {
    Sys.getenv("API_key", "")
  } else x

  if(tmp == "") {
    getOption("API_key", stop("you need to set up your SlideShare API key"))
  } else tmp
}

#' @rdname auth_api_key
#' @export
auth_shared_secret <- function(x) {
  tmp <- if(is.null(x)) {
    Sys.getenv("Shared_Secret", "")
  } else x

  if(tmp == "") {
    getOption("Shared_Secret",  stop("you need to set up your Shared Secret key"))
  } else tmp
}

#' @rdname auth_api_key
#' @export
auth_username <- function(x) {
  tmp <- if(is.null(x)) {
    Sys.getenv("username", "")
  } else x

  if(tmp == "") {
    getOption("username", stop("you need to set up username"))
  } else tmp
}


#' @rdname auth_api_key
#' @export
auth_password <- function(x) {
  tmp <- if(is.null(x)) {
    Sys.getenv("password", "")
  } else x

  if(tmp == "") {
    getOption("password", stop("you need to set up password"))
  } else tmp
}

#' @rdname auth_api_key
#' @export
authentication_slideshare <- function() {
  cat("  Your SlideShare API key is:", auth_api_key(NULL))
  cat("\n  Your Shared Secret key is:", auth_shared_secret(NULL))
}


