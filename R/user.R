#' @title Returns user favorites
#'
#' @examples
#' asdqwdq <- get_user_favorite(username_for = "F789GH")
#'
#' @import httr
#' @import xml2
#'
#' @export
get_user_favorite <- function(username_for = "") {

  queryarg = list(username_for = username_for,
                  api_key = auth_api_key(NULL),
                  hash = hash_concat(), ts = unix_timestamp())

  url_response <- httr::GET(url = api_calls()[1], query = queryarg)
  stop_for_status(url_response)
  raw_xml_content <- read_xml(content(url_response, as = "raw"))

  slideshow_id <- xml_find_all(raw_xml_content, "//slideshow_id")
  tag_text <- xml_find_all(raw_xml_content, "//tag_text")

  slideshow_id <- trimws(xml_text(slideshow_id))
  tag_text <- trimws(xml_text(tag_text))

  if (length(slideshow_id) == 0 || length(tag_text) == 0) {
    stop("User does not have any favorites")
  }

  return(cbind(slideshow_id, tag_text))
}
