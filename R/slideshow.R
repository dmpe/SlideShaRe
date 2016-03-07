#' @title Returns user tags
#'
#' @param slideshow_id - either slideshow_id or its URL in slideshow_url.
#' If both are set, slideshow_id takes precedence.
#' @param slideshow_url - URL of presentation
#' @param exclude_tags - Exclude tags from the detailed information. 1 to exclude.
#' @param detailed - Whether or not to include optional information.
#' 1 to include, 0 (default) for basic information.
#' @param get_transcript - 0 (default) or 1 to include
#'
#' @examples
#' slideshow <- get_slideshow(slideshow_id = "13343768")
#'
#' @import httr
#' @import xml2
#'
#' @export
get_slideshow <- function(slideshow_id, slideshow_url, username = auth_username(NULL),
                          password = auth_password(NULL), exclude_tags = 0,
                          detailed = 0, get_transcript = 0){

  queryarg = list(slideshow_id = slideshow_id, password = password,
                  api_key = auth_api_key(NULL), detailed = detailed,
                  get_transcript = get_transcript, exclude_tags = exclude_tags,
                  hash = hash_concat(), ts = unix_timestamp())

  url_response <- httr::GET(url = api_calls()[4], query = queryarg)
  httr::stop_for_status(url_response)
  raw_xml_content <- read_xml(content(url_response, as = "raw"))

  id <- xml_find_all(raw_xml_content, "//ID")
  title <- xml_find_all(raw_xml_content, "//Title")
  desc <- xml_find_all(raw_xml_content, "//Description")
  status <- xml_find_all(raw_xml_content, "//Status")
  un <- xml_find_all(raw_xml_content, "//Username")
  url <- xml_find_all(raw_xml_content, "//URL")
  thumbnailURL <- xml_find_all(raw_xml_content, "//ThumbnailURL")
  thumbnailSize <- xml_find_all(raw_xml_content, "//ThumbnailSize")
  thumbnailSmallURL <- xml_find_all(raw_xml_content, "//ThumbnailSmallURL")
  thumbnailXLargeURL <- xml_find_all(raw_xml_content, "//ThumbnailXLargeURL")
  thumbnailXXLargeURL <- xml_find_all(raw_xml_content, "//ThumbnailXXLargeURL")
  embed <- xml_find_all(raw_xml_content, "//Embed")
  created <- xml_find_all(raw_xml_content, "//Created")
  updated <- xml_find_all(raw_xml_content, "//Updated")
  language <- xml_find_all(raw_xml_content, "//Language")
  format <- xml_find_all(raw_xml_content, "//Format")
  downl <- xml_find_all(raw_xml_content, "//Download")
  downlURL <- xml_find_all(raw_xml_content, "//DownloadUrl")
  secretKey <- xml_find_all(raw_xml_content, "//SecretKey")
  slideshowEmbedUrl <- xml_find_all(raw_xml_content, "//SlideshowEmbedUrl")

  tag_count <- xml_attr(xml_children(raw_xml_content), "Count")

  tag <- trimws(xml_text(tag))
}
