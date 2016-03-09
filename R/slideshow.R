#' @title Get Slideshow Information
#'
#' @param slideshow_url - URL of presentation
#' @param exclude_tags - Exclude tags from the detailed information. 1 to exclude.
#' @param detailed - Whether or not to include optional information.
#' 1 to include, 0 (default) for basic information.
#' @param get_transcript - 0 (default) or 1 to include
#'
#' @examples
#' slideshow <- get_slideshow(slideshow_url = "http://www.slideshare.net/EdithYeung/8-tips-for-scaling-mobile-users-in-china-by-edith-yeung/")
#'
#' @import httr
#' @import xml2
#'
#' @export
get_slideshow <- function(slideshow_url = "",
                          username = auth_username(NULL),
                          password = auth_password(NULL), exclude_tags = 1,
                          detailed = 1, get_transcript = 1) {

  queryarg = list(slideshow_url = slideshow_url, password = password,
                  api_key = auth_api_key(NULL), detailed = detailed,
                  get_transcript = get_transcript, exclude_tags = exclude_tags,
                  hash = hash_concat(), ts = unix_timestamp())

  url_response <- httr::GET(url = api_calls()[4], query = queryarg)
  httr::stop_for_status(url_response)
  raw_xml_content <- read_xml(content(url_response, as = "raw"))

  df <- cbind(
  id <- xml_text(xml_find_all(raw_xml_content, "//ID")),
  title <- xml_text(xml_find_all(raw_xml_content, "//Title")),
  desc <- xml_text(xml_find_all(raw_xml_content, "//Description")),
  status <- xml_text(xml_find_all(raw_xml_content, "//Status")),
  un <- xml_text(xml_find_all(raw_xml_content, "//Username")),
  url <- xml_text(xml_find_all(raw_xml_content, "//URL")),
  thumbnailURL <- xml_text(xml_find_all(raw_xml_content, "//ThumbnailURL")),
  thumbnailSize <- xml_text(xml_find_all(raw_xml_content, "//ThumbnailSize")),
  thumbnailSmallURL <- xml_text(xml_find_all(raw_xml_content, "//ThumbnailSmallURL")),
  thumbnailXLargeURL <- xml_text(xml_find_all(raw_xml_content, "//ThumbnailXLargeURL")),
  thumbnailXXLargeURL <- xml_text(xml_find_all(raw_xml_content, "//ThumbnailXXLargeURL")),
  embed <- xml_text(xml_find_all(raw_xml_content, "//Embed")),
  created <- xml_text(xml_find_all(raw_xml_content, "//Created")),
  updated <- xml_text(xml_find_all(raw_xml_content, "//Updated")),
  language <- xml_text(xml_find_all(raw_xml_content, "//Language")),
  format <- xml_text(xml_find_all(raw_xml_content, "//Format")),
  downl <- xml_text(xml_find_all(raw_xml_content, "//Download")),
  downlURL <- xml_text(xml_find_all(raw_xml_content, "//DownloadUrl")),
  secretKey <- xml_text(xml_find_all(raw_xml_content, "//SecretKey")),
  slideshowEmbedUrl <- xml_text(xml_find_all(raw_xml_content, "//SlideshowEmbedUrl"))
  )
  return(df)
}
