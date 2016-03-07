#' @title Returns user favorites
#'
#' @examples
#' asdqwdq <- get_user_favorite(username_for = "rashmi")
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


#' @title Returns user contacts
#'
#' @examples
#' asdqwdq <- get_user_contacts(username_for = "rashmi")
#'
#' @import httr
#' @import xml2
#'
#' @export
get_user_contacts <- function(username_for = "", limit = NULL, offset = NULL) {

  queryarg = list(username_for = username_for, limit = limit, offset = offset,
                  api_key = auth_api_key(NULL),
                  hash = hash_concat(), ts = unix_timestamp())

  url_response <- httr::GET(url = api_calls()[2], query = queryarg)
  httr::stop_for_status(url_response)
  raw_xml_content <- read_xml(content(url_response, as = "raw"))

  username <- xml_find_all(raw_xml_content, "//Username")
  numSlideshows <- xml_find_all(raw_xml_content, "//NumSlideshows")
  numComments <- xml_find_all(raw_xml_content, "//NumComments")

  username <- trimws(xml_text(username))
  numSlideshows <- trimws(xml_text(numSlideshows))
  numComments <- trimws(xml_text(numComments))

  if (length(username) == 0 || length(numSlideshows) == 0) {
    stop("User does not have any contacts")
  }

  return(cbind(username, numSlideshows, numComments))
}


#' @title Returns user tags
#'
#' @examples
#' asdqwdq <- get_user_tags(username = "f789gh", password = "")
#'
#' @import httr
#' @import xml2
#'
#' @export
get_user_tags <- function(username = auth_username(NULL), password = auth_password(NULL)) {

  queryarg = list(username = username, password = password,
                  api_key = auth_api_key(NULL),
                  hash = hash_concat(), ts = unix_timestamp())

  url_response <- httr::GET(url = api_calls()[3], query = queryarg)
  httr::stop_for_status(url_response)
  raw_xml_content <- read_xml(content(url_response, as = "raw"))

  tag <- xml_find_all(raw_xml_content, "//Tag")
  tag_count <- xml_attr(xml_children(raw_xml_content), "Count")

  tag <- trimws(xml_text(tag))

  if (length(tag) == 0) {
    stop("User does not have any tags")
  }

  return(cbind(tag, tag_count))
}





